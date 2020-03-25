//
//  Article.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 22/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

//public struct Article: Codable {
//    let author: String?
//    let title: String?
//    let description: String?
//    let url: String?
//    let urlToImage: String?
//    let publishedAt: String?
//    let content: String?
//}

public struct ArticleContainer: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

public struct Article: Codable {
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
    let id: String?
    let name: String?
}

fileprivate extension String {
    var formattedDate: Date? {
        // 2020-03-25T07:39:13Z
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter.date(from: self)
    }
}
