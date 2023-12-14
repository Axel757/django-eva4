from django.urls import path, include
from taller_app.views import *
from rest_framework.routers import DefaultRouter

router = DefaultRouter()


urlpatterns = [
    
    # Views
    path('reservas/', verReservas, name='verReservas'),
    path('mesas/', verMesas, name='verMesas'),
    path('clientes/', verClientes, name='verClientes'),
    path('reservas/clientes/<str:nombre_cliente>/', reservas_clientes, name='reservas_clientes'),
    
    
    #Crud Reservas
    path('reservas/agendar/', agendar_reservas, name='agendar_reservas'),
    path('reservas/modificar/<int:reserva_id>/', modificar_reservas, name='modificarReservas'),
    path('reservas/eliminar/<int:reserva_id>/', solicitud_eliminarReserva, name='solicitareliminacion'),
    path('reservas/<int:reserva_id>/', eliminar_reserva, name='eliminar_reserva'),

        
    # Rest Framework API
    path('api/', include(router.urls)),
    path('api/reservas/', ReservaListCreateView.as_view(), name='reservalist'),
    path('api/reservas/<int:pk>/', ReservaDetailView.as_view(), name='reservadetail'),

]