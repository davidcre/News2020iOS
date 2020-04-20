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
    func fetchArticles(completion: @escaping () -> Void)
    func loadMore()
}

class NewsServiceImpl: NewsService {
    var newsArticles: [Article] = []
    var parametersRequest: ParametersRequest

    private let apiClient = APIClient()
    private let  maxPageSize = 100
    private var totalResults: Int = 0
    private var allowToLoadMore = true

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
    var dateFrom: String? {
        return parametersRequest.from?.formattedStringForRequest
    }
    var dateTo: String? {
        return parametersRequest.to?.formattedStringForRequest
    }
    var query: String? {
        return parametersRequest.query
    }
    var sortBy: SortByType? {
        return parametersRequest.sortBy?.sortByType
    }
    var pageSize: Int? {
        return parametersRequest.pageSize
    }

    func loadMore() {
        if allowToLoadMore {
            guard min(maxPageSize, totalResults) != parametersRequest.pageSize else {
                allowToLoadMore = false
                return
            }
            let actualPageSize = parametersRequest.pageSize
            self.parametersRequest.pageSize = min(maxPageSize, min(actualPageSize + 20, totalResults ))
        }
    }

    func fetchArticles(completion: @escaping () -> Void) {
        guard allowToLoadMore else {
            return
        }
        allowToLoadMore = false
        switch requestType {
        case .topHeadlines:
            fetchTopHeadlines {
                completion()
                self.allowToLoadMore = true
            }
        case .everything:
            fetchEverything {
                completion()
                self.allowToLoadMore = true
            }
        }
    }

    func fetchTopHeadlines(completion: @escaping () -> Void) {
        apiClient.send(GetTopHeadlines(category: category?.type, country: country, pageSize: pageSize)) { [weak self] result in
            switch result {
            case .success(let response):
                let articles = response.articles ?? []
                let totalResults = response.totalResults ?? 0
                self?.newsArticles = articles
                self?.totalResults = totalResults
                completion()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }

    func fetchEverything(completion: @escaping () -> Void) {
        apiClient.send(GetEverything(language: language, from: dateFrom, to: dateTo, query: query, pageSize: pageSize, sortBy: sortBy)) { [weak self] result in
            switch result {
            case .success(let response):
                let articles = response.articles ?? []
                let totalResults = response.totalResults ?? 0
                self?.newsArticles = articles
                self?.totalResults = totalResults
                completion()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
