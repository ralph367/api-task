import { Component, OnInit } from '@angular/core';
import { SalesService } from '../services/sales.service';

@Component({
  selector: 'app-agents',
  templateUrl: './agents.component.html',
  styleUrls: ['./agents.component.css']
})
export class AgentsComponent implements OnInit {

  agents: any;

  constructor(private salesService: SalesService) { }

  ngOnInit(): void {
    this.getSalesAgents();
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

  // Function that will be triggered on delete button click from the html and will call deleteAgent service function to remove the given agent id record then reloads the table
  deleteSalesAgent(id): void {
    this.salesService.deleteAgent(id).subscribe(
      data => {
        console.log(data);
        this.getSalesAgents();
      },
      error => {
        console.log(error);
      }
    )
  }
}
