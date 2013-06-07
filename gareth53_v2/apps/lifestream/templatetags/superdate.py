import datetime

from django.utils import formats
from django.utils.dateformat import format
from django.template import Library
from django.utils.timezone import utc

register = Library()

def superday(value, arg=None):
    """
    Formats a day according to the given format.
    OR, returns TODAY or YESTERDAY    
    """
    if not value:
        return u''
    today = datetime.datetime.utcnow().replace(tzinfo=utc).replace(hour=0, minute=0, second=0, microsecond=0)
    yesterday = today - datetime.timedelta(days=1)
    if value.replace(hour=0, minute=0, second=0, microsecond=0) == today:
        return "Today"
    if (value - yesterday).days == 0:
        return "Yesterday"
    if arg is None:
        arg = settings.DATE_FORMAT
    try:
        return formats.date_format(value, arg)
    except AttributeError:
        try:
            return format(value, arg)
        except AttributeError:
            return ''
superday.is_safe = False

register.filter(superday)