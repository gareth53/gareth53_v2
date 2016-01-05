from django import forms
from django.template import Template, TemplateSyntaxError

from .models import Source, Item

class SourceAdminForm(forms.ModelForm):

    def clean_item_summary_template(self):
        # validate template syntax
        try:
            templ = Template(self.cleaned_data["item_summary_template"])
        except TemplateSyntaxError, e:
            raise forms.ValidationError("Template syntax error: %s" % e.message)
        return self.cleaned_data["item_summary_template"]


class NetflixForm(forms.Form):
	title1 = forms.CharField()
	pub_date1 = forms.CharField()
	url1 = forms.CharField()
	# TODO: make this a hidden input
	items = forms.CharField(initial=1)

	def __init__(self, extra=None, *args, **kwargs):
		super(NetflixForm, self).__init__(*args, **kwargs)
		if extra:
			for x, val in enumerate(extra):
				self.fields['title%s' % str(x+1)] = forms.CharField(initial=val['title'])
				self.fields['pub_date%s' % str(x+1)] = forms.CharField(initial=val['pub_date'])
				self.fields['url%s' % str(x+1)] = forms.CharField(initial=val['url'])
			self.fields['items'].initial = len(extra)
