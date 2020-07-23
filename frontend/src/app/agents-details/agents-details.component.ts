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
      this.getAgentDetails(params.get('id'));
    });
  }

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
