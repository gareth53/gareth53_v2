# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-01-07 13:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lifestream', '0002_auto_20151227_1839'),
    ]

    operations = [
        migrations.AlterField(
            model_name='item',
            name='url',
            field=models.URLField(blank=True, max_length=500),
        ),
    ]