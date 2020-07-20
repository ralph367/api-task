from django.db import models

# Create your models here.
class Agents(models.Model):
    id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=30)
    hire_date = models.DateField()
    birthday_date = models.DateField()
    city = models.CharField(max_length=20)

    def __str__(self):
        return f'{self.last_name}, {self.first_name}'

class Reports(models.Model):
    id = models.AutoField(primary_key=True)
    agent_id = models.ForeignKey(Agents, on_delete=models.CASCADE, related_name="agent", null=True)
    period = models.CharField(max_length=20)
    sales_volume = models.FloatField()

    def __str__(self):
        return f'{self.id}, {self.agent_id}'