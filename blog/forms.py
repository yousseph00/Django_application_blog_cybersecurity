from django import forms
from .models import Article, Commentaire

class ArticleForm(forms.ModelForm):
    class Meta:
        model = Article
        fields = ['titre', 'contenu', 'image']
    

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['titre'].widget.attrs.update({'class': 'form-control'})
        self.fields['contenu'].widget.attrs.update({'class': 'form-control'})
        self.fields['image'].widget.attrs.update({'class': 'form-control-file'})  # Ajoutez cette ligne pour le champ 'image'.

class CommentaireForm(forms.ModelForm):
    class Meta:
        model = Commentaire
        fields = ['contenu']  # Ne pas inclure le champ 'auteur' ici

    def __init__(self, user, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['contenu'].widget.attrs.update({'class': 'form-control', 'placeholder': 'Laissez un commentaire...'})
        self.user = user  # Stocker l'utilisateur dans le formulaire

    def save(self, commit=True):
        # Créer une instance de Commentaire en attachant l'utilisateur actuel
        instance = super(CommentaireForm, self).save(commit=False)
        instance.auteur = self.user  # Affecter l'utilisateur actuel comme auteur
        if commit:
            instance.save()
        return instance  
        

class ContactForm(forms.Form):
    nom = forms.CharField(max_length=100, required=True)
    email = forms.EmailField(required=True)
    message = forms.CharField(widget=forms.Textarea, required=True)
