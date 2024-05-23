import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DangerZoneComponent } from './danger-zone.component';

describe('DangerZoneComponent', () => {
  let component: DangerZoneComponent;
  let fixture: ComponentFixture<DangerZoneComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DangerZoneComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DangerZoneComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
