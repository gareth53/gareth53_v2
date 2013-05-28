from django import forms
from django.template import Template, TemplateSyntaxError

from .models import Source

class SourceAdminForm(forms.ModelForm):

    def clean_item_summary_template(self):
        # validate template syntax
        try:
            templ = Template(self.cleaned_data["item_summary_template"])
        except TemplateSyntaxError, e:
            raise forms.ValidationError("Template syntax error: %s" % e.message)
        return self.cleaned_data["item_summary_template"]