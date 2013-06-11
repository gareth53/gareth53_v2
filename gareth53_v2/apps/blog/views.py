import datetime

from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, get_list_or_404
from django.template import Context, loader

from .models import Entry, BlogCategory
from gareth53_v2.apps.common.utils import get_queryset_or_404
from gareth53_v2.apps.common.utils.paginator import DiggPaginator

def blogHub(request, page_num=0):
    if int(page_num) == 1:
        # TODO - redirect rather than 404
        return HttpResponseRedirect(u'/blog/')
    if page_num == 0:
        page_num = 1
    latest_posts = Entry.objects.filter(status=1).order_by('-pub_date')
    paginator = DiggPaginator(latest_posts, 10, body=5, padding=2)
    try:
        posts_to_display = paginator.page(page_num)
    except:
        raise Http404
    return render(request,
        'blog/home.html',
        {   'posts': posts_to_display,
            'pageTitle': "All Blog Posts"
         })


def blogCategoriesRedirect(request, slug):
    return HttpResponseRedirect(u'/blog/categories/%s/' % slug)


def blogCategories(request, slug, page_num=0):
    if int(page_num) == 1:
        return HttpResponseRedirect(u'/blog/categories/%s/' % slug)
        raise Http404
    if page_num == 0:
        page_num = 1
    category = BlogCategory.objects.get(slug=slug)
    category_posts = Entry.objects.all().filter(category=category).filter(status=1).order_by('-pub_date')
    paginator = DiggPaginator(category_posts, 10, body=5, padding=2)
    posts_to_display = paginator.page(page_num)
    if not posts_to_display:
        raise Http404
    return render(request, 'blog/category.html', {
                                    'posts': posts_to_display,
                                    'category': category,
                                    'postCount': category_posts.count() })


def blogPost(request, year, month, slug):
    month = month.lstrip('0')
    # no need to use get_queryset_or_404 method here
    this_post = get_object_or_404(Entry.objects, slug=slug, pub_date__year=year, pub_date__month=month, status=1)
    this_post_id = this_post.id
    latest_posts = Entry.objects.all().filter(status=1).order_by('-pub_date').exclude(id=this_post_id)[:4]
    paginator = DiggPaginator(latest_posts, 10, body=5, padding=2)
    posts_to_display = paginator.page(1)
    return render(request, 'blog/post.html', {'this_post': this_post, 'posts': posts_to_display})


def blogYear(request, year, page_num=0):
    if int(page_num) == 1:
        # TODO - redirect rather than 404
        return HttpResponseRedirect(u'/blog/%s/' % year)
    if page_num == 0:
        page_num = 1
    years_posts = Entry.objects.filter(pub_date__year=year, status=1).order_by('-pub_date')
    if not years_posts:
        raise Http404
    paginator = DiggPaginator(years_posts, 10, body=5, padding=2)
    try:
        posts_to_display = paginator.page(page_num)
    except:
        raise Http404
    pageTitle = 'Blogs from %s' % year 
    return render(request, 'blog/home.html', {'posts': posts_to_display, 'pageTitle': pageTitle })


def blogMonth(request, year, month, page_num=0):
    if int(page_num) == 1:
        return HttpResponseRedirect(u'/blog/%s/%s/' % (year, month))
    if page_num == 0:
        page_num = 1
    month = month.lstrip('0')
    month_posts = Entry.objects.filter(pub_date__year=year, pub_date__month=month, status=1).order_by('-pub_date')
    if not month_posts:
        raise Http404
    paginator = DiggPaginator(month_posts, 10, body=5, padding=2)
    try:
        posts_to_display = paginator.page(page_num)
    except:
        raise Http404
    firstPost = Entry.objects.filter(pub_date__year=year, pub_date__month=month)[:1]
    months = ["",
        "January", 
        "February", 
        "March", 
        "April", 
        "May", 
        "June", 
        "July", 
        "August", 
        "September", 
        "October", 
        "November", 
        "December" ]
    pageTitle = 'Blogs from %s %s' % (months[int(month)], year)
    return render(request, 'blog/home.html', {'posts': posts_to_display, 'pageTitle': pageTitle, 'firstPost': firstPost })
