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
    private let category: Category?
    private let query: String?
    private let apiKey = "2c64fe5d063645f58a5cd563308d0e7c"

    init(
        category: Category? = .general,
        query: String? = "") {
        self.category = category
        self.query = query
        if let country = UserDefaults().string(forKey: Constantes.UserDefaultsKey.country) {
            self.country = Country(rawValue: country)
        } else {
            self.country = .fr
        }
    }
}
