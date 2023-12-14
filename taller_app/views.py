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

def detalle_clientes(request, cliente_id):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    reservas = cliente.reserva_set.all()
    data = {"reservas": reservas, "cliente": cliente}
    return render(request, "templateApp/clientes.html", data)


def detalle_reservas(request, reserva_id):
    reserva = get_object_or_404(Reserva, id=reserva_id)
    print(reserva)
    clientes =  reserva.cliente_set.all()
    data = {"reserva": reserva, "clientes": clientes}
    return render(request, "templateApp/clientes.html", data)

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
    
 

#Crud clientes

def crear_cliente(request):
    if request.method == 'POST':
        form = FormCliente(request.POST)
        if form.is_valid():
            form.save()
            return redirect('verClientes')
    else:
        form = FormCliente()

    return render(request, 'templateForms/FormClientes.html', {'form': form}) 


def solicitud_eliminar_cliente(request, cliente_id):
    cliente = get_object_or_404(Cliente, id=cliente_id)
    return render(request, 'templateForms/ConfirmarEliminarReserva.html', {'cliente': cliente})

def eliminar_cliente(request, cliente_id):
    try:
        cliente = get_object_or_404(Cliente, id=cliente_id)
    
        if request.method == 'POST':
            cliente.delete()
            return HttpResponseRedirect(reverse('verClientes'))
    except Http404:
        return HttpResponse("cliente no encontrado", status=404)
    except Exception as e:
        return HttpResponse(f"Ocurrió un error: {str(e)}", status=500)
    
    

def modificar_cliente(request, cliente_id=None):
    # Verifica si se proporciona un ID de cliente
    if cliente_id:
        cliente = get_object_or_404(Cliente, id=cliente_id)
        form = FormCliente(request.POST or None, instance=cliente)
    else:
        form = FormCliente(request.POST or None)

    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('verClientes')

    return render(request, 'templateForms/FormClientes.html', {'form': form})    
    
    
#Crud Mesa

def crear_mesa(request):
    if request.method == 'POST':
        form = MesaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('verMesas')
    else:
        form = MesaForm()

    return render(request, 'templateForms/FormMesas.html', {'form': form})

def solicitud_eliminar_mesa(request, mesa_id):
    mesa = get_object_or_404(Mesa, id=mesa_id)
    return render(request, 'templateForms/ConfirmarEliminarReserva.html', {'mesa': mesa})

def eliminar_mesa(request, mesa_id):
    try:
        mesa = get_object_or_404(Mesa, id=mesa_id)
    
        if request.method == 'POST':
            mesa.delete()
            return HttpResponseRedirect(reverse('verMesas'))
        elif request.method == 'GET':
            # Aquí puedes redirigir o renderizar una plantilla de confirmación
            return render(request, 'templateForms/ConfirmarEliminarReserva.html', {'mesa': mesa})
    except Http404:
        return HttpResponse("Mesa no encontrada", status=404)
    except Exception as e:
        return HttpResponse(f"Ocurrió un error: {str(e)}", status=500)

def modificar_mesa(request, mesa_id=None):
    # Verifica si se proporciona un ID de mesa
    if mesa_id:
        mesa = get_object_or_404(Mesa, id=mesa_id)
        form = MesaForm(request.POST or None, instance=mesa)
    else:
        form = MesaForm(request.POST or None)

    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('verMesas')

    return render(request, 'templateForms/FormMesas.html', {'form': form})
 
 
    
# Rest Framework API

class ReservaListCreateView(generics.ListCreateAPIView):
    queryset = Reserva.objects.all().order_by('fecha_reserva')
    serializer_class = ReservaSerializer


class ReservaDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Reserva.objects.all()
    serializer_class = ReservaSerializer
