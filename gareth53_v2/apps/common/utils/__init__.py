from django.http import HttpResponse, Http404
from django.db.models.manager import Manager
from django.db.models.query import QuerySet
from django.shortcuts import _get_queryset

def get_queryset_or_404(klass, *args, **kwargs):
    """
    This is an alternative for get_list_or_404 in django.shortcuts
    For when you need to handle results using sort_by(), filter(), exclude() ...etc...

    klass may be a Model, Manager, or QuerySet object. All other passed
    arguments and keyword arguments are used in the filter() query.
    """
    queryset = _get_queryset(klass)
    obj_queryset = queryset.filter(*args, **kwargs)
    if not obj_queryset.count() > 0:
        raise Http404('No %s matches the given query.' % queryset.model._meta.object_name)
    return obj_queryset