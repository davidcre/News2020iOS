//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 22/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

//public struct NewsResponse<Response: Decodable>: Codable {
//    /// Whether it was ok error
//    public let status: String?
//    /// Message that usually gives more information about some error
//    public let code: String?
//    public let error: String?
//
//    public let totalResults: Int?
//    /// Requested data
//    public let articles: [Article]?
//}

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
