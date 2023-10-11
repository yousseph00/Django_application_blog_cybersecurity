from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic.edit import CreateView, DeleteView

from Users.views import user_can_edit_own_article
from .models import Article, Commentaire
from .forms import ArticleForm, CommentaireForm, ContactForm
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail

def liste_articles(request):
    articles = Article.objects.all().order_by('-date_creation')
    return render(request, 'blog/liste_articles.html', {'articles': articles})

def detail_article(request, article_id):
    article = get_object_or_404(Article, pk=article_id)
    commentaires = Commentaire.objects.filter(article=article)
    if request.method == 'POST':
        formulaire_commentaire = CommentaireForm(request.POST)
        if formulaire_commentaire.is_valid():
            nouveau_commentaire = formulaire_commentaire.save(commit=False)
            nouveau_commentaire.article = article
            nouveau_commentaire.save()
            return redirect('detail_article', article_id=article_id)
    else:
        formulaire_commentaire = CommentaireForm()
    return render(request, 'blog/detail_article.html', {'article': article, 'commentaires': commentaires, 'formulaire_commentaire': formulaire_commentaire})

@login_required
def creer_article(request):
    if request.method == 'POST':
        formulaire_article = ArticleForm(request.POST)
        if formulaire_article.is_valid():
            nouvel_article = formulaire_article.save(commit=False)
            nouvel_article.auteur = request.user
            nouvel_article.save()
            return redirect('liste_articles')
    else:
        formulaire_article = ArticleForm()
    return render(request, 'blog/creer_article.html', {'formulaire_article': formulaire_article})

@login_required
@user_can_edit_own_article
def modifier_article(request, article_id):
    article = get_object_or_404(Article, pk=article_id)
    if request.user == article.auteur:
        if request.method == 'POST':
            formulaire_article = ArticleForm(request.POST, instance=article)
            if formulaire_article.is_valid():
                formulaire_article.save()
                return redirect('detail_article', article_id=article_id)
        else:
            formulaire_article = ArticleForm(instance=article)
        return render(request, 'blog/modifier_article.html', {'formulaire_article': formulaire_article})
    else:
        return redirect('liste_articles')
    

class CreerCommentaireView(CreateView):
    model = Commentaire
    template_name = 'blog/creer_commentaire.html'  # Le template pour le formulaire de création de commentaire
    fields = ['contenu']  # Les champs du modèle Commentaire que l'utilisateur peut remplir
    success_url = '/article/<int:pk>/'  # Rediriger l'utilisateur vers la page de détails de l'article après avoir ajouté un commentaire

@login_required
def create_comment(request, article_id):
    # Assuming you have retrieved the article and user appropriately
    article = get_object_or_404(Article, pk=article_id)
    user = request.user

    # Create a new comment and set the author
    new_comment = Commentaire(contenu="Your comment text", auteur=user, article=article)

    # Save the comment to the database
    new_comment.save()

    # Redirect or return a response as needed

class SupprimerCommentaireView(DeleteView):
    model = Commentaire
    template_name = 'blog/supprimer_commentaire.html'  # Le template pour la confirmation de suppression
    success_url = '/article/<int:pk>/'  # Rediriger l'utilisateur vers la page de détails de l'article après avoir supprimé un commentaire

def formulaire_contact(request):
    if request.method == 'POST':
        formulaire = ContactForm(request.POST)
        if formulaire.is_valid():
            nom = formulaire.cleaned_data['nom']
            email = formulaire.cleaned_data['email']
            message = formulaire.cleaned_data['message']

            # Envoi du message par e-mail
            send_mail(
                'Nouveau message de contact',
                f'Nom: {nom}\nE-mail: {email}\nMessage:\n{message}',
                'votre_email@example.com',
                ['votre_email@example.com'],  # Remplacez par votre adresse e-mail de réception
                fail_silently=False,
            )
            return render(request, 'blog/succes.html')  # Affiche une page de succès après l'envoi du message
    else:
        formulaire = ContactForm()
    return render(request, 'blog/formulaire_contact.html', {'formulaire': formulaire})

def a_propos(request):
    return render(request, 'blog/a_propos.html')
