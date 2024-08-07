from django.shortcuts import render
from django.http.response import HttpResponse, Http404
# Create your views here.

articles = {
    'sports': 'Sports Page',
    'finance': 'Finance Page',
    'politics': 'Politics Page'
}

def news_view(request, topic):
    try:
        result = articles[topic]
        return HttpResponse(articles[topic])
    except:
        raise Http404("404 GENERIC ERROR")

def add_view(request, num1, num2):
    add_result = num1 + num2
    result = f"{num1} + {num2} = {add_result}"
    return HttpResponse(str(result))