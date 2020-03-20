//
//  News.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 19/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class News {
    private var newsItems: [NewsItem] = []

    func add(news: NewsItem) {
        newsItems.append(news)
    }

    func count() -> Int {
        return newsItems.count
    }

    func get(row: Int) -> NewsItem {
        guard row < newsItems.count else {
            fatalError()
        }
        return newsItems[row]
    }
}
