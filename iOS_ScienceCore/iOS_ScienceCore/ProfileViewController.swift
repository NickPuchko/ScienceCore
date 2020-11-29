//
//  ProfileViewController.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 27.11.2020.
//

import UIKit
import SafariServices

class ProfileViewController: UIViewController {
    let model = ProfileModel()

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userStatus: UILabel!
    @IBOutlet weak var userFaculty: UILabel!
    @IBOutlet weak var isOpen: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var projectsCount: UILabel!
    
    @IBAction func showScopus(_ sender: Any) {
        let webvc = SFSafariViewController(url: Sample.scopusUrl) 
        self.present(webvc, animated: true)
    }
    @IBAction func showRSUE(_ sender: Any) {
        let webvc = SFSafariViewController(url: Sample.rsueUrl)
        self.present(webvc, animated: true)
    }
    
    @IBAction func switchOpen(_ sender: UISwitch) {
        model.user.isOpen = !model.user.isOpen
        UIView.transition(with: isOpen, duration: 1.0, options: .transitionCrossDissolve, animations: {
            if self.model.user.isOpen {
                self.isOpen.text = "Профиль открыт"
            } else {
                self.isOpen.text = "Профиль скрыт"
            }
        }, completion: nil)

    }
    
    @IBAction func tapEdit(_ sender: Any) {
        model.addProfile()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOpen.text = "Профиль скрыт"
        projectsCount.text = String(model.user.projects.count + 1)
        
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = userImage.bounds.width/2
        userImage.image = model.user.photo
        userName.text = model.user.fullName
        
        
        if model.user.status == .student {
            userStatus.text = "Студент"
        } else {
            userStatus.text = "Научный сотрудник"
        }
        switch model.user.faculty {
        case .computerScience:
            userFaculty.text = "Факультет Компьютерных технологий и информационной безопаности"
        case .economics:
            userFaculty.text = "Факультет Экономики и финансов"
        case .law:
            userFaculty.text = "Юридический факультет"
        default:
            userFaculty.text = "Факультет Менеджмента и предпринимательства"
        }
        
        progress.setProgress(model.user.percentile, animated: true)
        percent.text = "\(model.user.percentile * 100) %"
        


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
