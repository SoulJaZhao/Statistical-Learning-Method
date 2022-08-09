//
//  ContentView.swift
//  CoreMLTest
//
//  Created by 赵龙 on 2022/8/6.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var iris = Iris()
    @State private var sepal_length: Double = 0.0
    @State private var sepal_width: Double = 0.0
    
    var body: some View {
        VStack {
            HStack {
                Text("Sepal Length:")
                Spacer()
                TextField("Sepal Length", value: $sepal_length, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Text("Sepal Width:")
                Spacer()
                TextField("Sepal Width", value: $sepal_width, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            
            Text("\(iris.typeName)")
                .padding()
            
            Button("Predict") {
                iris.predict(sepal_length: sepal_length, sepal_width: sepal_width)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
