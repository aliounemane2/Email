from django.db import models




class User(models.Model):
    first_name = models.CharField(max_length=255, unique=False, null=True)
    last_name = models.CharField(max_length=255, unique=False, null=True)
    email = models.CharField(max_length=255, unique=True, null=True)
    password = models.CharField(max_length=255, unique=False, null=True)

    def __str__(self):
        return str(self.first_name)