from django.contrib.auth.models import AbstractUser, Group,Permission
from django.db import models

class CustomUser(AbstractUser):
    

    groups = models.ManyToManyField(Group, related_name='shopper_groups')
    user_permissions = models.ManyToManyField(Permission, related_name='shopper_permissions')
 
    # Exemple : Champ pour le prénom
    first_name = models.CharField(max_length=30, blank=True)

    # Exemple : Champ pour le nom de famille
    last_name = models.CharField(max_length=30, blank=True)

    # Méthode pour définir comment l'utilisateur est affiché dans l'administration Django
    def __str__(self):
        return self.username
    
    class Meta:
        permissions = [
            ("can_edit_own_article", "Peut éditer ses propres articles"),
        ]
