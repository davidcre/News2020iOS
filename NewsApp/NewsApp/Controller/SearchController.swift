//
//  SearchController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 01/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit

class SearchController: UITableViewController {
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var sortByLabel: UILabel!
    @IBOutlet private weak var sortBySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var dateFromLabelWithTitle: UILabel!
    @IBOutlet private weak var dateFromLabelWithDate: UILabel!
    @IBOutlet private weak var dateToLabelWithTitle: UILabel!
    @IBOutlet private weak var dateToLabelWithDate: UILabel!
    @IBOutlet private weak var languageLabelWithTitle: UILabel!
    @IBOutlet private weak var languageLabelWithLanguage: UILabel!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var moreFiltersButton: UIButton!
    @IBOutlet private weak var moreFiltersImage: UIImageView!

    private var showMoreFilters: Bool = false
    private let sortBy = [SortBy(title: R.string.localizable.publicationDate(), sortByType: .publishedAt),
                          SortBy(title: R.string.localizable.popularity(), sortByType: .popularity),
                          SortBy(title: R.string.localizable.relevancy(), sortByType: .relevancy)]

    override func viewDidLoad() {
        super.viewDidLoad()
        showOrNotMoreFilters(show: false)
        initSearchController()
    }

    @IBAction func onMoreFiltersButtonClicked() {
        showOrNotMoreFilters(show: !showMoreFilters)
        switch showMoreFilters {
        case true:
            moreFiltersButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        case false:
            moreFiltersButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
    }

    func initSearchController() {
        self.navigationItem.title = R.string.localizable.search()
        self.searchBar.placeholder = R.string.localizable.searchForAnArticle()
        self.sortByLabel.text = R.string.localizable.sortBy()
        self.languageLabelWithTitle.text = R.string.localizable.language()
        self.dateFromLabelWithTitle.text = R.string.localizable.startDate()
        self.dateToLabelWithTitle.text = R.string.localizable.endDate()
        self.searchButton.setTitle(R.string.localizable.searchVerb(), for: .normal)
        self.moreFiltersButton.setTitle(R.string.localizable.moreFilters(), for: .normal)
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

extension SearchController {
    func initSegmentedControl() {
        for sortByIndice in 0..<self.sortBy.count {
            self.sortBySegmentedControl.setTitle(self.sortBy[sortByIndice].title, forSegmentAt: sortByIndice)
        }
    }
}

//TODO: Un seul mot doit être tapé
extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text != "" else {
            return
        }
        let parametersRequest: ParametersRequest = ParametersRequest(query: searchBar.text, sortBy: sortBy[sortBySegmentedControl.selectedSegmentIndex], requestType: .everything)
        performSegue(withIdentifier: R.segue.searchController.segueToNews, sender: parametersRequest)
    }
}

extension SearchController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat
        if !self.showMoreFilters && (indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5) {
            height = 0.0
        } else {
            height = 45.0
        }
        return height
    }

    func showOrNotMoreFilters(show: Bool) {
        self.showMoreFilters = show
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
