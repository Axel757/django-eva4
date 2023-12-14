from django.urls import path, include
from taller_app.views import *
from rest_framework.routers import DefaultRouter

router = DefaultRouter()


urlpatterns = [
    
    # Views
    path('reservas/', verReservas, name='verReservas'),
    path('mesas/', verMesas, name='verMesas'),
    path('clientes/', verClientes, name='verClientes'),
    path('reservas/cliente/<int:cliente_id>/', detalle_clientes, name='detalle_clientes'),
    path('clientes/reservas/<int:reserva_id>/', detalle_reservas, name='detalle_reservas'),
    
    
    #Crud Reservas
    path('reservas/agendar/', agendar_reservas, name='agendar_reservas'),
    path('reservas/modificar/<int:reserva_id>/', modificar_reservas, name='modificarReservas'),
    path('reservas/eliminar/<int:reserva_id>/', solicitud_eliminarReserva, name='solicitareliminacion'),
    path('reservas/<int:reserva_id>/', eliminar_reserva, name='eliminar_reserva'),

    #Crud Personas
    path('clientes/modificar/<int:cliente_id>/', modificar_cliente, name='modificar_cliente'),
    path('clientes/agregar/', crear_cliente, name='crear_cliente'),
    path('clientes/eliminar/<int:cliente_id>/', solicitud_eliminar_cliente, name='solicitud_eliminar_cliente'),
    path('clientes/eliminar/<int:cliente_id>/confirmar/', eliminar_cliente, name='eliminar_cliente'),
    
    
    #Crud Mesa
    path('mesas/agregar/', crear_mesa, name='crear_mesa'),
    path('mesas/modificar/<int:mesa_id>/', modificar_mesa, name='modificar_mesa'),

    path('mesas/eliminar/<int:mesa_id>/', solicitud_eliminar_mesa, name='solicitud_eliminar_mesa'),
    path('mesas/eliminar/<int:mesa_id>/confirmar/', eliminar_mesa, name='eliminar_mesa'),    
        
    # Rest Framework API
    path('api/', include(router.urls)),
    path('api/reservas/', ReservaListCreateView.as_view(), name='reservalist'),
    path('api/reservas/<int:pk>/', ReservaDetailView.as_view(), name='reservadetail'),

]