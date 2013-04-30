from django.conf.urls import patterns, include, url

from .views import source_list, item_list, source, item

urlpatterns = patterns('',
    url(r'^$', item_list, name='root'),
    url(r'^sources/$', source_list, name='sources'),
    url(r'^sources/(?P<source_slug>[A-Za-z0-9\-]+)/$', source, name='source'),
    url(r'^sources/(?P<source_slug>[A-Za-z0-9\-]+)/(?P<item_slug>[A-Za-z0-9\-]+)/$', item, name='item'),
)
