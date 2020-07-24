import json
from rest_framework import status
from rest_framework.test import APIClient
from django.test import TestCase, Client
from .models import Agents, Reports
from .serializers import AgentSerializer, ReportSerializer

apiclient = APIClient()


class GetReportsAgentsTest(TestCase):
    """ Unit test to get single/all reports/agents and delete an agent/report record 

    """
    def setUp(self):
        Agents.objects.create(first_name="James",
                              last_name="Romero",
                              hire_date='2019-01-25',
                              birthday_date='1975-06-10',
                              city="Munich")
        Agents.objects.create(first_name="Kayla",
                              last_name="Arias",
                              hire_date='2019-04-26',
                              birthday_date='1991-05-05',
                              city="Berlin")
        Reports.objects.create(agent_id=Agents.objects.get(first_name="James"),
                               period="2020, June",
                               sales_volume=222.0)
        self.valid_report_payload = {
            "id": 1,
            "period": "2020, June",
            "sales_volume": 222.0,
            "agent_id": 1
        }
        self.valid_agent_payload = {
            "id": 1,
            "first_name": "James",
            "last_name": "Romero",
            "hire_date": "2019-01-25",
            "birthday_date": "1975-06-10",
            "city": "Munich",
            "reports": [self.valid_report_payload]
        }

    def test_get_all_agents(self):
        response = apiclient.get('/api/agents/')
        agents = Agents.objects.all().order_by('last_name')
        serializer = AgentSerializer(agents, many=True)
        self.assertEqual(response.data, serializer.data)

    def test_get_all_reports(self):
        response = apiclient.get('/api/reports/')
        reports = Reports.objects.all().order_by('id')
        serializer = ReportSerializer(reports, many=True)
        self.assertEqual(response.data, serializer.data)

    def test_get_agent(self):
        response = apiclient.get('/api/agents/1/')
        self.assertEqual(json.loads(response.content),
                         self.valid_agent_payload)

    def test_get_report(self):
        response = apiclient.get('/api/reports/1/')
        self.assertEqual(json.loads(response.content),
                         self.valid_report_payload)

    def test_delete_agent(self):
        response = apiclient.delete('/api/agents/1/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

        
    def test_delete_report(self):
        response = apiclient.delete('/api/reports/1/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


class PostReportsAgentsTest(TestCase):
    """ creating report/agent new record using post request
    """
    def setUp(self):
        Agents.objects.create(first_name="Kayla",
                              last_name="Arias",
                              hire_date='2019-04-26',
                              birthday_date='1991-05-05',
                              city="Berlin")
        self.valid_agent_payload = {
            "id": 2,
            "first_name": "James",
            "last_name": "Romero",
            "hire_date": "2019-01-25",
            "birthday_date": "1975-06-10",
            "city": "Munich",
        }
        self.valid_report_payload = {
            "id": 1,
            "period": "2020, June",
            "sales_volume": 222.0,
            "agent_id": []
        }

    def test_post_agent(self):
        response = apiclient.post(
            '/api/agents/', self.valid_agent_payload, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_post_report(self):
        agent = Agents.objects.get(id=1)
        self.valid_report_payload["agent_id"] = agent.id
        response = apiclient.post(
            '/api/reports/', self.valid_report_payload, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
