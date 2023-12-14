from django.contrib import admin
from .models import *


admin.site.register(Cliente)

@admin.register(Mesa)
class MesaAdmin(admin.ModelAdmin):
    list_display = ('numero', 'capacidad_personas')

@admin.register(Reserva)
class ReservaAdmin(admin.ModelAdmin):
    list_display = ('nombre_cliente', 'fecha_reserva', 'hora_reserva', 'estado', 'mesa_asignada')
    

