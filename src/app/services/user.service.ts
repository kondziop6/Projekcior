import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
    providedIn: 'root',
})
export class UserService {
    constructor(private http: HttpClient) {}

    getAccountInfo(): Observable<any> {
        const token = this.getCookie('token');
        return this.http.get<any>(environment.apiUrl + '/getAccountInfo.php', {
            headers: { Authorization: `Bearer ${token}` },
        });
    }

    getInventory(player_id: string): Observable<string> {
        return this.http.post(
            environment.apiUrl + '/inventory.php',
            {
                player_id,
                action: 'fetch',
            },
            { responseType: 'text' }
        );
    }
    
    getToken() {
        return this.getCookie("token");
    }

    private getCookie(name: string): string {
        const nameEQ = name + '=';
        const ca = document.cookie.split(';');
        for (let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) == 0)
                return c.substring(nameEQ.length, c.length);
        }
        return '';
    }
}
