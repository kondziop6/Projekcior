import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
    selector: 'app-root',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.css'],
    standalone: true,
    imports: [CommonModule, RouterLink],
})
export class HeaderComponent implements OnInit {
    isLogged: boolean = false;
    user: any;

    constructor(
        private userService: UserService,
        private authService: AuthService,
        private router: Router
    ) {}

    ngOnInit(): void {
        this.checkLoginStatus();
    }

    checkLoginStatus(): void {
        const token = this.userService.getToken();
        if (token) {
            this.isLogged = true;
            this.getUserInfo();
        }
    }

    async getUserInfo(): Promise<void> {
        try {
            this.user = await this.userService.getAccountInfo();
        } catch (error) {
            console.error('Error:', error);
        }
    }

    logout(): void {
        this.authService.logout().subscribe({
            next: (response) => {
                this.isLogged = false;
                this.router.navigate(['/login']);
            },
        });
    }
}
