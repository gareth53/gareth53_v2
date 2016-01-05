from django import forms

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
