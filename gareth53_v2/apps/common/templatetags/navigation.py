from django import template                     
from django.conf import settings
from django.template import RequestContext

register = template.Library()

@register.inclusion_tag('common/_navigation.html', takes_context=True)
def render_navigation(context):
    """
    template tag that renders the main site navigation
    """
    curr_url = context['request'].path
    nav_links = settings.NAVIGATION
    for nav in nav_links:
        navlink = nav['link']
        nav['curr_link'] = (navlink == curr_url)
        nav['upstate'] = (len(navlink) and curr_url.startswith(navlink))
        
    return {
        "nav_links": nav_links
    }