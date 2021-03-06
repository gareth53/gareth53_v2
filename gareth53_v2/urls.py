from django.conf.urls import include, url
from django.contrib import admin

admin.autodiscover()

urlpatterns = [
    # Examples:
    # url(r'^$', 'gareth53_v2.views.home', name='home'),
    url(r'^', include('gareth53_v2.apps.lifestream.urls')),
    url(r'^', include('gareth53_v2.apps.articles.urls')),
    url(r'^blog/', include('gareth53_v2.apps.blog.urls')),
    url(r'^mixcloud/', include('gareth53_v2.apps.mixcloud.urls')),
    url(r'^netflix/', include('gareth53_v2.apps.netflix.urls')),
    url(r'^garmin/', include('gareth53_v2.apps.garmin.urls')),
    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # admin:
    url(r'^admin/', include(admin.site.urls)),
]
