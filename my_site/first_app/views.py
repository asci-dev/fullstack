from django.shortcuts import render
from django.http.response import HttpResponse, HttpResponseRedirect, Http404
from django.urls import reverse
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

def num_page_view(request, num_page):
    topic_list = list(articles.keys())
    topic = topic_list[num_page]

    return HttpResponseRedirect(reverse('topic-page', args = [topic]))