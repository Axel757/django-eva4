from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

class Mesa(models.Model):
    numero = models.IntegerField(unique=True)
    capacidad_personas = models.IntegerField()

    def __str__(self):
        return f"Mesa {self.numero}"

class Persona(models.Model):

    nombre = models.CharField(max_length=255)
    telefono = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre

class Reserva(models.Model):
    ESTADO_CHOICES = [
        ('RESERVADO', 'Reservado'),
        ('COMPLETADA', 'Completada'),
        ('ANULADA', 'Anulada'),
        ('NO_ASISTEN', 'No Asisten'),
    ]
    id_reserva = models.IntegerField(primary_key=True)
    nombre_persona = models.ForeignKey(Persona, on_delete=models.CASCADE)
    fecha_reserva = models.DateField()
    hora_reserva = models.TimeField()
    cantidad_personas = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(15)])
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES)
    mesa_asignada = models.ForeignKey(Mesa, on_delete=models.SET_NULL, null=True, blank=True)
    observacion = models.TextField(blank=True)

    def __str__(self):
        return f"Reserva de {self.nombre_persona} para {self.cantidad_personas} personas el {self.fecha_reserva} a las {self.hora_reserva}"