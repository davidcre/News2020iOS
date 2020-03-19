//
//  ThematiqueController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class ThematiqueController: UITableViewController {

    private var thematique: [String] = ["Économie", "Divertissement", "Santé", "Sports", "Sciences", "Technologie"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToNews" {
            guard let newsController = segue.destination as? NewsController else {
                return
            }
            guard let indexPath = sender as? IndexPath else {
                return
            }
            newsController.title = thematique[indexPath.row]
        }
    }
}

extension ThematiqueController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thematique.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ThematiqueCellIdentifier", for: indexPath) as? ThematiqueCell {
            cell.configure(text: self.thematique[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueToNews", sender: indexPath)
    }
}
