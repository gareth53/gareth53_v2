from django.conf.urls import url
from django.contrib.syndication.views import Feed

from .views import *
from .models import Entry, BlogCategory
from .feeds import *

feeds = {
    'posts': AllPosts,
    'categories' : CategorisedPosts,
}

urlpatterns = [
     url(r'^$', blogHub),
     url(r'^(?P<page_num>\d).html$', blogHub),
     url(r'^(?P<year>(\d{4}))/(?P<month>(\d{2}))/$', blogMonth),
     url(r'^(?P<year>(\d{4}))/(?P<month>(\d{2}))/(?P<page_num>\d).html$', blogMonth),
     url(r'^(?P<year>(\d{4}))/$', blogYear),
     url(r'^(?P<year>(\d{4}))/(?P<page_num>\d).html$', blogYear),
     url(r'^(?P<year>(\d{4}))/(?P<month>(\d{2}))/(?P<slug>[\w\-]+).html$', blogPost),
     url(r'^categories/(?P<slug>[\w\-]+).html$', blogCategories),
     url(r'^categories/(?P<slug>[\w\-]+)/(?P<page_num>\d).html$', blogCategories),
     url(r'^rss/posts.xml$', AllPosts()),
     url(r'^rss/(?P<cat_slug>.*).xml$', CategorisedPosts()),
#     (r'^rss/(?P<url>.*)/(?P<slug>[\w\-]+).xml$', Feed, {'feed_dict': feeds}),
]