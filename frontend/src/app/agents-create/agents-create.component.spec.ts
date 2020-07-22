import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AgentsCreateComponent } from './agents-create.component';

describe('AgentsCreateComponent', () => {
  let component: AgentsCreateComponent;
  let fixture: ComponentFixture<AgentsCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AgentsCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AgentsCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
