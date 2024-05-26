import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

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

    sellSkin(playerId: number, transactionId: number): Observable<any> {
        return this.http.post(environment.apiUrl + '/inventory.php', {
            action: 'delete',
            player_id: playerId,
            transaction_id: transactionId,
        });
    }
}
