from django.shortcuts import render
from django.http.response import HttpResponse, HttpResponseRedirect, Http404
from django.urls import reverse
# Create your views here.

def simple_view(request):
    return render(request, 'first_app/example.html')