from django.conf.urls import patterns, include, url
from rest_framework import routers

from .views import source_list, item_list, source, item
from .views_api import ItemViewSet

router = routers.DefaultRouter()
router.register(r'items', ItemViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    url(r'^', include(router.urls)),
#    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]


urlpatterns = patterns('',
    url(r'^api/1.0/', include(router.urls)),
    url(r'^$', item_list, name='root'),
    url(r'^sources/$', source_list, name='sources'),
    url(r'^sources/(?P<source_slug>[A-Za-z0-9\-]+)/$', source, name='source'),
    url(r'^sources/(?P<source_slug>[A-Za-z0-9\-]+)/(?P<item_slug>[A-Za-z0-9\-]+)/$', item, name='item'),
)
