import datetime, requests
from django.contrib.syndication.views import Feed

DATETIME_FORMAT= '%Y-%m-%dT%H:%M:%SZ'

class MixcloudList(Feed):
    title = "MixCloud mixes"
    link = "https://www.mixcloud.com/"
    description = "Mixcloud mixes"
    mixcloud_url = None

    def get_info(self):
		item_list = []
		url = self.mixcloud_url
		if url:
			r = requests.get(url)
			if r.status_code == 200:
				items = r.json()
				for fave in items['data']:
					tags = [tag['name'] for tag in fave['tags']]
					item_list.append({
						'title': fave['name'],
						'url': fave['url'],
						'pubdate': fave['created_time'],
						'description': "A mix from %s tagged as %s" % (fave['user']['name'], ", ".join(tags))
					})
		return item_list

    def items(self):
        return self.get_info()

    def item_title(self, item):
        return item['title']

    def item_description(self, item):
        return item['description']

    def item_link(self, item):
        return item['url']

    def item_pubdate(self, item):
    	#2013-09-07T07:09:30Z
    	return datetime.datetime.strptime(item['pubdate'], DATETIME_FORMAT)


class MixcloudListensFeed(MixcloudList):
    title = "MixCloud Listens for gareth53"
    link = "https://www.mixcloud.com/gareth53/listens/"
    description = "MIxcloud mixesthat user gareth53 has listened to."
    mixcloud_url = "http://api.mixcloud.com/gareth53/listens/"


class MixcloudFavouritesFeed(MixcloudList):
    title = "MixCloud Favourites for gareth53"
    link = "https://www.mixcloud.com/gareth53/favourites/"
    description = "MIxcloud mixes marked as 'favourites' by gareth53."
    mixcloud_url = 'https://api.mixcloud.com/gareth53/favorites/'