from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import CustomUser

class CustomUserCreationForm(UserCreationForm):
    # Champs personnalisés ajoutés au formulaire d'inscription

    first_name = forms.CharField(max_length=30, required=False, help_text="Optionnel. Votre prénom.")
    last_name = forms.CharField(max_length=30, required=False, help_text="Optionnel. Votre nom de famille.")
   
    class Meta:
        model = CustomUser
        fields = UserCreationForm.Meta.fields + (
            'first_name',
            'last_name',
        )

    # Vous pouvez ajouter des validations personnalisées ici si nécessaire
