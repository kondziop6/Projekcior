import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShadowComponent } from './shadow.component';

describe('ShadowComponent', () => {
  let component: ShadowComponent;
  let fixture: ComponentFixture<ShadowComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ShadowComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ShadowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
