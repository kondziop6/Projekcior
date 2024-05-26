import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import {
    AfterViewInit,
    Component,
    ElementRef,
    OnInit,
    ViewChild,
} from '@angular/core';

import { environment } from '../../environments/environment.development';
import { RouterLink } from '@angular/router';

@Component({
    selector: 'app-chroma',
    standalone: true,
    imports: [CommonModule, RouterLink],
    templateUrl: './chroma.component.html',
    styleUrl: './chroma.component.css',
})
export class ChromaComponent implements OnInit {
    @ViewChild('cardList') public cardList: ElementRef | undefined;

    czyLosuje: boolean = false;
    cardListSkins: any[] = [];

    constructor(private http: HttpClient) {}

    img: any = {
        blue1: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_sektor_light_large.c957e70c656024b2c062f7af2031a76cb3c83f1c.png',
        blue2: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_aq_scar20_leak_light_large.06b9231638ba347e91c671ecf2c1364754794893.png',
        blue3: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_sigla_light_large.71c180cd3b8bdea7d0b119ab2b9d54792c51b3aa.png',
        blue4: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_deathtoll_light_large.cfcc6a17037a33bbb524ca1856c07cf76dda449d.png',
        blue5: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_deadly_poison_light_large.0776976e709ec7b503dd7e47b8c962338615b5da.png',
        purple1:
            'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_deva_light_large.9ffde04f2f082dce492b2fa6e250f69f538a50b5.png',
        purple2:
            'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_elites_urbanstorm_light_large.d33c9dd65434d8b9f4e7b5092fcc2e07a874e625.png',
        purple3:
            'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_mac10_malachite_light_large.65b0eff12e655fb94ec9de545348178f1a5d60e0.png',
        purple4:
            'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_deagle_naga_light_large.b410ad835b1894a448676ae0590586298af2cb33.png',
        pink1: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_mandala_light_large.0acb51464cd72643c6a1fefaf8736288eb5d02f7.png',
        pink2: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_ancestral_light_large.cbd9732689f42b7aec91bdb9166b1ee414974cb7.png',
        pink3: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_aq_ak47_cartel_light_large.2e7be9f4c7bda304f2a7c374260d95affca93f0b.png',
        red1: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_am_awp_glory_light_large.348eae0f5d4da8671886826648dd4197a9829090.png',
        red2: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_abrasion_light_large.8398e4836a0c26add3514a6af2262704d85fec07.png',
        yellow: 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_knife_m9_bayonet_an_tiger_orange_light_large.49d5afb6d7f17cb0b384be1416a9533841174ac5.png',
    };

    skins: any = [];

    skins_table: any = {
        blue1: 'M249 | System Lock',
        blue2: 'SCAR-20 | Grotto',
        blue3: 'XM1014 | Quicksilver',
        blue4: 'Glock-18 | Catacombs',
        blue5: 'MP9 | Deadly Poison',
        purple1: 'Sawed-Off | Serenity',
        purple2: 'Dual Berettas | Urban Shock',
        purple3: 'MAC-10 | Malachite',
        purple4: 'Desert Eagle | Naga',
        pink1: 'P250 | Muertos',
        pink2: 'M4A4 | 龍王 (Dragon King)',
        pink3: 'AK-47 | Cartel',
        red1: "AWP | Man-o'-war",
        red2: 'Galil AR | Chatterbox',
        yellow: 'Knife',
    };

    ngOnInit() {
        this.http.post(environment.apiUrl + "/chroma.php", {}).subscribe({
            next: (response) => {
                this.skins = response;
            },
        });

        // XD?
        setInterval(() => this.czyLosuje, 500);
    }

    sleep(ms: number) {
        return new Promise((resolve) => setTimeout(resolve, ms));
    }

