from django.contrib import admin
from django.urls import path
from .views import login_view, register_view, logout_view, home_view
from django.contrib.auth.views import LoginView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/login/', login_view, name='login'),
    path('accounts/register/', register_view, name='register'),
    path('accounts/logout/', logout_view, name='logout'),
    path('', home_view, name='home'),
]