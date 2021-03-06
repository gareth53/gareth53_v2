from django.contrib import admin
from .models import Source, Item
from .forms import SourceAdminForm

class SourceAdmin(admin.ModelAdmin):
    form = SourceAdminForm
    list_display = ['slug', 'name', 'last_check']
    list_filter = ('active', )
    list_editable = ('name', )
    prepopulated_fields = {"slug": ("name",)}

class ItemAdmin(admin.ModelAdmin):
    list_display = ['title', 'pub_date', 'feed']
    list_filter = ('feed', )
    
admin.site.register(Source, SourceAdmin)
admin.site.register(Item, ItemAdmin)