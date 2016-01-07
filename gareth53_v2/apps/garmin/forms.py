from datetime import datetime
from django import forms

class GarminStepsForm(forms.Form):
	day = forms.DateTimeField(initial=datetime.now())
	steps = forms.IntegerField()