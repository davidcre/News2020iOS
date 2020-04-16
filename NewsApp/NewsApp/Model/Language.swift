//
//  Language.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 01/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
//swiftlint:disable identifier_name
enum Language: String, Codable, CaseIterable {
    case
    ar, de, en, es, fr, he, it, nl, no, pt, ru, se, zh

    var name: String {
        return self.rawValue
    }

    var translation: String {
        switch self {
        case .ar:
            return R.string.localizable.arabic()
        case .de:
            return R.string.localizable.german()
        case .en:
            return R.string.localizable.english()
        case .es:
            return R.string.localizable.spanish()
        case .fr:
            return R.string.localizable.french()
        case .he:
            return R.string.localizable.hebrew()
        case .it:
            return R.string.localizable.italian()
        case .nl:
            return R.string.localizable.dutch()
        case .no:
            return R.string.localizable.norwegian()
        case .pt:
            return R.string.localizable.portuguese()
        case .ru:
            return R.string.localizable.russian()
        case .se:
            return R.string.localizable.northernSami()
        case .zh:
            return R.string.localizable.chinese()
        }
    }
}
