import { Component } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.css'],
    standalone: true,
    imports: [FormsModule, RouterLink, CommonModule],
})
export class LoginComponent {
    username: string = '';
    password: string = '';
    errorMessage: string = '';

    constructor(private authService: AuthService, private router: Router) {}

    onSubmit(): void {
        this.authService.login(this.username, this.password).subscribe({
            next: (response) => {
                if (response.success) {
                    this.router.navigate(['/']);
                } else {
                    this.errorMessage =
                        response.errors.form ||
                        'Login lub hasło jest niepoprawne!';
                }
            },
        });
    }
}
