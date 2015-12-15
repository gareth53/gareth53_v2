from django.contrib.auth.models import User, Group
from .models import Item, Source
from rest_framework import serializers


class ItemSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Item
        fields = ('pk', 'feed', 'url', 'title', 'pub_date', 'author','description', 'guid')


class SourceSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Source
        fields = ('pk', 'name', 'slug', 'url', 'last_check', 'last_update','image', 
        			'description', 'profile')