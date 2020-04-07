//
//  SortBy.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 01/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

enum SortByType: String, Codable {
    case publishedAt, relevancy, popularity
}

struct SortBy {
    let title: String
    let sortByType: SortByType
}
