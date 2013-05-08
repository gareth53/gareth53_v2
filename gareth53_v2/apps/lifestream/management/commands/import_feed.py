import feedparser
import datetime
from optparse import make_option

from django.core.management.base import NoArgsCommand

from gareth53_v2.apps.lifestream.models import Source
from gareth53_v2.apps.lifestream.utils import create_items

class Command(NoArgsCommand):
    
    help=("Imports RSS feed data")

    option_list = NoArgsCommand.option_list + (
        make_option('--verbose', action='store_true'),
        make_option('--slug', action='store', type='string')
    )
   
    def handle_noargs(self, **options):
        slug = options.get('slug', '')
        if slug:
            source = Source.objects.get(slug=slug)
        else:
            # gets the most stale feed
            source = Source.objects.filter(url__isnull=False).order_by('last_check')[0]
        # TODO - handle RSS feeds that require authentication
        contents = feedparser.parse(source.url)
        create_items(source, contents)

