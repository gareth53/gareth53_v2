from django.contrib import admin
from .models import *

class ArticleAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('title',) }
    list_display = ('title', 'pub_date', 'status',)        
    search_fields = ['title', 'body_html']
    list_filter = ('title', 'pub_date', 'status')


class PromoAdmin(admin.ModelAdmin):

    def link(obj):
        if obj.headline_link:
            return obj.headline_link
        elif obj.article_link:
            return obj.article_link
        return "None"
        
    list_display = ('name', 'headline', link,)


admin.site.register(Article, ArticleAdmin)
admin.site.register(Promo, PromoAdmin)