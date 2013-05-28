from django.contrib.syndication.views import Feed
from django.contrib.syndication.views import FeedDoesNotExist
from django.contrib.sites.models import Site

from .models import Entry, BlogCategory
from django.conf import settings

class AllPosts(Feed):
    title = "%s - Latest Blog Posts" % Site.objects.get(id=settings.SITE_ID).name
    link = "/blog/"
    description = "Ramblings and random thoughts from the brainium of Gareth Senior"

    def items(self):
        return Entry.objects.filter(status=1).order_by('-pub_date')[:10]

class CategorisedPosts(Feed):
    def get_object(self, bits):
        # In case of "/rss/categories/blah/foo/bar/baz/", or other such clutter,
        # check that bits has only one member.
        if len(bits) != 1:
            raise ObjectDoesNotExist
        return BlogCategory.objects.get(slug__exact=bits[0])

    def title(self, obj):
        return "%s - Latest Blog Posts with category '%s'" % (Site.objects.get(id=settings.SITE_ID).name, obj.title)

    def link(self, obj):
        if not obj:
            raise FeedDoesNotExist
        return u'http://%s/blog/categories/%s' % (Site.objects.get(id=settings.SITE_ID).domain, obj.slug)

    def description(self, obj):
        return "Ramblings and random thoughts about '%s' from the brainium of Gareth Senior" % "stuff" # obj.BlogCategory

    def items(self, obj):
        return Entry.objects.filter(category__id__exact=obj.id, status=1).order_by('-pub_date')[:10]