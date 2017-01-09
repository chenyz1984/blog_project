# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2016-12-23 07:24
from __future__ import unicode_literals

from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0008_alter_user_username_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.ASCIIUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=30, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('avatar', models.ImageField(blank=True, default='avatar/default.png', max_length=200, null=True, upload_to='avatar/%Y/%m', verbose_name='\u7528\u6237\u5934\u50cf')),
                ('qq', models.CharField(max_length=20, verbose_name='QQ\u53f7')),
                ('mobile', models.CharField(max_length=11, unique=True, verbose_name='\u624b\u673a\u53f7')),
                ('url', models.URLField(blank=True, max_length=100, null=True, verbose_name='\u4e2a\u4eba\u7f51\u9875\u5730\u5740')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'ordering': ['-id'],
                'verbose_name': '\u7528\u6237',
                'verbose_name_plural': '\u7528\u6237',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Ad',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50, verbose_name='\u6807\u9898')),
                ('description', models.CharField(max_length=200, verbose_name='\u63cf\u8ff0')),
                ('image_url', models.ImageField(upload_to='ad/%Y/%m', verbose_name='\u56fe\u7247\u8def\u5f84')),
                ('callback_url', models.CharField(max_length=200, verbose_name='\u8c03\u7528\u5730\u5740')),
                ('date_publish', models.DateTimeField(auto_now_add=True, max_length=0, verbose_name='\u53d1\u5e03\u65e5\u671f')),
                ('index', models.IntegerField(default=999, verbose_name='\u6392\u5e8f')),
            ],
            options={
                'ordering': ['index', 'id'],
                'verbose_name': '\u5e7f\u544a',
                'verbose_name_plural': '\u5e7f\u544a',
            },
        ),
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50, verbose_name='\u6587\u7ae0\u6807\u9898')),
                ('desc', models.CharField(max_length=50, verbose_name='\u6587\u7ae0\u63cf\u8ff0')),
                ('content', models.TextField(verbose_name='\u6587\u7ae0\u5185\u5bb9')),
                ('click_count', models.IntegerField(default=0, verbose_name='\u70b9\u51fb\u6b21\u6570')),
                ('is_recommend', models.BooleanField(default=False, verbose_name='\u662f\u5426\u63a8\u8350')),
                ('date_publish', models.DateTimeField(auto_now_add=True, verbose_name='\u53d1\u5e03\u65f6\u95f4')),
            ],
            options={
                'ordering': ['-date_publish'],
                'verbose_name': '\u6587\u7ae0',
                'verbose_name_plural': '\u6587\u7ae0',
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30, verbose_name='\u5206\u7c7b\u540d\u79f0')),
                ('index', models.IntegerField(default=999, verbose_name='\u6392\u5e8f\u5b57\u6bb5')),
            ],
            options={
                'ordering': ['index', 'id'],
                'verbose_name': '\u5206\u7c7b',
                'verbose_name_plural': '\u5206\u7c7b',
            },
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.TextField(verbose_name='\u8bc4\u8bba\u5185\u5bb9')),
                ('username', models.CharField(blank=True, max_length=30, null=True, verbose_name='\u7528\u6237\u540d\u540d')),
                ('email', models.EmailField(blank=True, max_length=50, null=True, verbose_name='\u90ae\u7bb1')),
                ('url', models.URLField(blank=True, max_length=100, null=True, verbose_name='\u4e2a\u4eba\u7f51\u9875')),
                ('date_publish', models.DateTimeField(verbose_name='\u8bc4\u8bba\u65e5\u671f')),
                ('article', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='blog.Article', verbose_name='\u6587\u7ae0')),
                ('pid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='blog.Comment', verbose_name='\u7236\u7ea7\u8bc4\u8bba')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='\u7528\u6237')),
            ],
            options={
                'verbose_name': '\u8bc4\u8bba',
                'verbose_name_plural': '\u8bc4\u8bba',
            },
        ),
        migrations.CreateModel(
            name='Links',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50, verbose_name='\u94fe\u63a5\u540d\u79f0')),
                ('description', models.CharField(max_length=200, verbose_name='\u63cf\u8ff0')),
                ('callback_url', models.CharField(max_length=200, verbose_name='URL\u5730\u5740')),
                ('date_publish', models.DateTimeField(auto_now_add=True, verbose_name='\u65e5\u671f')),
                ('index', models.IntegerField(default=999, verbose_name='\u6392\u5e8f')),
            ],
            options={
                'ordering': ['index', 'id'],
                'verbose_name': '\u94fe\u63a5',
                'verbose_name_plural': '\u94fe\u63a5',
            },
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30, verbose_name='\u6807\u7b7e\u540d\u79f0')),
            ],
            options={
                'verbose_name': '\u6807\u7b7e',
                'verbose_name_plural': '\u6807\u7b7e',
            },
        ),
        migrations.AddField(
            model_name='article',
            name='category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='blog.Category', verbose_name='\u5206\u7c7b'),
        ),
        migrations.AddField(
            model_name='article',
            name='tag',
            field=models.ManyToManyField(to='blog.Tag', verbose_name='\u6807\u7b7e'),
        ),
        migrations.AddField(
            model_name='article',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='\u7528\u6237'),
        ),
    ]
