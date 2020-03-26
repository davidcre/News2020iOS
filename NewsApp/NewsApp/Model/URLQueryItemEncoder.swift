//
//  URLQueryItemEncoder.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 23/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

enum URLQueryItemEncoder {
    static func encode<T: Encodable>(_ encodable: T) throws -> [URLQueryItem] {
        print(encodable)
        let parametersData = try JSONEncoder().encode(encodable)
        let parameters = try JSONDecoder().decode([String: HTTPParameter].self, from: parametersData)
        print(parameters)
        let parametersFiltered = parameters.filter { $1.description != "" }
        return parametersFiltered.map { URLQueryItem(name: $0, value: $1.description) }
    }
}
