//
//  UserParser.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 28.11.2020.
//

import Foundation
import FirebaseDatabase
import UIKit

class UserParser {
    static func usersFromSnapshot(snapshot: DataSnapshot) -> [User] {
        let userDict = snapshot.valueInExportFormat() as! NSDictionary
        var users: [User] = []
        for value in userDict.allValues {
            var user = User()
            let thisUser = value as! NSDictionary

            //TODO: Store images in Firebase Storage
            user.photo = UIImage(imageLiteralResourceName: "vaultBoy")
            
            //TODO: Store projects in Firebase RealtimeDatabase
            user.projects = []

            user.email = thisUser["email"] as? String ?? "john@gmail.com"
            user.faculty = Faculty(rawValue: thisUser["faculty"] as? Int ?? 1) ?? .law
            user.fullName = thisUser["fullName"] as? String ?? "John Doe"
            user.scopusId = thisUser["scopusId"] as? Int ?? 1
            user.status = Status(rawValue: thisUser["status"] as? String ?? "student") ?? .student
            
            users.append(user)
        }
        return users
    }
}

