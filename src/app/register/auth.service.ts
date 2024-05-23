import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }

  register(login: string, password: string, age: number | null): Observable<RegisterResponse> {
    return this.http.post<RegisterResponse>('http://localhost/keydrop2/angular/php/register.php', { login, password, age });
  }
}

interface RegisterResponse {
  token: string;
  errors: {
    login?: string;
    password?: string;
    age?: string;
  };
}

