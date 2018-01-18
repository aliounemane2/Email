from django.contrib import admin

# Register your models here.
from users.models import User

class UserAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', )
    filter = ('email', 'first_name', 'last_name')


admin.site.register(User, UserAdmin)
admin.site.site_title = 'Administration de Mailing'
admin.site.site_header = 'Administration de Mailing'

