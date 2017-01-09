#-*- coding:utf-8 -*-
from django.contrib import admin
from models import *
# Register your models here.
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title','user_id','date_publish','click_count',)
    list_display_links = ('title','user_id','date_publish','click_count',)
    fieldsets = (
        (None, {
            'fields': ('title', 'desc', 'content','user', )
        }),
        ('更多', {
            'classes': ('collapse',),
            'fields': ('is_recommend', 'click_count','category','tag',),
        }),
    )
    class Media:
        js = (
            '/static/js/kindeditor-4.1.11/kindeditor-all-min.js',
            '/static/js/kindeditor-4.1.11/lang/zh_CN.js',
            '/static/js/kindeditor-4.1.11/config.js',
        )
admin.site.register(Article,ArticleAdmin)

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('username','email', 'mobile','last_login',)
    list_display_links = ('username','email', 'mobile','last_login',)
    fieldsets = (
        (None, {
            'fields': ('username', 'password','avatar', 'email', 'mobile','is_active',)
        }),
        ('更多', {
            'classes': ('collapse',),
            'fields': ('is_superuser', 'first_name', 'last_name', 'is_staff','qq','url',),
        }),
    )

admin.site.register(Ad)

admin.site.register(Category)
admin.site.register(Comment)
admin.site.register(Links)
admin.site.register(Tag)

