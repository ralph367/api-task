import { Component, OnInit } from '@angular/core';
import { SalesService } from '../services/sales.service';

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.css']
})
export class ReportsComponent implements OnInit {

  reports: any;
  agents: any;
  constructor(private salesService: SalesService) { }

  ngOnInit(): void {
    this.getSalesAgents();
    this.getSalesReports();
  }

  // Function that will be triggered on page load, then it will call getAgents service function and adding the received data into agents to render it into html
  getSalesAgents(): void {
    this.salesService.getAgents().subscribe(
      data => {
        this.agents = data;
        console.log(data);
      },
      error => {
        console.log(error);
      }
    )
  }

  // Function that will be triggered on page load, then it will call getReports service function and adding the received data into reports to render it into html
  getSalesReports(): void {
    this.salesService.getReports().subscribe(
      data => {
        this.reports = data;
        console.log(data);
      },
      error => {
        console.log(error);
      }
    )
  }

  // Function that will be triggered on table load in order to get the Agent name by using his ID
  getAgentNameById(message: Object) {
    var name = "Loading"
    if (this.agents != undefined) {
      for (let agent of this.agents)
        if (agent.id == message)
          name = agent.first_name + " " + agent.last_name;
    }
    return name
  }

  // Function that will be triggered on delete button click from the html and will call deleteReport service function to remove the given agent id record then reloads the table
  deleteSalesReport(id): void{
    this.salesService.deleteReport(id).subscribe(
      data => {
        this.getSalesAgents();
        this.getSalesReports();
        console.log(data);
      },
      error => {
        console.log(error);
      }
    )
  }
}
