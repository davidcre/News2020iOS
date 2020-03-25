//
//  Article.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 22/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: URL?
    let urlToImage: URL?
    private let publishedAt: String?
    var publishedAtDate: Date? {
        return publishedAt?.formattedDate
    }
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription
        case url, urlToImage, publishedAt, content
    }
}

struct Source: Codable {
    let identifiant: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case identifiant = "id"
        case name
    }
}
