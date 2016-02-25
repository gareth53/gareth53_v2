from datetime import datetime 

from django.views.generic.list import ListView
from django.views.generic.base import TemplateView
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from .models import Source, Item
from .utils import group_items, update_grouping

def source_list(request):
    context = {
        'sources': Source.objects.filter(active=True)
    }
    return render(request, 'lifestream/source_list.html', context)

def item_list(request):
    # TODO: if source is inactive return a 410
    # TODO: get_object_or_404
    sources = Source.objects.filter(active=True).order_by('-last_update')
    if sources:
        sources_subset = sources[0:5]
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
        'paginator': paginator,
        'now': datetime.now()
    }
    return render(request, 'lifestream/root.html', context)


def source(request, source_slug):
    # TODO: if source is inactive return a 410
    # TODO: get_object_or_404
    source = Source.objects.get(slug=source_slug)
    items = Item.objects.filter(feed=source)
    paginator = Paginator(items, 100)
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
    # TODO - are these items likely to be clustered so multiple 
    # occurrences appear on a single day? this should affect layout
    grouping = update_grouping(curr_page.object_list)
    context = {
        'source': source,
        'paginator': paginator,
        'items': curr_page.object_list,
        'grouping': grouping,
        'curr_page': curr_page
    }
    return render(request, 'lifestream/source.html', context)


def item(request, source_slug, item_slug):
    # TODO: if source is inactive return a 410
    # TODO: get_object_or_404
    source = Source.objects.get(slug=source_slug, active=True)
    item = Item.objects.get(feed=source, slug=item_slug)
    context = {
        'source': source,
        'item': item 
    }
    return render(request, 'lifestream/item.html', context)