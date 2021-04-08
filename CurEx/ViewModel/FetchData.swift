//
//  FetchData.swift
//  CurEx
//
//  Created by Cihan on 07.04.21.
//  Copyright © 2021 Boz Apps. All rights reserved.
//

import SwiftUI

class FetchData: ObservableObject {
    @Published var conversionData: [Currency] = []
    @Published var base = "EUR"
    var currencyList: [String] = []

    init() {
        fetch()
    }

    func fetch() {
        let session = URLSession(configuration: .default)

        guard let url = URL(string: "https://api.exchangerate.host/latest?source=ecb&base=\(base)") else {
            return
        }

        session.dataTask(with: url) { (data, _, _) in

            guard let jsonData = data else {
                return
            }

            do {
                let conversion = try JSONDecoder().decode(Conversion.self, from: jsonData)
                DispatchQueue.main.async {
                    self.currencyList.removeAll()
                    self.conversionData = conversion.rates.compactMap({ (key: String, value: Double) -> Currency? in
                        self.currencyList.append(key)
                        return Currency(currencyName: key, currencyValue: value)
                    })
                }
            } catch {
                print(error.localizedDescription)
            }

        }.resume()
    }

    func updateData(base: String) {
        self.base = base
        self.conversionData.removeAll()
        fetch()
    }
}
