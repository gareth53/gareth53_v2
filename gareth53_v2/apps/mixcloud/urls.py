from django.conf.urls import patterns, url

from .feeds import MixcloudFavouritesFeed, MixcloudListensFeed

urlpatterns = patterns('',
    url(r'gareth53/favourites/', MixcloudFavouritesFeed()),
    url(r'gareth53/listens/', MixcloudListensFeed())
)