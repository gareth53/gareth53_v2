from django.conf.urls.defaults import *
from django.contrib.syndication.feeds import Feed

from .views import *
from .models import Entry, BlogCategory
from .feeds import *

feeds = {
    'posts': AllPosts,
    'categories' : CategorisedPosts,
}

urlpatterns = patterns('',
     (r'^$', blogHub),
     (r'^(?P<page_num>\d).html$', blogHub),
     (r'^(?P<year>(\d{4}))/(?P<month>(\d{2}))/$', blogMonth),
     (r'^(?P<year>(\d{4}))/(?P<month>(\d{2}))/(?P<page_num>\d).html$', blogMonth),
     (r'^(?P<year>(\d{4}))/$', blogYear),
     (r'^(?P<year>(\d{4}))/(?P<page_num>\d).html$', blogYear),
     (r'^(?P<year>(\d{4}))/(?P<month>(\d{2}))/(?P<slug>[\w\-]+).html$', blogPost),
     (r'^categories/(?P<slug>[\w\-]+).html$', blogCategoriesRedirect),
     (r'^categories/(?P<slug>[\w\-]+)/$', blogCategories),
     (r'^categories/(?P<slug>[\w\-]+)/(?P<page_num>\d).html$', blogCategories),
     (r'^rss/(?P<url>.*).xml$', 'django.contrib.syndication.views.feed', {'feed_dict': feeds}),
     (r'^rss/(?P<url>.*)/(?P<slug>[\w\-]+).xml$', 'django.contrib.syndication.views.feed', {'feed_dict': feeds}),
)