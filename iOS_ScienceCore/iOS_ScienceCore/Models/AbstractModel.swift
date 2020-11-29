//
//  AbstractModel.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 28.11.2020.
//

import Foundation
import NaturalLanguage
import CoreML



class AbstractModel {
    var project: Project
    let mlModel = try! TClassifier(configuration: MLModelConfiguration()).model

    init(project: Project) {
        self.project = project
    }
    
    
    func analizeTags(abstract: String) {
        let tagPredictor = try! NLModel(mlModel: mlModel)
        project.tags = [tagPredictor.predictedLabel(for: abstract) ?? "Computer Science"]
    }
    
    func addProject() {
        let post =
            ["label" : project.label,
             "ref" : project.ref.description,
             "crue" : project.crue,
             "date" : project.date.description,
             "spreading" : project.spreading.rawValue,
             "type" : project.type.rawValue,
             "tags" : project.tags
            ] as [String : Any]
        guard let key = FirebaseRef.ref.child("Projects").childByAutoId().key else {
                print("No auto id!")
                return
        }
        let childUpdates = ["/Projects/\(key)" : post]
        FirebaseRef.ref.updateChildValues(childUpdates)
    }
}
