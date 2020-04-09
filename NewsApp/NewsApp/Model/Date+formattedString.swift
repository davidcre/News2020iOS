//
//  Date+formattedString.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 09/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

extension Date {
    var formattedString: String? {
        // 2020-04-07 14:56:58 +0000
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        return dateFormatter.string(from: self)
    }
}
