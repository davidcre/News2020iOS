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

    override func viewDidLoad() {
        super.viewDidLoad()
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
