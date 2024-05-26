import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from '../../environments/environment';

@Injectable({
    providedIn: 'root',
})
export class AuthService {
    constructor(private http: HttpClient) {}

    login(username: string, password: string): Observable<any> {
        const body = { username, password };

        return this.http
            .post<any>(environment.apiUrl + '/login.php', body)
            .pipe(
                map((response) => {
                    if (response.success && response.token) {
                        localStorage.setItem('token', response.token);
                    }

                    return response;
                })
            );
    }

    register(
        login: string,
        password: string,
        age: number | null
    ): Observable<any> {
        const body = { login, password, age };

        return this.http
            .post<any>(environment.apiUrl + '/register.php', body)
            .pipe(
                map((response) => {
                    if (response.success && response.token) {
                        localStorage.setItem('token', response.token);
                    }

                    return response;
                })
            );
    }

    isLoggedIn(): boolean {
        return localStorage.getItem('token') ? true : false;
    }

    getToken(): string {
        return localStorage.getItem('token') ?? '';
    }

    logout(): Observable<any> {
        localStorage.removeItem('token');
        return this.http.post<any>(environment.apiUrl + '/logout.php', {});
    }
}
