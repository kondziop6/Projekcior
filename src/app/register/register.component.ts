import { Component } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-register',
    templateUrl: './register.component.html',
    styleUrls: ['./register.component.css'],
    imports: [RouterLink, FormsModule, CommonModule],
    standalone: true,
})
export class RegisterComponent {
    login: string = '';
    password: string = '';
    age: number | null = null;
    errorMessage: string = '';

    constructor(private authService: AuthService, private router: Router) {}

    onSubmit(): void {
        this.authService
            .register(this.login, this.password, this.age)
            .subscribe({
                next: (response) => {
                    if (response.token) {
                        this.router.navigate(['/']);
                    } else {
                        this.errorMessage =
                            response.errors.login ||
                            response.errors.password ||
                            response.errors.age ||
                            'Wystąpił błąd podczas rejestracji!';
                    }
                },
            });
    }
}
