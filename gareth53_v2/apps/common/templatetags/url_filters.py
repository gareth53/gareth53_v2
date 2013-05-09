import re

from django.template.defaultfilters import stringfilter
from django import template

register = template.Library()

@register.filter
@stringfilter
def url_for_display(value):
    """
    removes the protocol prefix from URLs for display purposes
    """
    protocol = re.compile('^[a-zA-Z]{3,5}://')
    trailer = re.compile('/$')
    value = protocol.sub('', value)
    return trailer.sub('', value)
