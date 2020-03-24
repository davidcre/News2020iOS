//
//  ThematiqueCell.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 19/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//
import UIKit

class ThematiqueCell: UITableViewCell {
    @IBOutlet private weak var thematique: UILabel!
    @IBOutlet private weak var imageThematique: UIImageView!

    func configure(text: String) {
        self.thematique.text = text
    }
}
