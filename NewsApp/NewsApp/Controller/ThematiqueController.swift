//
//  ThematiqueController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 18/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import UIKit

class ThematiqueController: UITableViewController {
    private let category = [Category(title: "Général", type: .general),
                            Category(title: "Économie", type: .business),
                            Category(title: "Sports", type: .sports),
                            Category(title: "Santé", type: .health),
                            Category(title: "Science", type: .science),
                            Category(title: "Technologie", type: .technology),
                            Category(title: "Divertissement", type: .entertainment)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constantes.SegueIdentifier.thematiqueToNews {
            guard let newsController = segue.destination as? NewsController else {
                return
            }
            guard let indexPath = sender as? IndexPath else {
                return
            }
            newsController.category = category[indexPath.row]
        }
    }
}

extension ThematiqueController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constantes.CellIdentifier.thematique, for: indexPath) as? ThematiqueCell else {
            return UITableViewCell()
        }
        cell.configure(category: category[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: Constantes.SegueIdentifier.thematiqueToNews, sender: indexPath)
    }
}
