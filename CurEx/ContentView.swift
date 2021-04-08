//
//  ContentView.swift
//  CurEx
//
//  Created by Cihan on 04.04.21.
//  Copyright © 2021 Boz Apps. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("CurEx")
                .preferredColorScheme(.dark)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
