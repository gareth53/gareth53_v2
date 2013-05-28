from django.db import models
from django.contrib.sitemaps import Sitemap
from django.core.urlresolvers import reverse

class BlogCategory(models.Model):
    class Meta:
        get_latest_by = 'pub_date'
        verbose_name_plural = 'categories'
    title = models.CharField(max_length=200)
    slug = models.SlugField()
    use_count = models.IntegerField(blank=True, default=0, null=True)

    def __unicode__(self):
        return u'%s' %(self.title)

    def get_absolute_url(self):
        return reverse('gareth53.apps.blog.views.blogCategories', None, str(self.slug))

class Entry(models.Model):
    class Meta:
        get_latest_by = 'pub_date'
        verbose_name_plural = 'entries'

    title = models.CharField(max_length=200)
    slug = models.SlugField()
    body_html = models.TextField()
    pub_date = models.DateTimeField('Date published')
    enable_comments = models.BooleanField(default=True)
    category = models.ForeignKey(BlogCategory, blank=True, null=True)
    PUB_STATUS = (
        (0, 'Draft'),
        (1, 'Published'),
    )
    status = models.IntegerField(choices=PUB_STATUS, default=0)
    
    def __unicode__(self):
        return u'%s' %(self.title)

    def year(self):
        return int(self.pub_date.strftime("%Y"))

    def month(self):
        return int(self.pub_date.strftime("%m"))

    def save(self):
        # update the blog category use counts
        all_categories = BlogCategory.objects.all()
        for this_category in all_categories:
            countEntries = Entry.objects.all().filter(category=this_category)
            this_category.use_count = countEntries.count()
            this_category.save()
        super(Entry, self).save()

    def get_absolute_url(self):
        return reverse('gareth53.apps.blog.views.blogPost', None, \
        [ str(self.pub_date.strftime("%Y")),
          str(self.pub_date.strftime("%m")),
          str(self.slug)])


def get_previous_published(self):
    return self.get_previous_by_pub_date(status__exact=1)

def get_next_published(self):
    return self.get_next_by_pub_date(status__exact=1)

def get_tags(self):
    return Tag.objects.get_for_object(self)
