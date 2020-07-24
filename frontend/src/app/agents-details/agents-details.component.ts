import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { SalesService } from '../services/sales.service';


@Component({
  selector: 'app-agents-details',
  templateUrl: './agents-details.component.html',
  styleUrls: ['./agents-details.component.css']
})
export class AgentsDetailsComponent implements OnInit {

  details: any;
  constructor(private salesService: SalesService,
    private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe(params => {
      this.getAgentDetails(params.get('id')); // in order to get different pages for each agent's id
    });
  }

  // function will be triggered on page load where it called getAgentDetails service function and returns all data of a specific agent which will be added into details in order to render it into html
  getAgentDetails(id): void {
    this.salesService.getAgentDetails(id).subscribe(
      data => {
        this.details = data;
        console.log(data);
      },
      error => {
        console.log(error);
      }
    )
  }

}
