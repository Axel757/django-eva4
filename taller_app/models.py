from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

class Mesa(models.Model):
    numero = models.IntegerField(unique=True)
    capacidad_personas = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(15)])
    estado = models.BooleanField(default=False)

    def __str__(self):

        return f"Mesa {self.numero}"

class Cliente(models.Model):

    nombre = models.CharField(max_length=255)
    telefono = models.CharField(max_length=9)

    def __str__(self):
        return self.nombre

class Reserva(models.Model):
    ESTADO_CHOICES = [
        ('RESERVADO', 'Reservado'),
        ('COMPLETADA', 'Completada'),
        ('ANULADA', 'Anulada'),
        ('NO ASISTEN', 'No Asisten'),
        ('', 'Elija el estado de la Reserva'),
    ]
    
    nombre_cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    telefono = models.CharField(max_length=9)        
    fecha_reserva = models.DateField()
    hora_reserva = models.TimeField()
    cantidad_personas = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(15)])
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES)
    mesa_asignada = models.ForeignKey(Mesa, on_delete=models.SET_NULL, null=True, blank=True)
    observacion = models.TextField(blank=True , max_length= 256)
    
    def save(self):

        if self.estado == 'RESERVADO' and self.mesa_asignada:
            self.mesa_asignada.estado = True
            self.mesa_asignada.save()

        super().save()
    def __str__(self):
        return f"Reserva de {self.nombre_cliente} para {self.cantidad_personas} personas el {self.fecha_reserva} a las {self.hora_reserva}"
    
    class Meta:
        ordering = ['fecha_reserva'] 