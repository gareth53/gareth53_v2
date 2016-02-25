from datetime import datetime
from django.shortcuts import render
from django.contrib.auth.decorators import login_required

from gareth53_v2.apps.lifestream.models import Source, Item
from .forms import GarminStepsForm


@login_required
def item_form(request):
	form = GarminStepsForm()
	item = None
	existing_items = None
	if request.POST:
		form = GarminStepsForm(request.POST)
		if form.is_valid():
			data = request.POST
			steps = data['steps']
			day = data['day']
			source = Source.objects.get(slug='garmin')
			ttl = "%s steps" % steps
			# check that an existing step count for that day doesn't exist
			date = datetime.strptime(day, '%Y-%m-%d %H:%M:%S')
			day_st = date.replace(hour=0, minute=0, second=0)
			day_end = date.replace(hour=23, minute=59, second=59)
			existing_items = Item.objects.filter(feed=source,
                                                 pub_date__gte=day_st,
                                                 pub_date__lte=day_end)
			if not existing_items:
				slug = "%s-%s" % (day_st.strftime('%Y-%m-%d'), steps)
				item = Item.objects.create(feed=source,
                                       title=ttl,
                                       url='http://www.garminconnect.com/users/gareth.senior/',
                                       pub_date=day,
                                       slug=slug)
	ctxt = {
		'form': form,
		'item': item,
		'existing_items': existing_items
	}
	return render(request, 'garmin/items_create.html', ctxt)
