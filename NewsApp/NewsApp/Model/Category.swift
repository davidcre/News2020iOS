//
//  Category.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 24/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

enum CategoryType: String, Codable, CaseIterable {
    case business, sports, health, science, entertainment, technology, general
}

struct Category {
    let title: String
    let type: CategoryType
}
