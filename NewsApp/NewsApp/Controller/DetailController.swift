//
//  DetailController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 14/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit

class DetailController: UITableViewController {
    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onURLButtonClicked() {
        guard let url = article?.webURL else {
            return
        }
        UIApplication.shared.open(url)
    }
}

extension DetailController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.newsDetailCellIdentifier, for: indexPath) else {
            return UITableViewCell()
        }
        guard let article = self.article else {
            return UITableViewCell()
        }
        let viewModel = NewsDetailCell.ViewModel(article: article)
        cell.viewModel = viewModel
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
