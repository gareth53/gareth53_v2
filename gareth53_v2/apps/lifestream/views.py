from django.views.generic.list import ListView
from django.views.generic.base import TemplateView
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from .models import Source, Item
from .utils import group_items

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
    paginator = Paginator(Item.objects.all(), 100)
    try:
        page_no = request.GET['page'] or 1
    except KeyError:
        page_no = 1
    try:
        curr_page = paginator.page(page_no)
    except EmptyPage, PageNotAnInteger:
        # If page is not an integer or page is out of range (e.g. 9999) deliver first page.
        # TODO: return a 404 error
        curr_page = paginator.page(1)

    items = group_items(curr_page.object_list)

    context = {
        'sources': sources_subset,
        'subset': subset,
        'items': curr_page.object_list,
        'grouped_items': items,
        'curr_page': curr_page,
        'paginator': paginator
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