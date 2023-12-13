from django.urls import path, include
from taller_app.views import *
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('reserva', ReservaViewSets),
router.register('mesa', MesaViewSets)


urlpatterns = [
    
    path('', include(router.urls)),
    
    path('reservas/', ReservaListCreateView.as_view(), name='reservalist'),
    path('reservas/<int:pk>/', ReservaDetailView.as_view(), name='reservadetail'),
    # path('mesa/', MesaListCreateView.as_view(), name='mesalist'),
    # path('mesa/<int:pk>', MesaDetailView.as_view(), name='mesadetail')
]