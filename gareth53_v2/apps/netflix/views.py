import json
from datetime import datetime 

from django.shortcuts import render
from django.contrib.auth.decorators import login_required

from gareth53_v2.apps.lifestream.models import Source, Item
from .forms import NetflixForm


@login_required
def item_form(request):
    ctxt = {
        'form': NetflixForm()
    }
    if request.POST:
        createds = []
        duplicates = []
        errors = []
        data = request.POST
        source = Source.objects.get(name='Netflix')
        item_count = int(data.get('items', '1'))
        for x in range(1, item_count+1):
            date = data['pub_date%d' % x]
            ttl = data['title%d' % x]
            url = data['url%d' % x]
            if date and ttl and url:
                try:
                    pub_date = datetime.strptime(date, '%Y-%m-%dT%H:%M')
                except ValueError:
                    errors.append("Invalid date for %s" % ttl)
                    continue
                # we need a slug
                # create slug from the URL?
                item, created = Item.objects.get_or_create(feed=source,
                                                           title=ttl,
                                                           url=url,
                                                           pub_date=pub_date)
                if created:
                    createds.append(item)
                else:
                    duplicates.append(item)
            else:
                errors.append("Row %s was incomplete" % x)
        ctxt.update({
            'createds': createds,
            'duplicates': duplicates,
            'errors': errors
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