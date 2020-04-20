//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Josselin DUBOC on 17/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {
    private var newsService: NewsService!
    private var pageSize: Int!
    private var parametersRequest: ParametersRequest!
    private var preferencesService: PreferencesService!

    override func setUp() {
        preferencesService = PreferencesServiceImpl()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPreferencesService() {
        let country = Country.fr
        preferencesService.saveCountry(country)

        XCTAssert(country == preferencesService.getCountry())
    }
    func testFetchArticles() {
        pageSize = 20
        parametersRequest = ParametersRequest(category: .init(title: "General", image: Constantes.SystemImage.docRichText, type: .general), pageSize: pageSize, requestType: .topHeadlines)
        newsService = NewsServiceImpl(parametersRequest: parametersRequest)

        let expectation = self.expectation(description: "Fetching")

        newsService.fetchArticles {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(newsService.newsArticles.count == pageSize)
    }

}
