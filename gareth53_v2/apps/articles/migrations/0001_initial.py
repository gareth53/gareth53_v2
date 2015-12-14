# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2015-12-14 13:45
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('slug', models.SlugField()),
                ('body_html', models.TextField()),
                ('pub_date', models.DateTimeField(help_text=b'Date published')),
                ('status', models.IntegerField(choices=[(0, b'Draft'), (1, b'Published')], default=0)),
            ],
            options={
                'ordering': ('-pub_date',),
                'get_latest_by': 'pub_date',
                'verbose_name_plural': 'articles',
            },
        ),
        migrations.CreateModel(
            name='Promo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('headline', models.CharField(max_length=200)),
                ('headline_link', models.CharField(blank=True, help_text=b'Can be an absolute link, or a relative, \n                                                over-rides the article link', max_length=200, null=True)),
                ('body_html', models.TextField()),
                ('article_link', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='articles.Article')),
            ],
        ),
        migrations.AddField(
            model_name='article',
            name='pod_promos',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='articles.Promo'),
        ),
    ]
