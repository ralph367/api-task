from rest_framework import viewsets
from .models import Agents, Reports
from .serializers import AgentSerializer, ReportSerializer


class AgentViewSet(viewsets.ModelViewSet):
    queryset = Agents.objects.all().order_by('last_name')
    serializer_class = AgentSerializer


class ReportViewSet(viewsets.ModelViewSet):
    queryset = Reports.objects.all().order_by('id')
    serializer_class = ReportSerializer
