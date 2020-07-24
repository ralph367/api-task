from rest_framework import viewsets
from .models import Agents, Reports
from .serializers import AgentSerializer, ReportSerializer


class AgentViewSet(viewsets.ModelViewSet):
    """Viewset of Agent model with existing base classes that provide a default set of behavior ordered by last name
    """
    queryset = Agents.objects.all().order_by('last_name')
    serializer_class = AgentSerializer


class ReportViewSet(viewsets.ModelViewSet):
    """Viewset of Report model with existing base classes that provide a default set of behavior ordered by id
    """
    queryset = Reports.objects.all().order_by('id')
    serializer_class = ReportSerializer
