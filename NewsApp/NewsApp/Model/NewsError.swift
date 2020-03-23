//
//  NewsError.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 23/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

public enum NewsError: Error {
    case encoding
    case decoding
    case server(message: String)
}
