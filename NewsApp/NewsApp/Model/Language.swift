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
    ar, de, en, es, fr, he, it, nl, no, pt, ru, se, ud, zh

    var name: String {
        return self.rawValue
    }
}
