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

  getAgentNameById(message: Object) {
    var name = "Loading"
    if (this.agents != undefined) {
      for (let agent of this.agents)
        if (agent.id == message)
          name = agent.first_name + " " + agent.last_name;
    }
    return name
  }

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
