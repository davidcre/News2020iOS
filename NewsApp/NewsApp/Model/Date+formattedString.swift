//
//  Date+formattedString.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 09/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

extension Date {
    var formattedStringforDisplay: String? {
        // 2020-04-07 14:56:58 +0000
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        //dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        return dateFormatter.string(from: self)
    }
    var formattedStringForRequest: String? {
        let dateFormatter = DateFormatter()
        // 2020-03-25T07:39:13Z
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter.string(from: self)
    }
}
