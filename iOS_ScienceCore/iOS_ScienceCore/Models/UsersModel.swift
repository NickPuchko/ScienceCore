//
//  Users.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 27.11.2020.
//

import Foundation


class UsersModel {
    var users: [User]
    weak var viewController: UsersViewController!
    
    init(vc: UsersViewController) {
        viewController = vc
        users = []
        
        FirebaseRef.ref.child("Users").observeSingleEvent(of: .value, with: { [self] snapshot in
            print(users.count)
            users = UserParser.usersFromSnapshot(snapshot: snapshot)
            print(users.count)
            viewController.fetchData(users: users)
            //self?.viewController?.loadViewIfNeeded()
            //self?.viewController.collectionView.reloadData()
        })
        
    }
}

extension UsersModel {
    func countAtFaculty(faculty: Faculty) -> Int {
        return (users.filter { $0.faculty == faculty }).count
    }
}
