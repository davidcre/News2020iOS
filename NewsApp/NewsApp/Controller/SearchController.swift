//
//  SearchController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 01/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit

class SearchController: UIViewController {
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var dateButton: UIButton!
    @IBOutlet private weak var sortByLabel: UILabel!
    @IBOutlet private weak var sortBySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var dateFromLabel: UILabel!
    @IBOutlet private weak var dateFromPicker: UIDatePicker!
    @IBOutlet private weak var dateToLabel: UILabel!
    @IBOutlet private weak var dateToPicker: UIDatePicker!

    private let sortBy = [SortBy(title: R.string.localizable.publicationDate(), sortByType: .publishedAt),
                          SortBy(title: R.string.localizable.popularity(), sortByType: .popularity),
                          SortBy(title: R.string.localizable.relevancy(), sortByType: .relevancy)]

    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchController()
    }

    @IBAction func onDateButtonClicked() {
        //searchBar.frame.origin.y += 150
        dateFromLabel.isHidden = !dateFromLabel.isHidden
        dateFromPicker.isHidden = !dateFromPicker.isHidden
        dateToLabel.isHidden = !dateToLabel.isHidden
        dateToPicker.isHidden = !dateToPicker.isHidden
    }

    func initSearchController() {
        self.navigationItem.title = R.string.localizable.search()
        self.searchBar.placeholder = R.string.localizable.searchForAnArticle()
        self.dateButton.setTitle(R.string.localizable.searchByDate(), for: .normal)
        self.dateFromLabel.text = R.string.localizable.startDate()
        self.dateToLabel.text = R.string.localizable.endDate()
        self.sortByLabel.text = R.string.localizable.sortBy()
        initSegmentedControl()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.searchController.segueToNews.identifier {
            guard let newsController = segue.destination as? NewsController else {
                return
            }
            guard let parametersRequest = sender as? ParametersRequest else {
                return
            }
            newsController.viewTitle = parametersRequest.query
            newsController.newsService = NewsServiceImpl(parametersRequest: parametersRequest)
            searchBar.resignFirstResponder()
        }
    }
}
//TODO: Un seul mot doit être tapé
extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text != "" else {
            return
        }
        let parametersRequest: ParametersRequest = ParametersRequest(query: searchBar.text, requestType: .everything)
        performSegue(withIdentifier: R.segue.searchController.segueToNews, sender: parametersRequest)
    }
}

extension SearchController {
    func initSegmentedControl() {
        for sortByIndice in 0..<self.sortBy.count {
            self.sortBySegmentedControl.setTitle(self.sortBy[sortByIndice].title, forSegmentAt: sortByIndice)
        }
    }
}
