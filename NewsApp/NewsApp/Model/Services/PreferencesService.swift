//
//  PreferencesService.swift
//  NewsApp
//
//  Created by Josselin DUBOC on 30/03/2020.
//  Copyright © 2020 Josselin DUBOC. All rights reserved.
//

import Foundation

protocol PreferencesService {
    func saveCountry(_ country: Country)
    func getCountry() -> Country?
}

class PreferencesServiceImpl: PreferencesService {

    private let userDefaults: UserDefaults?
    init(userDefaults: UserDefaults? = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    func saveCountry(_ country: Country) {
        userDefaults?.set(country.name, forKey: Constantes.UserDefaultsKey.country)
    }

    func getCountry() -> Country? {
        guard let country = userDefaults?.string(forKey: Constantes.UserDefaultsKey.country) else {
            return Country.fr
        }
        return Country(rawValue: country)
    }
}
