import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/administrator/Documents/swift/TagModel.playground/Resources/train_data.json"))

let (train, test) = data.randomSplit(by: 0.8, seed: 5)
let TClassifier = try MLTextClassifier(trainingData: train, textColumn: "ABSTRACT", labelColumn: "TARGET")
let trainingAccuracy = (1.0 - TClassifier.trainingMetrics.classificationError) * 100
let validationAccuracy = (1.0 - TClassifier.validationMetrics.classificationError) * 100
let evaluationMetrics = TClassifier.evaluation(on: test, textColumn: "ABSTRACT", labelColumn: "TARGET")
let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Nikolay Puchko",
                               shortDescription: "Model trained to tag articles",
                               version: "1.0")

try TClassifier.write(to: URL(fileURLWithPath: "/Users/administrator/Documents/swift/TagModel.playground/Sources/TClassifier.mlmodel"), metadata: metadata)
try TClassifier.write(to: URL(fileURLWithPath: "/Users/administrator/Documents/TClassifier.mlmodel"), metadata: metadata)
