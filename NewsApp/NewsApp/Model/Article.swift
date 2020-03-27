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
    private let webURLString: String?
    var webURL: URL? {
        if let urlString = webURLString {
             return URL(string: urlString)
        }
        return nil
    }
    private let imageURLString: String?
    var imageURL: URL? {
        if let urlString = imageURLString {
             return URL(string: urlString)
        }
        return nil
    }
    private let publishedAt: String?
    var publishedAtDate: Date? {
        return publishedAt?.formattedDate
    }
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription
        case webURLString = "url", imageURLString = "urlToImage", publishedAt, content
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
