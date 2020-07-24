from rest_framework import routers
from .viewsets import AgentViewSet, ReportViewSet

# routing all the agents and reports viewset functions
router = routers.DefaultRouter()
router.register(r'agents', AgentViewSet)
router.register(r'reports', ReportViewSet)
