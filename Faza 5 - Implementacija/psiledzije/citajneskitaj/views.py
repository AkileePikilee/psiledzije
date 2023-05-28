from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.models import Group
from django.http import HttpRequest, Http404
from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import *


# Create your views here.
def index(request: HttpRequest):
    return render(request, 'index.html', {})


def reg(request: HttpRequest):
    if request.user.is_authenticated:
        return redirect('home')
    return render(request, 'registration/reg.html', {})


def regKorisnik(request: HttpRequest):
    if request.user.is_authenticated:
        return redirect('home')
    form = KorisnikRegForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        user: Korisnik = form.save(commit=False)
        user.imeprezime = form.cleaned_data["ime"] + " " + form.cleaned_data["prezime"]
        user.save()
        group = Group.objects.get(name='Korisnici')
        user.groups.add(group)
        login(request, user)
        return redirect('home')
    return render(request, 'registration/regKorisnik.html', {
        'form': form
    })


def regAutor(request: HttpRequest):
    if request.user.is_authenticated:
        return redirect('home')
    form = AutorRegForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        user: Autor = form.save(commit=False)
        user.tip = 'A'
        user.imeprezime = form.cleaned_data["ime"] + " " + form.cleaned_data["prezime"]
        user.save()
        group = Group.objects.get(name='Autori')
        user.groups.add(group)
        login(request, user)
        return redirect('home')
    return render(request, 'registration/regAutor.html', {
        'form': form
    })


def regKuca(request: HttpRequest):
    if request.user.is_authenticated:
        return redirect('home')
    form = KucaRegForm(request.POST or None, request.FILES or None)
    if form.is_valid():
        user: IzdavackaKuca = form.save(commit=False)
        user.tip = 'I'
        user.save()
        group = Group.objects.get(name='Kuce')
        user.groups.add(group)

        lokacije = form.cleaned_data["lokacije"].split("#")
        for lok in lokacije:
            if lok:
                instance = ProdajnaMesta(idizdkuca=user, adresa=lok)
                instance.save()
        login(request, user)
        return redirect('home')
    return render(request, 'registration/regKuca.html', {
        'form': form
    })


def login_req(request: HttpRequest):
    if request.user.is_authenticated:
        return redirect('home')
    form = LoginForm(data=request.POST or None)
    if form.is_valid():
        username = form.cleaned_data["username"]
        password = form.cleaned_data["password"]
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return redirect("home")
    return render(request, "registration/login.html", {
        "form": form
    })

def logout_req(request: HttpRequest):
    logout(request)
    return redirect('home')

def knjiga(request: HttpRequest, knjiga_id: str):
    try:
        knjiga = Knjiga.objects.get(pk=knjiga_id)
        napisanija = Napisao.objects.filter(isbn=knjiga.isbn)
        autori = ''
        for napisanije in napisanija:
            autori += napisanije.idautor.imeprezime + ', '
        autori = autori[0:-2]

        recenzije = Recenzija.objects.filter(idprimalacknjiga=knjiga)

    except:
        raise Http404("Ne postoji knjiga sa tim ID :(")
    context = {
        'knjiga': knjiga,
        'autori': autori,
        'recenzije': recenzije
    }
    return render(request, 'entities/knjiga.html', context)

def profil(request: HttpRequest, profil_id: str):
    try:
        uloga = Uloga.objects.get(pk=profil_id)
        recenzije = Recenzija.objects.filter(idprimalaculoga=uloga)

        context = {
            'uloga': uloga,
            'recenzije': recenzije
        }

        if uloga.tip == 'A':
            context['profil'] = Autor.objects.get(pk=profil_id)
            return render(request, 'entities/autor.html', context)
        elif uloga.tip == 'K':
            context['profil'] = Korisnik.objects.get(pk=profil_id)
            return render(request, 'entities/korisnik.html', context)
        else:
            context['profil'] = IzdavackaKuca.objects.get(pk=profil_id)
            return render(request, 'entities/izdavackakuca.html', context)
    except Autor.DoesNotExist:
        raise Http404("Ne postoji profil sa tim ID :(")



