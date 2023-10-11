from django.contrib import admin
from .models import Article, Auteur, Commentaire

admin.site.register(Article) 
admin.site.register(Auteur)   
admin.site.register(Commentaire)  