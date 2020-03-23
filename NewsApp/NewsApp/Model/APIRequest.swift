//
//  APIRequest.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 22/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

public protocol APIRequest: Encodable {
    /// Response (will be wrapped with a DataContainer)
    associatedtype Response: Decodable

    /// Endpoint for this request (the last part of the URL)
    var resourceName: String { get }
}
