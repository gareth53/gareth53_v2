# so...
# we request the blog posts.
# we order them by date.
# we loop through them counting years/months starting from the year/month of the latest post.
# we return year objects which contain: YEAR, no_of_posts

# THIS IS ENTIRELY THE WRONG THING TO DO
# do the heave processing on the admin side
# when a post is saved, save a month/year object with OnetoMany relationships.
# so each year has an entry in the DB with ManyToMany relationships to posts
# each month has a DB row with relatinships....

from django import template
from gareth53.apps.blog.models import Entry

register = template.Library()

@register.inclusion_tag('blog/_by_date.html', takes_context=True)
def blog_year_posts(context):
    latest = Entry.objects.all().order_by('pub_date')[0]
    oldest = Entry.objects.all().order_by('-pub_date')[0]
    last_year = latest.year
    first_year = oldest.year
    # now, do a loop from most recent to most oldest
    # count the entries for each year and return them as an object 
    yearEntries = [
        { year : "2009", posts : "2" },
        { year : "2008", posts : "4" },
        { year : "2007", posts : "6" },
        { year : "2006", posts : "8" }
    ]
    return { 'years' : yearEntries, }