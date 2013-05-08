from django.db import models
from django.core.urlresolvers import reverse

class Source(models.Model):
    """
    A reference to an RSS feed or API endpoint maybe
    """    
    name = models.CharField(max_length=255)
    slug = models.SlugField()
    url = models.URLField(help_text="URL of an RSS feed or API endpoint")

    last_check = models.DateTimeField(blank=True, null=True, editable=False, help_text="Most recent HTTP request attempt")
    last_update = models.DateTimeField(blank=True, null=True, editable=False, help_text="Date of the most recent item")

    image = models.URLField(blank=True)
    description = models.TextField(blank=True)

    profile = models.URLField(blank=True, help_text="User profile URL, if applicable")
    website = models.URLField(help_text="URL of the site. Just the domain (and sub-domain), nothing else.", blank=True)
    active = models.BooleanField(default=True)

    username = models.CharField(blank=True, max_length=255, help_text="For URLs that require basic HTTP authentication")
    password = models.CharField(blank=True, max_length=255, help_text="For URLs that require basic HTTP authentication")

    def __unicode__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('gareth53_v2.apps.lifestream.views.source', None, [str(self.slug)])


class Item(models.Model):
    """
    An individual update/news item/tweet/event ... whatever
    """
    feed = models.ForeignKey(Source)
    url = models.URLField()

    title = models.CharField(blank=True, max_length=255)
    pub_date = models.DateTimeField(null=True)
    author = models.CharField(blank=True, max_length=255)

    description = models.TextField(blank=True)
    guid = models.CharField(blank=True, max_length=255)
    slug = models.SlugField(blank=True)

    category = models.CharField(blank=True, max_length=255)
    image = models.URLField(blank=True)

    media_url = models.URLField(blank=True)
    media_type = models.CharField(blank=True,max_length=100)
    
    def __unicode__(self):
        return self.title
    
    def get_absolute_url(self):
        return reverse('gareth53_v2.apps.lifestream.views.item', None, [str(self.feed.slug), str(self.slug)])