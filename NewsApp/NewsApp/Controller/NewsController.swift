//
//  NewsController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {
    private let apiClient = APIClient()
    private var newsArticles: [Article] = []
    var category: Category?
    override func viewDidLoad() {
        super.viewDidLoad()
        apiClient.send(GetTopHeadlines(category: category)) { [weak self] result in
            switch result {
            case .success(let response):
                let articles = response.articles ?? []
                self?.newsArticles = articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}

extension NewsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArticles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constantes.CellIdentifier.news, for: indexPath) as? NewsCell {
            let article = self.newsArticles[indexPath.row]
            let viewModel = NewsCell.ViewModel(article: article)
            cell.viewModel = viewModel
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
