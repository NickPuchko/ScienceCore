//
//  UsersViewController.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 27.11.2020.
//

import UIKit

class UsersViewController: UICollectionViewController {
    
    var model: UsersModel!
    private let reuseId = "UserCell"
    
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
        
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        Faculty.allCases.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let faculty = Faculty(rawValue: section) {
            return model.countAtFaculty(faculty: faculty)
        } else {
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
