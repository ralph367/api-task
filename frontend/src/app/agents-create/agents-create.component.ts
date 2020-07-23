import { Component, OnInit } from '@angular/core';

import { SalesService } from '../services/sales.service';

@Component({
  selector: 'app-agents-create',
  templateUrl: './agents-create.component.html',
  styleUrls: ['./agents-create.component.css']
})
export class AgentsCreateComponent implements OnInit {
  agent = [{
    name: 'First Name',
    value: {
      type: 'text',
      id: 'first_name'
    }
  }, {
    name: 'Last Name',
    value: {
      type: 'text',
      id: 'last_name'
    }
  }, {
    name: 'Birthday Date',
    value: {
      type: 'date',
      id: 'birthday_date'
    }
  }, {
    name: 'Hire Date',
    value: {
      type: 'date',
      id: 'hire_date'
    }
  }, {
    name: 'City',
    value: {
      type: 'text',
      id: 'city'
    }
  }
  ]
  values = {}
  constructor(private salesService: SalesService) { }

  ngOnInit(): void {
  }

  postSalesAgents(): void {
    console.log(this.values)
    this.salesService.postAgents(this.values).subscribe(
      response => {
        console.log(response);
        window.location.href="/agents"
      },
      error => {
        console.log(error);
      }
    )
  }
}
