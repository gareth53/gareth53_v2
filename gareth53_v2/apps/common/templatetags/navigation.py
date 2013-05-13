from django import template                     
from django.conf import settings
from django.template import RequestContext

register = template.Library()

@register.inclusion_tag('common/_navigation.html', takes_context=True)
def render_navigation(context):
    """
    template tag that renders the main site navigation
    """
    # TODO, if ew're veiwing the current link, don't link that one
    # TODO if we're linking to a section, highlight it, but maintain the link
    curr_url = context['request'].path
    return {
        "curr_url": curr_url, 
        "nav_links": settings.NAVIGATION
    }