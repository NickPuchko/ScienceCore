//
//  UsersViewController.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 27.11.2020.
//

import UIKit

class UsersViewController: UIViewController {
    
    var model: UsersModel!
    
    //private let reuseId = "UserCell"
    
    func fetchData(users: [User]) {
        self.model.users = users
    }
    
    override func loadView() {
        model = UsersModel(vc: self)
        print(model.users.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load \(model.users.count)")
        
    }
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        Faculty.allCases.count
//    }
    
    
    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if let faculty = Faculty(rawValue: section) {
//            return model.countAtFaculty(faculty: faculty)
//        } else {
//            return 0
//        }
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
//        cell.backgroundColor = .blue
//        return cell
//    }
    

}
