//
//  ProfileModel.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 28.11.2020.
//

import Foundation


class ProfileModel {
    var user = Sample.user
    
    func addProfile() {
        let post =
            ["email" : user.email,
             "fullName" : user.fullName,
             "status" : user.status.rawValue,
             "scopusId" : user.scopusId,
             "faculty" : user.faculty.rawValue,
             "isOpen" : user.isOpen
            ] as [String : Any]
        guard let key = FirebaseRef.ref.child("Users").childByAutoId().key else {
                print("No auto id!")
                return
        }
        let childUpdates = ["/Users/\(key)" : post]
        FirebaseRef.ref.updateChildValues(childUpdates)
    }
}

//
//var id: String
//var email: String
//var fullName: String
//var status: Status
//var photo: UIImage?
//var scopusId: Int?
//var faculty: Faculty
//var projects: [Project]
//var isOpen: Bool
