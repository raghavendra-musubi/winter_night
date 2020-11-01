from django.shortcuts import render
# from django.http import HttpResponse

from django.views.generic import (
    ListView,
    DetailView,
    )
from .models import Post


# Create your views here.

# # function-based view
# def home(request):
#     context = {
#         'posts': Post.objects.all()
#     }
#     return render(request, 'blog/home.html', context)


def about(request):
    return render(request, 'blog/about.html', { 'title': 'About'})

class PostListView(ListView):
    model = Post
    template_name = 'blog/home.html'
    context_object_name = 'posts' # sets the context variable name inside the template being called
    ordering = ["-date_posted"]

# single line Class view
class PostDetailView(DetailView):
    model = Post