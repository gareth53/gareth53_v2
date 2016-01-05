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
    elif request.GET.get('data', ''):
        items = json.loads(request.GET.get('data', '')).get('items', [])
        ctxt.update({
            'form': NetflixForm(extra=items)
        })
    return render(request, 'netflix/items_create.html', ctxt)    
