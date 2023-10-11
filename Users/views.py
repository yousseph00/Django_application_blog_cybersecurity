from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.forms import AuthenticationForm
from django.core.exceptions import PermissionDenied

from blog.models import Article
from .forms import CustomUserCreationForm

def inscription(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            # Connectez automatiquement l'utilisateur après l'inscription
            login(request, user)
            return redirect('liste_articles')  # Redirigez l'utilisateur vers la page d'accueil ou une autre page après l'inscription réussie
    else:
        form = CustomUserCreationForm()
    return render(request, 'users/inscription.html', {'form': form})

def connexion(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('liste_articles')  # Redirigez l'utilisateur vers la page d'accueil ou une autre page après la connexion réussie
    else:
        form = AuthenticationForm()
    return render(request, 'users/connexion.html', {'form': form})

def deconnexion(request):
    if request.method == 'POST':
        logout(request)
        return redirect('liste_articles')
    return render(request, 'users/deconnexion.html')

def user_can_edit_own_article(view_func):
    def _wrapped_view(request, *args, **kwargs):
        article_id = kwargs.get('article_id')  # ou tout autre moyen d'obtenir l'ID de l'article
        article = Article.objects.get(pk=article_id)
        if article.auteur == request.user or request.user.has_perm('Users.can_edit_own_article'):
            return view_func(request, *args, **kwargs)
        else:
            raise PermissionDenied
    return _wrapped_view