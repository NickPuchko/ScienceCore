//
//  AbstractViewController.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 28.11.2020.
//

import UIKit

class AbstractViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var applyStyleButton: UIButton!
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
