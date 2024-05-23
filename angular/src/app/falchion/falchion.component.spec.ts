import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FalchionComponent } from './falchion.component';

describe('FalchionComponent', () => {
  let component: FalchionComponent;
  let fixture: ComponentFixture<FalchionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FalchionComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FalchionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
