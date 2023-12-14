# Generated by Django 4.2.7 on 2023-12-14 08:48

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=255)),
                ('telefono', models.CharField(max_length=9, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Mesa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(unique=True)),
                ('capacidad_personas', models.IntegerField(validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(15)])),
                ('estado', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Reserva',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre_cliente', models.CharField(max_length=50)),
                ('telefono', models.CharField(max_length=9, unique=True)),
                ('fecha_reserva', models.DateField()),
                ('hora_reserva', models.TimeField()),
                ('cantidad_personas', models.IntegerField(validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(15)])),
                ('estado', models.CharField(choices=[('RESERVADO', 'Reservado'), ('COMPLETADA', 'Completada'), ('ANULADA', 'Anulada'), ('NO ASISTEN', 'No Asisten'), ('', 'Elija el estado de la Reserva')], max_length=20)),
                ('observacion', models.TextField(blank=True, max_length=256)),
                ('mesa_asignada', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='taller_app.mesa')),
            ],
        ),
    ]
