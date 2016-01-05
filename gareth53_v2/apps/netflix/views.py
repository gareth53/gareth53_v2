import json
from datetime import datetime 

from django.shortcuts import render

from gareth53_v2.apps.lifestream.models import Source, Item
from .forms import NetflixForm

def item_form(request):
    ctxt = {
        'form': NetflixForm()
    }
    if request.POST:
        createds = []
        duplicates = []
        data = request.POST
        source = Source.objects.get(name='Netflix')
        item_count = int(data.get('items', '1'))
        for x in range(1, item_count+1):
            pub_date = datetime.strptime(data['pub_date%d' % x], '%Y-%m-%dT%H:%M')
            # TODO: add domain name if URL is just a path
            item, created = Item.objects.get_or_create(feed=source,
                                                       title=data['title%d' % x],
                                                       url=data['url%d' % x],
                                                       pub_date=pub_date)
            if created:
                createds.append(item)
            else:
                duplicates.append(item)
        ctxt.update({
            'createds': createds,
            'duplicates': duplicates
            })
    elif request.GET:
        data = request.GET
        item_count = int(data.get('items', 0))
        if item_count:
            items = []
            for x in xrange(1, item_count+1):
                items.append({
                    'title': data.get('title%s' % x, None),
                    'pub_date': data.get('pub_date%s' % x, None),
                    'url': data.get('url%s' % x, None)
                })
            ctxt.update({
                'form': NetflixForm(extra=items)
            })
    return render(request, 'netflix/items_create.html', ctxt)