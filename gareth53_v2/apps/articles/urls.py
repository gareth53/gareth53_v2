from django.conf.urls import patterns
from .views import ArticlePage

urlpatterns = patterns('',
     (r'^(?P<slug>[\w\-]+).html$', ArticlePage),
)