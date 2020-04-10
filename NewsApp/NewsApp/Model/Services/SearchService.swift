//
//  SearchService.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 09/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

protocol SearchService: AnyObject {
    func onDateFromChosen(dateFrom: Date)
    func onDateToChosen(dateTo: Date)
    func onLanguageChosen(language: Language)
}
