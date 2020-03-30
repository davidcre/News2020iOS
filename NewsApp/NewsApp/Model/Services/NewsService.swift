//
//  NewsService.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 30/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

protocol NewsService {
    var newsArticles: [Article] { get }
    func getTopHeadlines(for category: Category?, completion: @escaping () -> Void)
}

class NewsServiceImpl: NewsService {
    var newsArticles: [Article] = []
    let apiClient = APIClient()
    let country: Country? = PreferencesServiceImpl().getCountry()

    func getTopHeadlines(for category: Category?, completion: @escaping () -> Void) {
        apiClient.send(GetTopHeadlines(category: category?.type, country: country)) { [weak self] result in
            switch result {
            case .success(let response):
                let articles = response.articles ?? []
                self?.newsArticles = articles
                completion()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
