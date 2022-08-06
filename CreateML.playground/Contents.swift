import Cocoa
import CreateML
import Foundation

let csvFile = Bundle.main.url(forResource: "iris", withExtension: "csv")!
var dataTable = try MLDataTable.init(contentsOf: csvFile)
dataTable.removeColumn(named: "id")

let classifierColumns = ["sepal length", "sepal width", "label"]
let classifierTable = dataTable[classifierColumns]

let (classifierEvaluationTable, classifierTrainingTable) = classifierTable.randomSplit(by: 0.20, seed: 42)

print(classifierTrainingTable)

let classifier = try MLClassifier(trainingData: classifierTrainingTable,
                                  targetColumn: "label")
/// Classifier training accuracy as a percentage
let trainingError = classifier.trainingMetrics.classificationError
let trainingAccuracy = (1.0 - trainingError) * 100

/// Classifier validation accuracy as a percentage
let validationError = classifier.validationMetrics.classificationError
let validationAccuracy = (1.0 - validationError) * 100

/// Evaluate the classifier
let classifierEvaluation = classifier.evaluation(on: classifierEvaluationTable)

/// Classifier evaluation accuracy as a percentage
let evaluationError = classifierEvaluation.classificationError
let evaluationAccuracy = (1.0 - evaluationError) * 100

let classifierMetadata = MLModelMetadata(author: "SoulJa Zhao",
                                         shortDescription: "Predicts the label of iris",
                                         version: "1.0")

/// Save the trained classifier model
let homePath = FileManager.default.homeDirectoryForCurrentUser
let savePath = homePath.appendingPathComponent("Desktop")

do {
    try classifier.write(to: savePath.appendingPathComponent("IrisClassifier.mlmodel"), metadata: classifierMetadata)
} catch {
    print(error)
}

