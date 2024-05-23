import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  constructor(private http: HttpClient) { }

  getToken(): string | null {
    return localStorage.getItem('token');
  }

  getAccountInfo(): Observable<any> {
    const token = this.getToken();
    return this.http.get<any>('getAccountInfo.php', { headers: { Authorization: `Bearer ${token}` } });
  }

  logout(): Observable<any> {
    const token = this.getToken();
    localStorage.removeItem('token');
    return this.http.post<any>('logout.php', { token });
  }
}
