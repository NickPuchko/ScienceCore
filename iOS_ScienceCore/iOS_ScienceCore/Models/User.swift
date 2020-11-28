//
//  User.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 27.11.2020.
//

import Foundation
import UIKit


struct User {
    var email: String
    var fullName: String
    var status: Status
    var photo: UIImage?
    var scopusId: Int?
    var faculty: Faculty
    var projects: [Project]
    var isOpen: Bool

    ///var program: Program?
    
    //MARK: test user
    init(email: String = "napuchko@edu.hse.ru", fullName: String = "Николай Пучко", status: Status = .student, photo: UIImage = UIImage(imageLiteralResourceName: "vaultBoy"), faculty: Faculty = .economics, projects: [Project] = [], isOpen: Bool = false) {
        self.email = email
        self.fullName = fullName
        self.status = status
        self.photo = photo
        self.faculty = faculty
        self.projects = projects
        self.isOpen = isOpen
    }
}

enum Status: String {
    case student, scientist
}

enum Faculty: Int, CaseIterable {
    case management, law, economics, computerScience
}


//enum Program: String {
//    case
//}
