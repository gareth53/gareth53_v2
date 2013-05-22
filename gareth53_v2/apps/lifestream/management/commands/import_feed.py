import datetime
from optparse import make_option
import urllib2, feedparser

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
        verbose = options.get('verbose', '')
        auth = None
        if slug:
            source = Source.objects.get(slug=slug)
        else:
            # gets the most stale feed
            source = Source.objects.filter(url__isnull=False).order_by('last_check')[0]
        if source.username and source.password:
            auth = urllib2.HTTPBasicAuthHandler()
            # Add password information: realm, host, user, password.
            auth.add_password(source.name, get_domain(source.url), source.username, source.password)
            contents = feedparser.parse(source.url, handlers=[auth])            
        else:
            contents = feedparser.parse(source.url)
        if verbose:
            print "Processing feed for %s" % source.name
        create_items(source, contents)

def get_domain(full_url):
    url = full_url.replace('http://', '')
    return url[0:url.find('/')]
    