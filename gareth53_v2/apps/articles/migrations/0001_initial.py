# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Promo'
        db.create_table(u'articles_promo', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('headline', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('headline_link', self.gf('django.db.models.fields.CharField')(max_length=200, null=True, blank=True)),
            ('body_html', self.gf('django.db.models.fields.TextField')()),
            ('article_link', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['articles.Article'], null=True, blank=True)),
        ))
        db.send_create_signal(u'articles', ['Promo'])

        # Adding model 'Article'
        db.create_table(u'articles_article', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=50)),
            ('body_html', self.gf('django.db.models.fields.TextField')()),
            ('pod_promos', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['articles.Promo'], null=True, blank=True)),
            ('pub_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('status', self.gf('django.db.models.fields.IntegerField')(default=0)),
        ))
        db.send_create_signal(u'articles', ['Article'])


    def backwards(self, orm):
        # Deleting model 'Promo'
        db.delete_table(u'articles_promo')

        # Deleting model 'Article'
        db.delete_table(u'articles_article')


    models = {
        u'articles.article': {
            'Meta': {'ordering': "('-pub_date',)", 'object_name': 'Article'},
            'body_html': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'pod_promos': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['articles.Promo']", 'null': 'True', 'blank': 'True'}),
            'pub_date': ('django.db.models.fields.DateTimeField', [], {}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '50'}),
            'status': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '200'})
        },
        u'articles.promo': {
            'Meta': {'object_name': 'Promo'},
            'article_link': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['articles.Article']", 'null': 'True', 'blank': 'True'}),
            'body_html': ('django.db.models.fields.TextField', [], {}),
            'headline': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'headline_link': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'})
        }
    }

    complete_apps = ['articles']