//
//  SearchDateToController.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 09/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit

class SearchDateToController: UIViewController {
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var resetButton: UIButton!

    var dateToSelected: Date?
    weak var delegate: SearchService?

    override func viewDidLoad() {
        super.viewDidLoad()
        initDateToController()
    }

    func initDateToController() {
        self.datePicker.maximumDate = Date()
        initDateLabel()
        self.navigationItem.title = R.string.localizable.startDate()
        if let date = dateToSelected {
            datePicker.setDate(date, animated: false)
        }
    }

    func initDateLabel() {
        self.dateLabel.text = self.dateToSelected?.formattedStringforDisplay ?? R.string.localizable.selectADate()
    }

    @IBAction func datePickerChanged() {
        dateToSelected = datePicker.date
        guard let date = dateToSelected else {
            return
        }
        initDateLabel()
        delegate?.onDateToChosen(dateTo: date)
    }

    @IBAction func onResetButtonClicked() {
        dateToSelected = nil
        initDateLabel()
        datePicker.setDate(Date(), animated: true)
        delegate?.resetDateTo()
    }
}
