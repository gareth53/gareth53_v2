from django.conf.urls import include, url

from .views import item_form

urlpatterns = [
    url(r'^items/create/$', item_form, name='item_form'),
]