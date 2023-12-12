from django.urls import path
from taller_app.views import *



urlpatterns = [
    path('api/reservas/', ReservaListCreateView.as_view(), name='reservalist'),
    path('api/reservas/<int:pk>/', ReservaDetailView.as_view(), name='reservadetail'),
]