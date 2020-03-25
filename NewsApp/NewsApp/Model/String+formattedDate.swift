//
//  Extension_String_+formattedDate.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 25/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

extension String {
    var formattedDate: Date? {
        // 2020-03-25T07:39:13Z
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter.date(from: self)
    }
}
