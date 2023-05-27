from django.contrib import admin
from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name="home"),
    path('reg/', reg, name="reg"),
    path('reg/korisnik', regKorisnik, name="regKorisnik"),
    path('reg/autor', regAutor, name="regAutor"),
    path('reg/kuca', regKuca, name="regKuca"),
    path('login/', login_req, name="login"),
    path('logout/', logout_req, name="logout")
]