from django import forms
from taller_app.models import *
from django.core import validators
from django.core.validators import MinValueValidator, MaxLengthValidator

class MesaForm(forms.ModelForm):
    class Meta:
        model = Mesa
        fields = ['numero', 'capacidad_personas', 'estado']

    def clean_numero(self):
        numero = self.cleaned_data.get('numero')
        if Mesa.objects.filter(numero=numero).exists():
            raise forms.ValidationError('Este número de mesa ya está en uso.')
        return numero


class FormCliente(forms.ModelForm):
    nombre = forms.CharField(
        label='Nombre del Cliente',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese el nombre del cliente'}),
    )
    
    telefono = forms.CharField(
        label='Teléfono',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese el número de teléfono'}),
    )

    class Meta:
        model = Cliente
        fields = ['nombre', 'telefono']


class FormReserva(forms.ModelForm):
    nombre_cliente = forms.ModelChoiceField(
        label='Nombre del Cliente',
        queryset=Cliente.objects.all(),  # Obtén todas las instancias de Cliente
        widget=forms.Select(attrs={'class': 'form-control'}),
    )
        
    fecha_reserva = forms.DateField(
        label='Fecha de Reserva',
        widget=forms.DateInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese la fecha de reserva'}),
        error_messages={
            'invalid': 'Ingrese una fecha válida en el formato DD-MM-YYYY'
        }
    )
    
    hora_reserva = forms.TimeField(
        label='Hora de Reserva',
        widget=forms.TimeInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese la hora de reserva'}),
        error_messages={
            'invalid': 'Ingrese una hora válida en el formato HH:MM.'
        }
    )
    
    cantidad_personas = forms.IntegerField(
        label='Cantidad de Personas',
        widget=forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Cantidad de personas de asistirán'}),
    )
    
    estado = forms.ChoiceField(
        label='Estado',
        choices=Reserva.ESTADO_CHOICES,
        widget=forms.Select(attrs={'class': 'form-control'}),
    )
    
    mesa_asignada = forms.ModelChoiceField(
        label='Mesa Asignada',
        queryset=Mesa.objects.filter(),  # Filtra las mesas no ocupadas
        widget=forms.Select(attrs={'class': 'form-control'}),
    )
    
    observacion = forms.CharField(
        label='Observación',
        widget=forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Ingrese observaciones'}),
        required=False,
    )
    
    class Meta:
        model = Reserva
        fields = ['nombre_cliente', 'fecha_reserva', 'hora_reserva', 'cantidad_personas', 'estado', 'mesa_asignada', 'observacion']
