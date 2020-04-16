//
//  GetArticles.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 22/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

struct GetTopHeadlines: APIRequest {
    typealias Response = ArticleContainer

    var resourceName: String {
        return "top-headlines"
    }

    private let country: Country?
    private let category: CategoryType?
    private let pageSize: Int?
    private let apiKey = "2c64fe5d063645f58a5cd563308d0e7c"

    init(
        category: CategoryType? = .general,
        country: Country?,
        pageSize: Int?) {
        self.category = category
        self.country = country
        self.pageSize = pageSize
    }
}
