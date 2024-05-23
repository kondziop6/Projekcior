import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Chroma2Component } from './chroma2.component';

describe('Chroma2Component', () => {
  let component: Chroma2Component;
  let fixture: ComponentFixture<Chroma2Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Chroma2Component]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(Chroma2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
