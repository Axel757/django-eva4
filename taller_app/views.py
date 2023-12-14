from django.http import Http404, HttpResponse, HttpResponseBadRequest, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from rest_framework import generics, viewsets
from .models import *
from .forms import *
from .serializers import *
from django.db.models import Q
from django.contrib import messages


# Vistas
def verReservas(request):
    reservas = Reserva.objects.all()
    data = {"reservas": reservas}
    return render(request, "templateApp/reservas.html", data)


def verMesas(request):
    mesas = Mesa.objects.all()
    data = {"mesas": mesas}
    return render(request, "templateApp/mesas.html", data)


def verClientes(request):
    clientes = Cliente.objects.all()
    data = {"clientes": clientes}
    return render(request, "templateApp/clientes.html", data)


def reservas_clientes(request, nombre_cliente):
    cliente = get_object_or_404(Cliente, nombre=nombre_cliente)
    reservas = cliente.reserva_set.all()
    data = {"reservas": reservas, "cliente": cliente}
    return render(request, "templateApp/reservas.html", data)


# CRUD Reservas
def agendar_reservas(request):
    form = FormReserva()
    if request.method == 'POST':
        form = FormReserva(request.POST)
        try:
            if form.is_valid():
                    print('paso 3')
                    form.save()
                    messages.success(request, 'Reserva agendada con éxito!')
                    return redirect('verReservas')

            else:
                print(form.errors)
                messages.error(request, 'Verifique los datos de la reserva.')

        except Exception as e:
            error_message = f'Error al agendar la reserva: {str(e)}'
            print('Error:', error_message)
            messages.error(request, error_message)

    data = {'form': form, 'titulo': 'Agendar Reserva'}
    return render(request, 'templateForms/FormReserva.html', data)


def modificar_reservas(request, reserva_id):
    try:
        reserva = Reserva.objects.get(pk=reserva_id)
    except Reserva.DoesNotExist:
        messages.error(request, 'La reserva que intenta modificar no existe.')
        return redirect('verReservas')

    form = FormReserva(instance=reserva)

    if request.method == 'POST':
        form = FormReserva(request.POST, instance=reserva)
        try:
            if form.is_valid():
                form.save()
                messages.success(request, 'Reserva modificada con éxito!')
                return redirect('verReservas')

            else:
                print(form.errors)
                messages.error(request, 'Verifique los datos de la reserva.')

        except Exception as e:
            error_message = f'Error al modificar la reserva: {str(e)}'
            print('Error:', error_message)
            messages.error(request, error_message)

    data = {'form': form, 'titulo': 'Modificar Reserva'}
    return render(request, 'templateForms/FormReserva.html', data)


def solicitud_eliminarReserva(request, reserva_id):
    reserva = get_object_or_404(Reserva, id=reserva_id)
    return render(request, 'templateForms/ConfirmarEliminarReserva.html', {'reserva': reserva})

def eliminar_reserva(request, reserva_id):
    try:
        reserva = get_object_or_404(Reserva, id=reserva_id)
    
        if request.method == 'POST':
            reserva.delete()
            return HttpResponseRedirect(reverse('verReservas'))
    except Http404:
        return HttpResponse("Reserva no encontrada", status=404)
    except Exception as e:
        return HttpResponse(f"Ocurrió un error: {str(e)}", status=500)
    
    
# Rest Framework API

class ReservaListCreateView(generics.ListCreateAPIView):
    queryset = Reserva.objects.all().order_by('fecha_reserva')
    serializer_class = ReservaSerializer


class ReservaDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Reserva.objects.all()
    serializer_class = ReservaSerializer
