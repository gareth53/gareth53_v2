from django.template import Library, Template, Context

register = Library()

@register.simple_tag()
def display_count(source_group):
    """
    template tag that disyplas the update count e.g.
        * '3 scrobbles via Last.FM'
        * '8 tweets'
        * '6 posts at WordPress'

    actually renders HTML, eg.
        <a href="{{ source.source.get_absolute_url }}">
            {{ source.items|length }} update{{ source.items|pluralize }} via {{ source.source.name }}
        </a>

    expects a source_group to be a dict that looks like this:
        {
        'source': <Scource object>,
        'items': [<Item obj>, <Item obj> ... etc...]
        }

    """
    source = source_group['source']
    items = source_group['items']
    tmpl = Template(source.item_summary_template or """
                <a href='{{ source.get_absolute_url }}'>
                    {{ items|length }} update{{ items|pluralize }} via {{ source.name }}
                </a>""")

    return tmpl.render(Context({ 'source': source, 'items': items }))