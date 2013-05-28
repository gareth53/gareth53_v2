from django import template
from gareth53.apps.blog.models import BlogCategory

register = template.Library()

@register.inclusion_tag('blog/_categories.html', takes_context=True)
def blog_categories(context):
    categories = BlogCategory.objects.all()
    return { 'categories' : categories, }