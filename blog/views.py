#coding:utf-8
import logging
from django.shortcuts import render
from django.conf import settings
from models import *
from django.core.paginator import  Paginator,InvalidPage,EmptyPage,PageNotAnInteger

logger=logging.getLogger("blog.views")
# Create your views here.
def global_setting(request):
    return {'SITE_NAME':settings.SITE_NAME,
            'SITE_DESC':settings.SITE_DESC,}

def index(request):
   try:
       #分类信息获取（导航数据）
        category_list = Category.objects.all().order_by('index')[:6]
       #广告数据
        ad_list = Ad.objects.all().order_by('index')
       #最新文章数据
        article_list=Article.objects.all()
        paginator=Paginator(article_list,3)
        try:
            page = int(request.GET.get('page',1))
            article_list = paginator.page(page)
        except (EmptyPage,InvalidPage,PageNotAnInteger):
            article_list = paginator.page(1)
   except Exception as e:
         logger.error(e)
   return render(request, 'index.html', {'category_list':category_list,'ad_list':ad_list,'article_list':article_list})