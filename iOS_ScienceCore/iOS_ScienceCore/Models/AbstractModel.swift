//
//  AbstractModel.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 28.11.2020.
//

import Foundation

class AbstractModel {
    var project: Project
    
    init(project: Project) {
        self.project = project
    }
    
    func addProject() {
        let post =
            ["label" : project.label,
             "ref" : project.ref.description,
             "crue" : project.crue,
             "date" : project.date.description,
             "spreading" : project.spreading.rawValue,
             "type" : project.type.rawValue,
             "tags" : project.tags.map { $0.rawValue }
            ] as [String : Any]
        guard let key = FirebaseRef.ref.child("Projects").childByAutoId().key else {
                print("No auto id!")
                return
        }
        let childUpdates = ["/Projects/\(key)" : post]
        FirebaseRef.ref.updateChildValues(childUpdates)
    }
    
    
}

//var label: String
//var date: Date
//var ref: URL
//var tags: [Tag]
//var crue: Int
//var type: ProjectType = .article
//var spreading: Spreading = .regional
//lazy var value: Float = {
//    type.rawValue * spreading.rawValue
//}()
