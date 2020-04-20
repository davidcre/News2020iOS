//
//  PickerProfileElement.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 16/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class PickerProfileElement: UIView {

    var imageView: UIImageView!
    var label: UILabel!
    var country: Country
    var flagService: FlagService = FlagServiceImpl()

    init(frame: CGRect, for country: Country) {
        self.country = country
        super.init(frame: frame)

        createImageView()
        createLabel()

        label.autoCenterInSuperview()

        imageView.autoConstrainAttribute(.horizontal, to: .horizontal, of: self)
        imageView.autoPinEdge(.trailing, to: .leading, of: label, withOffset: -10)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createImageView() {
        imageView = UIImageView.newAutoLayout()
        imageView.image = flagService.imageFor(country: country)
        addSubview(imageView)
    }

    private func createLabel() {
        label = UILabel.newAutoLayout()
        label.text = country.translation
        addSubview(label)
    }
}
