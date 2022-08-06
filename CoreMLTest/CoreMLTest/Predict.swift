//
//  Predict.swift
//  CoreMLTest
//
//  Created by 赵龙 on 2022/8/6.
//

import Foundation
import CoreML

class Predict: ObservableObject {
    let model = try! IrisClassifier(configuration: MLModelConfiguration())
    
    func predict() -> Int {
        let output = try! model.prediction(sepal_length: 5.6, sepal_width: 3.0)
        print(output.labelProbability)
        return Int(output.label)
    }
}
