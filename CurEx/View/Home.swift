//
//  Home.swift
//  CurEx
//
//  Created by Cihan on 04.04.21.
//  Copyright © 2021 Boz Apps. All rights reserved.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = FetchData()
    var body: some View {
        VStack {
            if viewModel.conversionData.isEmpty {
                ProgressView()
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 15, content: {
                        ForEach(viewModel.conversionData){ rate in
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15, content: {
                                Text(getFlag(currency: rate.currencyName))
                                    .font(.system(size: 65))
                                VStack(alignment: .leading, spacing: 5, content: {
                                    Text(rate.currencyName)
                                        .font(.title)
                                        .fontWeight(.bold)

                                    Text("\(rate.currencyValue)")
                                        .fontWeight(.heavy)
                                })
                            }).padding(.horizontal)
                        }
                    }).padding(.top)
                }
            }
        }
        .toolbar(content: {
            Menu(content: {
                ForEach(viewModel.currencyList,id: \.self) { name in

                    Button(action: {viewModel.updateData(base: name)}, label: {
                        Text(name)
                    })
                }
            }) {
                Text("Base = \(viewModel.base)")
                    .fontWeight(.heavy)
            }
        })
    }

    func getFlag(currency: String) -> String {
        let base = 127397
        var code = currency
        code.removeLast()
        var scalar = String.UnicodeScalarView()

        for i in code.utf16 {
            if let unicodeScalar = UnicodeScalar(base + Int(i)) {
                scalar.append(unicodeScalar)
            }
        }
        return String(scalar)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
