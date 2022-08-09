//
//  Iris.swift
//  CoreMLTest
//
//  Created by 赵龙 on 2022/8/6.
//

import Foundation
import CoreML

enum IrisType: String {
    case setosa = "setosa"
    case versicolor = "versicolor"
}

class Iris: ObservableObject {
    @Published var typeName: String = ""
    
    func predict(sepal_length: Double, sepal_width: Double) {
        let model = try! IrisClassifier(configuration: MLModelConfiguration())
        let output = try! model.prediction(sepal_length: sepal_length, sepal_width: sepal_width)
        print(output.labelProbability)
        if output.label == 0 {
            typeName = IrisType.setosa.rawValue
        } else {
            typeName = IrisType.versicolor.rawValue
        }
    }
}
