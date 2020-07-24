from .models import Agents, Reports
from rest_framework import serializers


class ReportSerializer(serializers.ModelSerializer):
    """Serializer allow complex data to be converted to native Python in order to be rendered as JSON
    return:
        All the model field
    """
    class Meta:
        model = Reports
        fields = '__all__'


class AgentSerializer(serializers.ModelSerializer):
    """Serializer allow complex data to be converted to native Python in order to be rendered as JSON
    return:
        All the model field including each agent own report using nested serializer method
    """
    reports = ReportSerializer(many=True, read_only=True)

    class Meta:
        model = Agents
        fields = '__all__'
