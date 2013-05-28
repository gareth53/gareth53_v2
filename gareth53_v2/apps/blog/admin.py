from django.contrib import admin
from .models import *

class EntryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('title',) }
    list_display = ('title', 'pub_date','enable_comments', 'status',)        
    search_fields = ['title', 'body_html']
    list_filter = ('pub_date', 'enable_comments', 'status')
    class Media:
        js = (
                    '/assets/js/tiny_mce/tiny_mce.js',
                    '/assets/js/tiny_mce/textareas.js',
                )
class BlogCategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('title',) }
    list_display = ('title', 'slug','use_count')
    class  Media:
        js = (
            '/assets/js/jquery-1.2.1.min.js',
            '/assets/js/admin/blogcategories.js',
        )

admin.site.register(Entry, EntryAdmin)
admin.site.register(BlogCategory, BlogCategoryAdmin)