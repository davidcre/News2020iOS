//
//  GetArticles.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 22/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

public struct GetTopHeadlines: APIRequest {
    public typealias Response = [Article]

    public var resourceName: String {
        return "top-headlines"
    }

    // Parameters
    public let country: String?
    public let category: String?
    public let query: String?
    public let apiKey = "2c64fe5d063645f58a5cd563308d0e7c"

    public init(country: String? = "fr",
                category: String? = "",
                query: String? = "") {
        self.country = country
        self.category = category
        self.query = query
    }
}
