from django import template
from django.template.defaultfilters import slugify

register = template.Library()

@register.simple_tag(takes_context=True)
def body_class(context):
    """
    template tag that renders the main site navigation
    """
    namespace = ''
    curr_url = context['request'].path
    if curr_url == '/':
        namespace = r"home"
    else:
        bits = curr_url.split('/')
        for bit in bits:
            if bit:
                rnamespace = slugify(bit)
    return namespace