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
    var parametersRequest: ParametersRequest { get }
    func getArticles(completion: @escaping () -> Void)
}

class NewsServiceImpl: NewsService {
    var newsArticles: [Article] = []
    let parametersRequest: ParametersRequest
    let apiClient = APIClient()

    ///Initializers
    init(parametersRequest: ParametersRequest) {
        self.parametersRequest = parametersRequest
    }
    init() {
        self.parametersRequest = ParametersRequest(requestType: .topHeadlines)
    }
    ///General
    var requestType: RequestType {
        return parametersRequest.requestType
    }
    ///Top-Headlines
    var country: Country? {
        return parametersRequest.country
    }
    var category: Category? {
        return parametersRequest.category
    }
    ///Everything
    var language: Language? {
        return parametersRequest.language
    }
    var dateFrom: Date? {
        return parametersRequest.from
    }
    var dateTo: Date? {
        return parametersRequest.to
    }
    var query: String? {
        return parametersRequest.query
    }
    var sortBy: SortBy? {
        return parametersRequest.sortBy
    }

    func getArticles(completion: @escaping () -> Void) {
        switch requestType {
        case .topHeadlines:
            getTopHeadlines {
                completion()
            }
        case .everything:
            getEverything {
                completion()
            }
        }
    }

    func getTopHeadlines(completion: @escaping () -> Void) {
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

    func getEverything(completion: @escaping () -> Void) {
        apiClient.send(GetEverything(language: language, from: dateFrom, to: dateTo, query: query, sortBy: sortBy)) { [weak self] result in
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
