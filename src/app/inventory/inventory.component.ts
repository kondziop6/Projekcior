import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { UserService } from '../services/user.service';
import { CommonModule } from '@angular/common';
import { BackendService } from '../services/backend.service';

@Component({
    selector: 'app-inventory',
    standalone: true,
    imports: [RouterLink, CommonModule],
    templateUrl: './inventory.component.html',
    styleUrls: ['./inventory.component.css'],
})
export class InventoryComponent implements OnInit {
    userData: any;
    inventory: any;

    constructor(
        private userService: UserService,
        private backendService: BackendService
    ) {}

    ngOnInit(): void {
        this.getUserData();
    }

    getUserData() {
        this.userService.getAccountInfo().subscribe({
            next: (response) => {
                this.userData = response;

                this.userService.getInventory(this.userData.Id).subscribe({
                    next: (response) => {
                        this.inventory = response;
                    },
                });
            },
        });
    }

    sellSkin(transaction_id: number) {
        this.backendService
            .sellSkin(this.userData.Id, transaction_id)
            .subscribe({
                next: (response) => {
                    if (response.success) {
                        this.getUserData();
                    } else {
                        alert(response.message);
                    }
                },
            });
    }

    upgradeSkins() {}
}
