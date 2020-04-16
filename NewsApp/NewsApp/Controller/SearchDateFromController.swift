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
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var resetButton: UIButton!

    var dateFromSelected: Date?
    weak var delegate: SearchService?

    override func viewDidLoad() {
        super.viewDidLoad()
        initDateFromController()
    }

    func initDateFromController() {
        self.datePicker.maximumDate = Date()
        initDateLabel()
        self.navigationItem.title = R.string.localizable.startDate()
        if let date = dateFromSelected {
            datePicker.setDate(date, animated: false)
        }
    }

    func initDateLabel() {
        self.dateLabel.text = self.dateFromSelected?.formattedStringforDisplay ?? R.string.localizable.selectADate()
    }

    @IBAction func datePickerChanged() {
        dateFromSelected = datePicker.date
        guard let date = dateFromSelected else {
            return
        }
        initDateLabel()
        delegate?.onDateFromChosen(dateFrom: date)
    }

    @IBAction func onResetButtonClicked() {
        dateFromSelected = nil
        initDateLabel()
        datePicker.setDate(Date(), animated: true)
        delegate?.resetDateFrom()
    }
}
