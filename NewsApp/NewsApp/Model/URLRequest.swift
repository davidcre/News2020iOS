//
//  URLRequest.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//
import UIKit

class URLRequest {
    private let APIKey = "2c64fe5d063645f58a5cd563308d0e7c"
    private let webSite = "http://newsapi.org/v2/"
    private var type = "" //everything or top-headlines
    private var country = ""
    private var category = ""
    private var search = ""
    private var sortBy = ""

    init(type: String = "top-headlines", country: String = "fr", category: String = "", search: String = "", sortBy: String = "") {
        self.type = type
        self.country = country
        self.category = category
        self.search = search
        self.sortBy = sortBy
    }

    public var url: URL {
        var adresse = "\(webSite)\(type)?"
        if country != "" {
            adresse += "country=\(country)&"
        }
        if category != "" {
            adresse += "category=\(category)&"
        }
        adresse += "apiKey=\(APIKey)"
        return URL(string: adresse)!
    }
}
