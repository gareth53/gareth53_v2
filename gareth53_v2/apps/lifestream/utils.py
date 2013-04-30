import datetime

from django.template.defaultfilters import slugify

from gareth53_v2.apps.lifestream.models import Source, Item


def create_items(source, contents):
    """
    takes a source and a feedpoarser dict as arguments 
    and then creates items based on the dict
    """
    
    # TODO - think about items that we've already harvested but may have been deleted...
    
    items_created = 0
    loop = 0
    for itemdict in contents['entries']:
        # make a temp dict, with blank values for defaults
        item = {}
        for keystr in ['link', 'title', 'published_parsed', 'description', 'id']:
            item[keystr] = getattr(itemdict, keystr, '')
        pub_date = parse_datedict(item['published_parsed'])
        if loop == 0:
            source.last_update = pub_date
        source.last_check = datetime.datetime.now()
        source.save()
        new_item, created = Item.objects.get_or_create(feed=source, url=item['link'])
        if created:
            items_created += 1
        # we update recent items, in case they've changed
        new_item.title = item['title']
        new_item.pub_date = pub_date
        new_item.description = item['description']
        # TODO, add tags, where available
        new_item.slug = "%s-%s" % (new_item.pk, slugify(item['title']))
        new_item.guid = item['id']
        new_item.save()
        # TODO use an enumerated for loop
        loop = loop + 1
        # dont' re-parse the entire feed if we've had no updates
        if loop - items_created > 3:
            break
    # TODO: use logging
    print "Feed parsed: %s" % source.url
    print "%d items created" % items_created


def parse_datedict(date):
    """
    takes feedparser's published_parsed citinary and returns a datetime object
    dir(date) returns
        'tm_hour', 'tm_isdst', 'tm_mday', 'tm_min', 'tm_mon', 'tm_sec', 'tm_wday', 'tm_yday', 'tm_year
    }
    """
    # TODO, handle timezones?
    return datetime.datetime(
        day = date.tm_mday,
        month = date.tm_mon,
        year = date.tm_year,
        hour = date.tm_hour,
        minute = date.tm_min,
        second = date.tm_sec,
        microsecond=0
    )


def parse_datestring(string):
    """
    parse the string from the feed into a datetime object
    date formats could be:
        "Sun, 19 Apr 2002 02:01:09 +0000"
        "Sun, 19 Apr 2002 22:01:09 GMT"
    """
    # TODO: write tests
    try:
        return datetime.datetime.strptime(item['published'], "%a, %d %b %Y %H:%M:%S %Z")
    except ValueError:
        # %z for identifying GMT offset is a bad directive in strftime... so, some legwork.
        date_str = " ".join(string.split(' ')[:-1])
        try:
            return datetime.datetime.strptime(date_str, "%a, %d %b %Y %H:%M:%S")
        except ValueError:
            # default to now
            return datetime.datetime.now()