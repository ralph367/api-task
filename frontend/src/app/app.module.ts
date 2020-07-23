import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http'
import { RouterModule } from '@angular/router'
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ReportsComponent } from './reports/reports.component';
import { AgentsComponent } from './agents/agents.component';
import { AgentsDetailsComponent } from './agents-details/agents-details.component';
import { AgentsCreateComponent } from './agents-create/agents-create.component';
import { ReportsCreateComponent } from './reports-create/reports-create.component';

@NgModule({
  declarations: [
    AppComponent,
    ReportsComponent,
    AgentsComponent,
    AgentsDetailsComponent,
    AgentsCreateComponent,
    ReportsCreateComponent
  ],
  imports: [
    FormsModule,
    ReactiveFormsModule,
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    RouterModule.forRoot([
      { path: 'agents', component: AgentsComponent},
      { path: 'reports', component: ReportsComponent},
      { path: 'addagents', component: AgentsCreateComponent},
      { path: 'agents/:id', component: AgentsDetailsComponent}
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
