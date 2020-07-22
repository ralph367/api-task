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
}
