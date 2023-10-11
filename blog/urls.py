from django.urls import path
from . import views

urlpatterns = [
    path('', views.liste_articles, name='liste_articles'),
    path('article/<int:article_id>/', views.detail_article, name='detail_article'),
    path('creer_article/', views.creer_article, name='creer_article'),
    path('modifier_article/<int:article_id>/', views.modifier_article, name='modifier_article'),
    path('creer_commentaire/<int:pk>/', views.CreerCommentaireView.as_view(), name='creer_commentaire'),
    path('supprimer_commentaire/<int:pk>/', views.SupprimerCommentaireView.as_view(), name='supprimer_commentaire'),
    path('formulaire_contact/', views.formulaire_contact, name='formulaire_contact'),
    path('a-propos/', views.a_propos, name='a_propos'),
]