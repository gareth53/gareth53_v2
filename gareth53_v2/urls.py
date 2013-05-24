from django.conf.urls import patterns, include, url
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'gareth53_v2.views.home', name='home'),
    url(r'^', include('gareth53_v2.apps.lifestream.urls')),
    url(r'^', include('gareth53_v2.apps.articles.urls')),
    # TODO, support legect blog URLs

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # admin:
    url(r'^admin/', include(admin.site.urls)),
)
