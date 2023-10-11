from django.db import models
from Users.models import CustomUser # Pour l'auteur

class Article(models.Model):
    titre = models.CharField(max_length=200)
    contenu = models.TextField()
    date_creation = models.DateTimeField(auto_now_add=True)
    image = models.ImageField(upload_to='media/', blank=True, null=True)
    auteur = models.ForeignKey(CustomUser(), on_delete=models.CASCADE)
   
    def __str__(self):
        return self.titre
    
class Auteur(models.Model):
    utilisateur = models.OneToOneField(CustomUser(), on_delete=models.CASCADE)
    bio = models.TextField(blank=True)
    photo_de_profil = models.ImageField(upload_to='auteurs/', null=True, blank=True)
    
    def __str__(self):
        return self.utilisateur.username
    
class Commentaire(models.Model):
    article = models.ForeignKey(Article, on_delete=models.CASCADE, related_name='commentaires')
    auteur = models.ForeignKey(CustomUser(), on_delete=models.CASCADE)
    contenu = models.TextField()
    date_creation = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f'Commentaire de {self.auteur.username} sur {self.article.titre}'
