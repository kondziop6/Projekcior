import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegisterComponent } from './register/register.component';
import { LogoutComponent } from './logout/logout.component';
import { LoginComponent } from './login/login.component';
import { HeaderComponent} from './header/header.component';
import { ChromaComponent } from './chroma/chroma.component';
import { Chroma2Component } from './chroma2/chroma2.component';
import { DangerZoneComponent } from './danger-zone/danger-zone.component';
import { FalchionComponent } from './falchion/falchion.component';
import { ShadowComponent } from './shadow/shadow.component';


export const routes: Routes = [
  { path: 'register', component: RegisterComponent },
  { path: 'logout', component: LogoutComponent },
  { path: 'login', component: LoginComponent },
  { path: 'chroma', component: ChromaComponent },
  { path: 'chroma2', component: Chroma2Component },
  { path: 'danger-zone', component: DangerZoneComponent },
  { path: 'falchion', component: FalchionComponent },
  { path: 'shadow', component: ShadowComponent },
  { path: '', component: HeaderComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
