#-*- coding: utf-8 -*-

from django.db import models

class Destinataire(models.Model):

    nom = models.CharField(max_length=150)
    prenom = models.CharField(max_length=150)
    adresse = models.EmailField(max_length=175)

    #class Meta:
        #autocreated = True


    def __str__(self):
        return self.nom



class Group(models.Model):
    nom = models.CharField(max_length=150)
    destinataire = models.ManyToManyField(Destinataire, through='Destinataire_Group')

    def __str__(self):
        return self.nom



class Destinataire_Group(models.Model):
    destinataire = models.ForeignKey(Destinataire, on_delete=models.CASCADE)
    group = models.ForeignKey(Group, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.destinataire.adresse)

