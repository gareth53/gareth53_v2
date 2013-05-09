from django import template                     
from django.conf import settings

register = template.Library()

@register.inclusion_tag('common/_navigation.html')
def render_navigation():    
    """
    template tag that renders the main site navigation
    """
    # TODO, if ew're veiwing the current link, don't link that one
    # TODO if we're linking to a section, highlight it, but maintain the link
    return {
        "nav_links": settings.NAVIGATION
    }