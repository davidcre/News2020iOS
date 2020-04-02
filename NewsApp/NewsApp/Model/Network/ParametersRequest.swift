//
//  ParametersRequest.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 02/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
//swiftlint:disable identifier_name
struct ParametersRequest {
    ///Top-headlines
    var country: Country? {
        return PreferencesServiceImpl().getCountry()
    }
    let category: Category?

    ///Everything
    let language: Language?
    let from: Date?
    let to: Date?
    let query: String?
    let sortBy: SortBy?

    ///General
    let requestType: RequestType

    init(category: Category? = nil,
         language: Language? = nil,
         from: Date? = nil,
         to: Date? = nil,
         query: String? = nil,
         sortBy: SortBy? = nil,
         requestType: RequestType) {
        self.category = category
        self.language = language
        self.from = from
        self.to = to
        self.query = query
        self.sortBy = sortBy
        self.requestType = requestType
    }
}
