import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms'; 
import { RouterModule, Routes } from '@angular/router'; 
import { CommonModule } from '@angular/common'; 

import { AppComponent } from './app.component';
import { RegisterComponent } from './register/register.component';
import { LogoutComponent } from './logout/logout.component';
import { LoginComponent } from './login/login.component';
import { HeaderComponent } from './header/header.component';
import { AuthService } from './login/auth.service';
import { AppRoutingModule } from './app.routes';


// Definicja tras
const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: '', redirectTo: '/login', pathMatch: 'full' },
];

@NgModule({
  declarations: [
    AppComponent,
    RegisterComponent,
    LogoutComponent,
    LoginComponent,
    HeaderComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule, 
    CommonModule, // Dodaj CommonModule
    AppRoutingModule,
    RouterModule.forRoot(routes) // RouterModule konfiguracja
  ],
  providers: [AuthService],
  bootstrap: [AppComponent]
})
export class AppModule { }
