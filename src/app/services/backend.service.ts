import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root',
})
export class BackendService {
    private apiUrl = 'http://localhost/keydrop2/angular/php'; // Zmień URL na odpowiedni

    constructor(private http: HttpClient) {}

    addSkinToInventory(playerId: number, skin: any): Observable<any> {
        const headers = new HttpHeaders({ 'Content-Type': 'application/json' });
        const body = JSON.stringify({
            player_id: playerId,
            skin_name: skin.name,
            rarity: skin.rarity,
            img: skin.img,
            skin_id: skin.id,
        });
        return this.http.post(`${this.apiUrl}/cases.php`, body, { headers });
    }

    private createAuthHeaders(): HttpHeaders {
        const token = this.getCookie('token');
        return new HttpHeaders({ Authorization: `Bearer ${token}` });
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
