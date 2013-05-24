from django.conf.urls.defaults import *
from .views import *
from .models import Article

urlpatterns = patterns('',
     (r'^(?P<slug>[\w\-]+).html$', ArticlePage),
)