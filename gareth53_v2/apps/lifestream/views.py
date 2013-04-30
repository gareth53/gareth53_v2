from django.views.generic.list import ListView
from django.views.generic.base import TemplateView
from django.shortcuts import render
#from django.views.generic import DetailView
from .models import Source, Item

def source_list(request):
    context = {
        'sources': Source.objects.filter(active=True)
    }
    return render(request, 'lifestream/source_list.html', context)


def item_list(request):
    sources = Source.objects.filter(active=True).order_by('-last_update')
    if sources:
        sources_subset = sources[0:10]
    subset = False
    if len(sources_subset) < len(sources):
        subset = True
    context = {
        'sources': sources_subset,
        'subset': subset,
        'items': Item.objects.all()
    }
    return render(request, 'lifestream/root.html', context)

def source(request, source_slug):
    source = Source.objects.get(slug=source_slug, active=True)
    context = {
        'source': source,
        'items': Item.objects.filter(feed=source)
    }
    return render(request, 'lifestream/source.html', context)


def item(request, source_slug, item_slug):
    source = Source.objects.get(slug=source_slug, active=True)
    context = {
        'source': source,
        'item': Item.objects.get(feed=source, slug=item_slug)
    }
    return render(request, 'lifestream/item.html', context)