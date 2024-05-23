import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.css']
})
export class LogoutComponent {
  constructor(private http: HttpClient, private router: Router) {}

  logout() {
    const token = localStorage.getItem('token');
    this.http.post('/api/logout.php', { token }).subscribe(
      (response: any) => {
        if (response.success) {
          localStorage.removeItem('token');
          this.router.navigate(['/login']);
        } else {
          alert(response.errors.token);
        }
      },
      error => {
        console.error('Logout error', error);
      }
    );
  }
}
