import { HttpInterceptorFn, HttpResponse } from '@angular/common/http';
import { AuthService} from '../services/auth.service';
import { inject } from '@angular/core';
import { tap } from 'rxjs';

export const tokenInterceptor: HttpInterceptorFn = (req, next) => {
    const authService = inject(AuthService);

    if (authService.isLoggedIn()) {
        req = req.clone({
            body: {
                ...(<object>req.body),
                token: authService.getToken(),
            }, setHeaders: {
                Authorization: `Bearer ${authService.getToken()}`
            }
        });
    }

    return next(req).pipe(
        tap({
            next: (response) => {
                if (response instanceof HttpResponse) {
                    if ((<any>response.body)?.errors?.token) authService.logout();
                }
            },
        })
    );
};
