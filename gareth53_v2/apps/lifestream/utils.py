import datetime, logging, re

from django.utils import timezone
from django.template.defaultfilters import slugify

from gareth53_v2.apps.lifestream.models import Source, Item

logger = logging.getLogger(__name__)


def create_items(source, contents):
    """
    takes a source and a feedpoarser dict as arguments 
    and then creates items based on the dict
    """
    
    # TODO - think about items that we've already harvested but may have been deleted...?
    
    items_created = 0
    for counter, itemdict in enumerate(contents['entries']):
        # make a temp dict, with blank values for defaults
        item = {}

        for keystr in ['link', 'title', 'published_parsed', 'description', 'id', 'published']:
            item[keystr] = getattr(itemdict, keystr, '')

        pub_date = parse_date(item)

        if counter == 0:
            source.last_update = pub_date

        source.last_check = timezone.make_aware(datetime.datetime.now(), timezone.get_default_timezone())
        source.save()

        new_item, created = Item.objects.get_or_create(feed=source, url=item['link'])
        if created:
            new_item.slug = "%s-%s" % (new_item.pk, slugify(item['title']))
            new_item.guid = item['id']
            items_created += 1
        # update recent items, in case they've changed
        new_item.title = item['title']
        new_item.pub_date = pub_date
        new_item.description = item['description']
        # TODO, add tags, where available?
        new_item.save()
        # don't re-parse the entire feed if we've had no updates
        if counter - items_created > 3:
            logger.info("Feed stale, curtailing parse: %s" % source.url)
            break

    logger.info("Feed parsed: %s" % source.url)
    logger.info("%d items created" % items_created)


def parse_date(item):
    datedict = item['published_parsed']
    parsed = datetime.datetime(
        year = datedict.tm_year,
        month = datedict.tm_mon,
        day = datedict.tm_mday,
        hour = datedict.tm_hour,
        minute = datedict.tm_min,
        second = datedict.tm_sec,
        microsecond = 0,
    )
    return timezone.make_aware(parsed, timezone.get_default_timezone())


def get_gmt_offset(datestring):
    last_bit = datestring.split(' ')[-1]
    if re.compile('^[A-Z]{2,3}$').match(last_bit):
        return last_bit
    return None

    
def get_timezone(datestring):
    last_bit = datestring.split(' ')[-1]
    if re.compile('^[+-][0-9]{4}$').match(last_bit):
        return last_bit
    return None


def group_items(items):
    """
    I want to group itms by DAY of pub_date and then by type, a list of objects
    the look something like this:
    {
        'date': <dateObject>,
        'sources': [
            {
                source: <sourceObject>,
                items: <item QuerySet ordered by date>
            }
        ]
    },
    """
    # TODO investigate use of itertools as an alternative to looping
    returnObj = {}
    for item in items:
        dateStr = item.pub_date.strftime('%y-%m-%d')
        # get the date-keyed obj, or create new
        try:
            dateObj = returnObj[dateStr]
        except KeyError:
            dateObj = {
                'date': item.pub_date.replace(hour=0, minute=0, second=0, microsecond=0),
                'sources': {}
            }
        # get source-keyed list
        try:
            source = dateObj['sources'][item.feed]
        except KeyError:
            source = []
        # append items and put it back
        source.append(item)
        dateObj['sources'][item.feed] = source
        returnObj[dateStr] = dateObj
    # before we return the object, we need to handle the ordering
    return_list = []
    for key in returnObj.keys():
        val = returnObj[key]
        source_tree = []
        for source in val['sources'].keys():
            source_tree.append({ 'source': source, 'items': val['sources'][source] })
        return_list.append({
            'date': val['date'],
            'sources': source_tree
        })
    return_list.sort(key=lambda item: item['date'])
    return_list.reverse()
    return return_list
