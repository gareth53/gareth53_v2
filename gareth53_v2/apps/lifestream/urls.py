from django.conf.urls import patterns, include, url
from rest_framework import routers

from .views import source_list, item_list, source, item
from .views_api import ItemViewSet, SourceViewSet

router = routers.DefaultRouter()
router.register(r'items', ItemViewSet)
router.register(r'sources', SourceViewSet)

urlpatterns = patterns('',
    url(r'^api/1.0/', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^$', item_list, name='root'),
    url(r'^sources/$', source_list, name='sources'),
    url(r'^sources/(?P<source_slug>[A-Za-z0-9\-]+)/$', source, name='source'),
    url(r'^sources/(?P<source_slug>[A-Za-z0-9\-]+)/(?P<item_slug>[A-Za-z0-9\-]+)/$', item, name='item'),
)
