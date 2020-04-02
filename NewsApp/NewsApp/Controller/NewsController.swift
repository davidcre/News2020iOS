//
//  NewsController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {
    var newsService: NewsService = NewsServiceImpl()
    var viewTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: #selector(reloadDataTableView), for: .valueChanged)
        self.title = viewTitle
        loadData()
    }

    @objc func reloadDataTableView() {
        loadData()
        self.refreshControl?.endRefreshing()
    }

    func loadData() {
        self.newsService.getArticles { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension NewsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsService.newsArticles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.newsCellIdentifier, for: indexPath) else {
            return UITableViewCell()
        }
        let article = newsService.newsArticles[indexPath.row]
        let viewModel = NewsCell.ViewModel(article: article)
        cell.viewModel = viewModel
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
