//
//  GetEverything.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 01/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

//swiftlint:disable identifier_name
struct GetEverything: APIRequest {
    typealias Response = ArticleContainer

    var resourceName: String {
        return "everything"
    }

    private let language: Language?
    private let from: Date?
    private let to: Date?
    private let q: String?
    private let sortBy: SortBy?
    private let apiKey = "2c64fe5d063645f58a5cd563308d0e7c"

    init(
        language: Language? = .fr,
        from: Date?,
        to: Date?,
        query: String?,
        sortBy: SortBy?) {
        self.language = language
        self.from = from
        self.to = to
        self.q = query
        self.sortBy = sortBy
    }
}
