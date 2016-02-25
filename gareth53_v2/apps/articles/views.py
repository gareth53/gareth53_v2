from django.http import HttpResponse, Http404, HttpResponseNotFound
from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.shortcuts import render

from .models import Article

def ArticlePage(request, slug):
    this_post = get_object_or_404(Article.objects, slug=slug, status=1)
    return render(request, 'articles/article.html', {
                'this_article': this_post,
                'site': 'www.gareth53.co.uk',
                'request': request
            })
