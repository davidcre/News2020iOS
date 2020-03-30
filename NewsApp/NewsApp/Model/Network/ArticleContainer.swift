//
//  ArticleContainer.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 25/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

struct ArticleContainer: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}
