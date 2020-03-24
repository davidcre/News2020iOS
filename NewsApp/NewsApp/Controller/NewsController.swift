//
//  NewsController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {
    let apiClient = APIClient()
    override func viewDidLoad() {
        super.viewDidLoad()
        apiClient.send(GetTopHeadlines()) { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NewsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apiClient.newsArticles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellIdentifier", for: indexPath) as? NewsCell {
            cell.configure(author: self.apiClient.newsArticles[indexPath.row].author,
                           publishedAt: self.apiClient.newsArticles[indexPath.row].publishedAt,
                           title: self.apiClient.newsArticles[indexPath.row].title,
                           content: self.apiClient.newsArticles[indexPath.row].content,
                           imageArticle: self.apiClient.newsArticles[indexPath.row].urlToImage)
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
