# Generated by Django 4.2.7 on 2023-12-14 09:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('taller_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reserva',
            name='nombre_cliente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='taller_app.cliente'),
        ),
    ]
