import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { UserService } from '../services/user.service';

@Component({
    selector: 'app-inventory',
    standalone: true,
    imports: [RouterLink],
    templateUrl: './inventory.component.html',
    styleUrl: './inventory.component.css',
})
export class InventoryComponent implements OnInit {
    userData: any;
    inventory: string = "";

    constructor(private userService: UserService) {}

    ngOnInit(): void {
        this.userService.getAccountInfo().subscribe({
            next: (response) => {
                this.userData = response;

                this.userService.getInventory(this.userData.Id).subscribe({next: (response) => {
                    this.inventory = response;
                }})
            },
        });
    }

    upgradeSkins() {}
}
