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
        return this.http.get<any>(environment.apiUrl + '/getAccountInfo.php');
    }

    getInventory(player_id: string): Observable<any> {
        return this.http.post(environment.apiUrl + '/inventory.php', {
            player_id,
            action: 'fetch',
        });
    }

    getToken() {
        return localStorage.getItem('token');
    }
}
