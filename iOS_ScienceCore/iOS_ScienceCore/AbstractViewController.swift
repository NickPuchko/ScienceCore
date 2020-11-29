//
//  AbstractViewController.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 28.11.2020.
//

import UIKit

class AbstractViewController: UIViewController, UITextViewDelegate {
    var model: AbstractModel?
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var applyStyleButton: UIButton!
    
//    init(project: Project) {
//        self.model = AbstractModel(project: project)
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyleButton.layer.cornerRadius = 10
        applyStyleButton.layer.borderWidth = 2
        applyStyleButton.layer.borderColor = UIColor.gray.cgColor
        
        textView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func createML() {
        //let data = try ML
    }
    
    @IBAction func didApply(_ sender: Any) {
        model?.project.tags = [.computerScience, .economics]
        model?.addProject()
        dismiss(animated: true)
        
        //self.tabBarController!.selectedIndex = 4
    
        
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
