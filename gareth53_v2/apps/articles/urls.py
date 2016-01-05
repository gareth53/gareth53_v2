from django.conf.urls import url
from .views import ArticlePage

urlpatterns = [
     url(r'^(?P<slug>[\w\-]+).html$', ArticlePage),
]