//
//  SearchDateController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 09/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit

class SearchDateFromController: UIViewController {
    @IBOutlet private weak var datePicker: UIDatePicker!

    weak var delegate: SearchService?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.maximumDate = Date()
    }

    @IBAction func datePickerChanged() {
        delegate?.onDateFromChosen(dateFrom: datePicker.date)
    }
}
