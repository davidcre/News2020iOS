//
//  FlagService.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 16/04/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation
import UIKit
import FlagKit

protocol FlagService {
    func imageFor(country: Country) -> UIImage?
}

class FlagServiceImpl: FlagService {

    func imageFor(country: Country) -> UIImage? {
        let flagCountryImage = Flag(countryCode: country.name.uppercased())?.originalImage
        return flagCountryImage
    }
}
