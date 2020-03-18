//
//  NewsItem.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

class NewsItem {

    var author: String!
    var title: String!
    var descriptionTitle: String!
    var publishedAt: String!
    var urlToImage: String!
    var url: String!
    var content: String!

    init() {

    }

    init(author: String? = "", title: String? = "", descriptionTitle: String? = "", publishedAt: String? = "", urlToImage: String? = "", url: String? = "", content: String? = "") {
        self.author = author
        self.title = title
        self.descriptionTitle = descriptionTitle
        self.publishedAt = publishedAt
        self.urlToImage = urlToImage
        self.url = urlToImage
        self.content = content
    }

    func description() -> String {
        return ("Author: \(author ?? ""), title: \(title ?? ""), descriptionTitle: \(descriptionTitle ?? ""), ") +
        "publishedAt: \(publishedAt ?? ""), urlToImage: \(urlToImage ?? ""), url: \(url ?? ""), content: \(content ?? "") ."
    }

}
