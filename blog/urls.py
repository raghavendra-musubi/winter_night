from django.urls import path
from . import views
from .views import PostListView

urlpatterns = [
    # path('', views.home, name="blog-home"), # for function-based home 
    path('',PostListView.as_view(), name='blog-home'),
    path('about/', views.about, name="blog-about"),
]