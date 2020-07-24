from django.db import models


class Agents(models.Model):
    """Agents model that will be saved in sqlite3 

    Args:
        id (AutoField): Primary key of the Agent model
        first_name (CharField):  
        last_name (CharField): 
        hire_date (DateField): 
        birthday_date (DateField):  
        city (CharField): 
    """
    id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=30)
    hire_date = models.DateField()
    birthday_date = models.DateField()
    city = models.CharField(max_length=20)

    def __str__(self):
        """Object return str

        returns: lastName, firstName
        """
        return f'{self.last_name}, {self.first_name}'


class Reports(models.Model):
    """Rerports model that will be saved in sqlite3 

    Args:
        id (AutoField): Primary key of the Agent model
        agent_id (ForeignKey): it is a foreign key in order to apply a report for a specific available agent only 
        period (CharField): which month the agent worked
        sales_volume (FloatField): total amount of sales per month in euro 
    """
    id = models.AutoField(primary_key=True)
    agent_id = models.ForeignKey(
        Agents, on_delete=models.CASCADE, related_name="reports", null=True)
    period = models.CharField(max_length=20)
    sales_volume = models.FloatField()

    def __str__(self):
        return f'{self.id}, {self.agent_id}'