    reset() {
        this.cardListSkins = [];
        var losowySkinDanejJakosci = 0;
        var element = {};

        for (var i = 0; i < 210; i++) {
            var szansaNaSkina = this.random(1, 100);

            if (szansaNaSkina < 100) {
                losowySkinDanejJakosci = this.random(1, 5);
                if (losowySkinDanejJakosci > 0)
                    element = {
                        idskin: '68',
                        color: 'lightblue',
                        rarity: 'blue',
                        itemNumber: i,
                        img: this.img.blue1,
                    };
                if (losowySkinDanejJakosci > 1)
                    element = {
                        idskin: '69',
                        color: 'lightblue',
                        rarity: 'blue2',
                        itemNumber: i,
                        img: this.img.blue2,
                    };
                if (losowySkinDanejJakosci > 2)
                    element = {
                        idskin: '70',
                        color: 'lightblue',
                        rarity: 'blue3',
                        itemNumber: i,
                        img: this.img.blue3,
                    };
                if (losowySkinDanejJakosci > 3)
                    element = {
                        idskin: '71',
                        color: 'lightblue',
                        rarity: 'blue4',
                        itemNumber: i,
                        img: this.img.blue4,
                    };
                if (losowySkinDanejJakosci > 4)
                    element = {
                        idskin: '72',
                        color: 'lightblue',
                        rarity: 'blue5',
                        itemNumber: i,
                        img: this.img.blue5,
                    };
            }
            if (szansaNaSkina < 20) {
                losowySkinDanejJakosci = this.random(1, 4);
                if (losowySkinDanejJakosci > 0)
                    element = {
                        idskin: '73',
                        color: 'purple',
                        rarity: 'purple1',
                        itemNumber: i,
                        img: this.img.purple1,
                    };
                if (losowySkinDanejJakosci > 1)
                    element = {
                        idskin: '74',
                        color: 'purple',
                        rarity: 'purple2',
                        itemNumber: i,
                        img: this.img.purple2,
                    };
                if (losowySkinDanejJakosci > 2)
                    element = {
                        idskin: '75',
                        color: 'purple',
                        rarity: 'purple3',
                        itemNumber: i,
                        img: this.img.purple3,
                    };
                if (losowySkinDanejJakosci > 3)
                    element = {
                        idskin: '76',
                        color: 'purple',
                        rarity: 'purple4',
                        itemNumber: i,
                        img: this.img.purple4,
                    };
            }
            if (szansaNaSkina < 5) {
                losowySkinDanejJakosci = this.random(1, 3);
                if (losowySkinDanejJakosci > 0)
                    element = {
                        idskin: '77',
                        color: 'hotpink',
                        rarity: 'pink1',
                        itemNumber: i,
                        img: this.img.pink1,
                    };
                if (losowySkinDanejJakosci > 1)
                    element = {
                        idskin: '78',
                        color: 'hotpink',
                        rarity: 'pink2',
                        itemNumber: i,
                        img: this.img.pink2,
                    };
                if (losowySkinDanejJakosci > 2)
                    element = {
                        idskin: '79',
                        color: 'hotpink',
                        rarity: 'pink3',
                        itemNumber: i,
                        img: this.img.pink3,
                    };
            }
            if (szansaNaSkina < 2) {
                losowySkinDanejJakosci = this.random(1, 2);
                if (losowySkinDanejJakosci > 0)
                    element = {
                        idskin: '80',
                        color: 'red',
                        rarity: 'red1',
                        itemNumber: i,
                        img: this.img.red1,
                    };
                if (losowySkinDanejJakosci > 1)
                    element = {
                        idskin: '81',
                        color: 'red',
                        rarity: 'red2',
                        itemNumber: i,
                        img: this.img.red2,
                    };
            }
            if (szansaNaSkina <= 0.5) {
                element = {
                    idskin: '82',
                    color: 'yellow',
                    rarity: 'yellow',
                    itemNumber: i,
                    img: this.img.yellow,
                };
            }

            this.cardListSkins.push(element);
        }
    }

    async openCase() {
        if (!this.cardList) return;

        this.czyLosuje = true;

        this.reset();
        await this.sleep(1);

        var childNumber = this.random(0, 209);
        var cardWidth = 200;
        var pasek = this.cardList.nativeElement.clientWidth / 2;
        var rand = childNumber * cardWidth - pasek + cardWidth / 2;

        let elem = this.cardList.nativeElement.querySelector('#cardList > div');
        let animation = elem.animate(
            { marginLeft: ['0px', -rand + 'px'] },
            {
                duration: 5000,
                easing: 'ease-in-out',
                iterations: 1,
                fill: 'forwards',
            }
        );

        animation.onfinish = () => {
            this.czyLosuje = false;

            let element = this.cardList?.nativeElement.querySelector(
                '#itemNumber' + childNumber
            );
            element.style.background = 'linear-gradient(#00bf09, #246b27)';

            var rarity = element.getAttribute('data-rarity');
            var skinName = this.skins_table[rarity];
            var skinId = element.getAttribute('data-skinid');

            this.main(skinName, rarity, skinId);
            console.log('Dostałeś' + skinName + ' skin!');
        };
    }

    async main(skinName: any, rarity: any, skinId: any) {
        this.http.post(environment.apiUrl + '/getAccountInfo.php', {}).subscribe({
            next: (data: any) => {
                var data_send = {
                    player_id: data['Id'],
                    skin_name: skinName,
                    skin_id: skinId,
                    rarity: rarity,
                    amount: 1,
                };

                this.http
                    .post(environment.apiUrl + '/cases.php', { ...data_send })
                    .subscribe({
                        next: (response) => {
                            console.log(response);
                        },
                    });
            },
        });
    }

    random(min: any, max: any) {
        return Math.floor(Math.random() * (max - min) + min);
    }
}
