from rest_framework import routers
from .viewsets import AgentViewSet, ReportViewSet

router = routers.DefaultRouter()
router.register(r'agents', AgentViewSet)
router.register(r'reports', ReportViewSet)
