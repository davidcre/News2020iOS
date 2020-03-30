//
//  NewsService.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 30/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

protocol NewsService {
    var newsArticles: [Article] { get set }
    func getTopHeadlines(category: Category?)
}

class NewsServiceImpl: NewsService {
    var newsArticles: [Article] = []
    let apiClient = APIClient()

    func getTopHeadlines(category: Category?) {
        apiClient.send(GetTopHeadlines(category: category?.type)) { [weak self] result in
            switch result {
            case .success(let response):
                let articles = response.articles ?? []
                self?.newsArticles = articles
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
