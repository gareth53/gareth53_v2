from django.db import models

class Promo(models.Model):

    name = models.CharField(max_length=200)
    headline = models.CharField(max_length=200)
    headline_link = models.CharField(max_length=200, blank=True, null=True,
                                    help_text="""Can be an absolute link, or a relative, 
                                                over-rides the article link""")
    body_html = models.TextField()
    article_link = models.ForeignKey('Article', blank=True, null=True)

    def __unicode__(self):
        return u'%s' %(self.name)


class Article(models.Model):

    class Meta:
        ordering = ('-pub_date',)
        get_latest_by = 'pub_date'
        verbose_name_plural = 'articles'

    title = models.CharField(max_length=200)
    slug = models.SlugField()
    body_html = models.TextField()
    pod_promos = models.ForeignKey(Promo, blank=True, null=True)
    pub_date = models.DateTimeField(help_text="Date published")

    PUB_STATUS = (
        (0, 'Draft'),
        (1, 'Published'),
    )
    status = models.IntegerField(choices=PUB_STATUS, default=0)
    
    def __unicode__(self):
        return u'%s' %(self.title)
    
    def get_absolute_url(self):
        return "/%s" % self.slug