//
//  ContentView.swift
//  CoreMLTest
//
//  Created by 赵龙 on 2022/8/6.
//

import SwiftUI
import Combine

struct ContentView: View {
    let pred = Predict()
    @State private var result: Int = -1
    
    var body: some View {
        VStack {
            Text("\(result)")
                .padding()
            Button("Predict") {
                result = pred.predict()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
