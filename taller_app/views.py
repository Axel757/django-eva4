from django.http import HttpResponseBadRequest, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from rest_framework import generics, viewsets
from .models import *
from .serializers import *
from django.db.models import Q

class ReservaViewSets(viewsets.ModelViewSet,):
    queryset = Reserva.objects.all()
    serializer_class = ReservaSerializer
    
class ReservaListCreateView(generics.ListCreateAPIView):
    queryset = Reserva.objects.all().order_by('fecha_reserva')
    serializer_class = ReservaSerializer

    

  
class ReservaDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Reserva.objects.all()
    serializer_class = ReservaSerializer
    

    def get_response(self, data, status=200):
        return render(self.request, "base.html", {'data': data, 'status': status})

class MesaViewSets(viewsets.ModelViewSet):
    queryset = Mesa.objects.all()
    serializer_class = MesaSerializer

class MesaListCreateView(generics.ListCreateAPIView):
    queryset = Mesa.objects.all()
    serializer_class = MesaSerializer

class MesaDetailView(generics.RetrieveAPIView):
    queryset = Mesa.objects.all()
    serializer_class = MesaSerializer