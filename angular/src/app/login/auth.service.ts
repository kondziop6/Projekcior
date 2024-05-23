import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private loginUrl = 'http://localhost/keydrop2/angular/php/login.php'; // Aktualizuj tę ścieżkę

  constructor(private http: HttpClient) { }

  login(username: string, password: string): Observable<any> {
    const headers = new HttpHeaders({ 'Content-Type': 'application/json' });
    const body = { username, password };

    return this.http.post<any>(this.loginUrl, body, { headers }).pipe(
      map(response => {
        if (response.success && response.token) {
          document.cookie = `token=${response.token}; path=/; max-age=${7 * 24 * 60 * 60}`;
        }
        return response;
      })
    );
  }
}
