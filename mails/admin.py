#-*- coding: utf-8 -*-
from django.contrib import admin
from .models import *
from import_export.admin import ImportExportModelAdmin



#class DestinataireAdmin(admin.ModelAdmin):
class DestinataireAdmin(ImportExportModelAdmin):
    list_display = ('nom', 'prenom', 'adresse')
    filter = ('nom', 'prenom', 'adresses')



class GroupAdmin(admin.ModelAdmin):
    list_display = ('nom', )



class Destinataire_GroupAdmin(admin.ModelAdmin):
    list_display = ('destinataire', 'group', )
    filter = ('destinataire', 'group', )




admin.site.register(Destinataire, DestinataireAdmin)
admin.site.register(Group, GroupAdmin)
admin.site.register(Destinataire_Group, Destinataire_GroupAdmin)


admin.site.site_title = 'Administration de Mailing'
admin.site.site_header = 'Administration de Mailing'