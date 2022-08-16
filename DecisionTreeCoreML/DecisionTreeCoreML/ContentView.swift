//
//  ContentView.swift
//  DecisionTreeCoreML
//
//  Created by Long Zhao on 2022/8/16.
//

import SwiftUI

struct ContentView: View {
    @State private var age: Int = 0
    @State private var height: Int = 0
    @State private var weight: Int = 0
    @State private var salary: Int = 0
    @State private var faceScores: [Int] = [0, 50, 100]
    @State private var selectedFaceScore: Int = 0
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage.init(systemName: "circle")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.red)
                .frame(width: 200, height: 200, alignment: .top)
                .padding()
            
            Form {
                HStack {
                    Text("Age:")
                    TextField("age", value: $age, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                
                HStack {
                    Text("Height:")
                    TextField("Height", value: $height, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                
                HStack {
                    Text("Weight:")
                    TextField("Weight", value: $weight, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("Salary:")
                    TextField("Salary", value: $salary, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("Face score:")
                    Picker("Face score", selection: $selectedFaceScore) {
                        ForEach(faceScores, id:\.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .padding()
            
            Button("Match") {
                print("match")
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
