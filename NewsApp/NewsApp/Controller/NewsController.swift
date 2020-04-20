//
//  NewsController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {
    @IBOutlet private weak var profileButton: UIButton!
    var newsService: NewsService = NewsServiceImpl()
    var viewTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        initNewsController()
        self.refreshControl?.addTarget(self, action: #selector(reloadDataTableView), for: .valueChanged)
        self.title = viewTitle
        loadData()
    }

    @IBAction func onProfileClicked() {
        performSegue(withIdentifier: R.segue.newsController.segueToProfile, sender: nil)
    }

    @objc func reloadDataTableView() {
        loadData()
        self.refreshControl?.endRefreshing()
    }

    func loadData() {
        self.newsService.fetchArticles { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                if let articles = self?.newsService.newsArticles, articles.isEmpty {
                    Alert.showNoResultsAlert(on: self!)
                }
            }
        }
    }

    func loadMore() {
        self.newsService.loadMore()
        loadData()
    }

    func initNewsController() {
        self.navigationItem.title = R.string.localizable.topHeadlines()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.newsController.segueToDetail.identifier {
            guard let detailController = segue.destination as? DetailController else {
                return
            }
            guard let indexPath = sender as? IndexPath else {
                return
            }
            detailController.article = newsService.newsArticles[indexPath.row]
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
        self.performSegue(withIdentifier: R.segue.newsController.segueToDetail, sender: indexPath)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == newsService.newsArticles.count - 1 {
            loadMore()
           }
    }
}
