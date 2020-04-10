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

    var parametersRequest: ParametersRequest = ParametersRequest(requestType: .everything)
    private var showMoreFilters: Bool = false
    private let sortBy = [SortBy(title: R.string.localizable.publicationDate(), sortByType: .publishedAt),
                          SortBy(title: R.string.localizable.popularity(), sortByType: .popularity),
                          SortBy(title: R.string.localizable.relevancy(), sortByType: .relevancy)]

    override func viewDidLoad() {
        super.viewDidLoad()
        showOrNotMoreFilters(show: false)
        initSearchController()
    }

    override func viewWillAppear(_ animated: Bool) {
        initFilters()
    }

    @IBAction func onSearchButtonClicked() {
        search()
    }

    @IBAction func onMoreFiltersButtonClicked() {
        showOrNotMoreFilters(show: !showMoreFilters)
        switch showMoreFilters {
        case true:
            moreFiltersButton.setImage(UIImage(systemName: Constantes.SystemImage.chevronUp), for: .normal)
        case false:
            moreFiltersButton.setImage(UIImage(systemName: Constantes.SystemImage.chevronDown), for: .normal)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let parametersRequest = sender as? ParametersRequest else {
            return
        }

        if segue.identifier == R.segue.searchController.segueToNews.identifier {
            guard let newsController = segue.destination as? NewsController else {
                return
            }
            newsController.viewTitle = parametersRequest.query
            newsController.newsService = NewsServiceImpl(parametersRequest: parametersRequest)
        } else if segue.identifier == R.segue.searchController.segueToSearchDateFrom.identifier {
            guard let searchDateFromController = segue.destination as? SearchDateFromController else {
                return
            }
            searchDateFromController.delegate = self
        } else if segue.identifier == R.segue.searchController.segueToSearchDateTo.identifier {
            guard let searchDateToController = segue.destination as? SearchDateToController else {
                return
            }
            searchDateToController.delegate = self
        } else if segue.identifier == R.segue.searchController.segueToSearchLanguage.identifier {
            guard let searchLanguageController = segue.destination as? SearchLanguageController else {
                return
            }
            searchLanguageController.delegate = self
        }
        searchBar.resignFirstResponder()
    }
}

///Initialisation du controleur
extension SearchController {
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
        initFilters()
    }

    func initSegmentedControl() {
        for sortByIndice in 0..<self.sortBy.count {
            self.sortBySegmentedControl.setTitle(self.sortBy[sortByIndice].title, forSegmentAt: sortByIndice)
        }
    }

    func initFilters() {
        if let dateFrom = self.parametersRequest.from {
            self.dateFromLabelWithDate.text = dateFrom.formattedStringforDisplay
        } else {
            self.dateFromLabelWithDate.text = R.string.localizable.selectADate()
        }
        if let dateTo = self.parametersRequest.to {
            self.dateToLabelWithDate.text = dateTo.formattedStringforDisplay
        } else {
            self.dateToLabelWithDate.text = R.string.localizable.selectADate()
        }
        if let language = self.parametersRequest.language {
            self.languageLabelWithLanguage.text = language.name
        } else {
            self.languageLabelWithLanguage.text = R.string.localizable.selectALanguage()
        }
    }

    func showOrNotMoreFilters(show: Bool) {
        self.showMoreFilters = show
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

///Recherche
extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search()
    }

    func search() {
        guard searchBar.text != "" else {
            return
        }
        parametersRequest.query = searchBar.text
        parametersRequest.sortBy = sortBy[sortBySegmentedControl.selectedSegmentIndex]
        performSegue(withIdentifier: R.segue.searchController.segueToNews, sender: self.parametersRequest)
    }
}

///Gestion de ta tableView
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 3:
            performSegue(withIdentifier: R.segue.searchController.segueToSearchLanguage, sender: self.parametersRequest)
        case 4:
            performSegue(withIdentifier: R.segue.searchController.segueToSearchDateFrom, sender: self.parametersRequest)
        case 5:
            performSegue(withIdentifier: R.segue.searchController.segueToSearchDateTo, sender: self.parametersRequest)
        default:
            return
        }
    }
}

///Implémentation du delegate pour les filtres optionnels
extension SearchController: SearchService {
    func onDateFromChosen(dateFrom: Date) {
        self.parametersRequest.from = dateFrom
    }

    func onDateToChosen(dateTo: Date) {
        self.parametersRequest.to = dateTo
    }

    func onLanguageChosen(language: Language) {
        self.parametersRequest.language = language
    }
}
