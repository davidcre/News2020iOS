//
//  Country.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 24/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

enum Country: String, Codable, CaseIterable {
    case
    ae, ar, at, au, be, bg, br, ca, ch, cn, co, cu, cz, de, eg, fr, gb, gr, hk, hu, id,
    ie, il, `in`, it, jp, kr, lt, lv, ma, mx, my, ng, nl, no, nz, ph, pl, pt, ro, rs,
    ru, sa, se, sg, si, sk, th, tr, tw, ua, us, ve, za

    var name: String {
        return self.rawValue
    }

    var translation: String {
        switch self {
        case .ae:
            return R.string.localizable.unitedArabEmirates()
        case .ar:
            return R.string.localizable.argentina()
        case .at:
            return R.string.localizable.austria()
        case .au:
            return R.string.localizable.australia()
        case .be:
            return R.string.localizable.belgium()
        case .bg:
            return R.string.localizable.bulgaria()
        case .br:
            return R.string.localizable.brazil()
        case .ca:
            return R.string.localizable.canada()
        case .ch:
            return R.string.localizable.switzerland()
        case .cn:
            return R.string.localizable.china()
        case .co:
            return R.string.localizable.colombia()
        case .cu:
            return R.string.localizable.cuba()
        case .cz:
            return R.string.localizable.czechia()
        case .de:
            return R.string.localizable.germany()
        case .eg:
            return R.string.localizable.egypt()
        case .fr:
            return R.string.localizable.france()
        case .gb:
            return R.string.localizable.greatBritain()
        case .gr:
            return R.string.localizable.greece()
        case .hk:
            return R.string.localizable.hongKong()
        case .hu:
            return R.string.localizable.hungary()
        case .id:
            return R.string.localizable.indonesia()
        case .ie:
            return R.string.localizable.ireland()
        case .il:
            return R.string.localizable.israel()
        case .in:
            return R.string.localizable.india()
        case .it:
            return R.string.localizable.italy()
        case .jp:
            return R.string.localizable.japan()
        case .kr:
            return R.string.localizable.republicOfKorea()
        case .lt:
            return R.string.localizable.lithuania()
        case .lv:
            return R.string.localizable.latvia()
        case .ma:
            return R.string.localizable.morocco()
        case .mx:
            return R.string.localizable.mexico()
        case .my:
            return R.string.localizable.malaysia()
        case .ng:
            return R.string.localizable.nigeria()
        case .nl:
            return R.string.localizable.netherlands()
        case .no:
            return R.string.localizable.norway()
        case .nz:
            return R.string.localizable.newZealand()
        case .ph:
            return R.string.localizable.philippines()
        case .pl:
            return R.string.localizable.poland()
        case .pt:
            return R.string.localizable.portugal()
        case .ro:
            return R.string.localizable.romania()
        case .rs:
            return R.string.localizable.serbia()
        case .ru:
            return R.string.localizable.russia()
        case .sa:
            return R.string.localizable.saudiArabia()
        case .se:
            return R.string.localizable.sweden()
        case .sg:
            return R.string.localizable.singapore()
        case .si:
            return R.string.localizable.slovenia()
        case .sk:
            return R.string.localizable.slovakia()
        case .th:
            return R.string.localizable.thailand()
        case .tr:
            return R.string.localizable.turkey()
        case .tw:
            return R.string.localizable.taiwan()
        case .ua:
            return R.string.localizable.ukraine()
        case .us:
            return R.string.localizable.unitedStates()
        case .ve:
            return R.string.localizable.venezuela()
        case .za:
            return R.string.localizable.southAfrica()
        }
    }
}
