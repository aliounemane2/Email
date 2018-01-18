#-*- coding: utf-8 -*-
"""Email URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from mails.views import *
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic import ListView
from mails.models import Destinataire

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    # url(r'^email/', 'mails.views.email', name='email'),
    url(r'^email/$', email, name='email'),
    url(r'^accueil/$', accueil, name='accueil'),
    url(r'^login/$', login, name='login'),
    url(r'^login_account/$', login_account, name='login_account'),
    url(r'^logout_account/$', logout_account, name='logout_account'),
    url(r'^index/$', index, name='index'),
    url(r'^index2/$', index2, name='index2'),
    url(r'^group/(?P<id>\d+)/$', group, name='group'),
    url(r'^sendgroup/$', sendgroup, name='sendgroup'),
    url(r'^selectiongroup/$', selectiongroup, name='selectiongroup'),
    #url(r'^sendselectiongroup/(?P<id>\d+)/', 'mails.views.sendselectiongroup', name='sendselectiongroup'),
    url(r'^sendselectiongroup/$', sendselectiongroup, name='sendselectiongroup'),
    url(r'^sendsms/$', sendsms, name='sendsms'),
    url(r'^contacter/$', contacter, name='contacter'),

]
