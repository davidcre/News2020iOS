//
//  GetArticles.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 22/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

public struct GetTopHeadlines: APIRequest {
    public typealias Response = ArticleContainer

    public var resourceName: String {
        return "top-headlines"
    }

    private let country: Country?
    private let category: Category?
    private let query: String?
    private let apiKey = "2c64fe5d063645f58a5cd563308d0e7c"

    init(
        country: Country? = Country.fr,
        category: Category? = Category.general,
        query: String? = "") {
        self.country = country
        self.category = category
        self.query = query
    }
}
