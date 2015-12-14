from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from .models import Item, Source
from .serializers import ItemSerializer, SourceSerializer


class ItemViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows Items to be viewed or edited.
    """
    queryset = Item.objects.all().order_by('-pub_date')
    serializer_class = ItemSerializer


class SourceViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows Sources to be viewed or edited.
    """
    queryset = Source.objects.all().order_by('-last_update')
    serializer_class = SourceSerializer
