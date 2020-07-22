import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportsCreateComponent } from './reports-create.component';

describe('ReportsCreateComponent', () => {
  let component: ReportsCreateComponent;
  let fixture: ComponentFixture<ReportsCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReportsCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReportsCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
