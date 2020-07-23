import { Component, OnInit } from '@angular/core';

import { SalesService } from '../services/sales.service';

@Component({
  selector: 'app-reports-create',
  templateUrl: './reports-create.component.html',
  styleUrls: ['./reports-create.component.css']
})
export class ReportsCreateComponent implements OnInit {
  agents: any;
  report = [{
    name: 'Agent',
    value: {
      type: 'option',
      id: 'agent_id'
    }
  }, {
    name: 'Period',
    value: {
      type: 'month',
      id: 'period'
    }
  }, {
    name: 'Sales Volume',
    value: {
      type: 'number',
      id: 'sales_volume'
    }
  } 
  ]
  values = {}
  constructor(private salesService: SalesService) { }

  ngOnInit(): void {
    this.getSalesAgents();
  }

  getSalesAgents(): void{
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

  postSalesReports(): void {
    console.log(this.values)
    this.salesService.postReports(this.values).subscribe(
      response => {
        console.log(response);
        window.location.href="/reports"
      },
      error => {
        console.log(error);
      }
    )
  }
}
