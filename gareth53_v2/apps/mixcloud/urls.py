from django.conf.urls import url

from .feeds import MixcloudFavouritesFeed, MixcloudListensFeed

urlpatterns = [
    url(r'gareth53/favourites/', MixcloudFavouritesFeed()),
    url(r'gareth53/listens/', MixcloudListensFeed())
]