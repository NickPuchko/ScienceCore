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
    
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.alpha = 0
        progressBar.progress = 0
        tag.alpha = 0
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
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func didApply(_ sender: Any) {
        model?.analizeTags(abstract: textView.text)
        model?.addProject()
        
        
        UIView.animate(withDuration: 2, animations: {
            self.applyStyleButton.alpha = 0
            self.progressBar.alpha = 1
        }) { (_) in
            sleep(1)
            self.setupProgress()
//            UIView.animate(withDuration: 2.0, animations: {
//                self.setupProgress()
//            }) { (_) in
//
//            }
        }
    }
    
    @IBOutlet weak var tag: UILabel!
    
    
    private func setupProgress() {
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(increaseTimer), userInfo: nil, repeats: true)
    }
    
    @objc
    func increaseTimer() {
        switch progressBar.progress {
        case 1:
            self.timer.invalidate()
            UIView.animate(withDuration: 1.0, animations: {
                self.tag.text = self.model?.project.tags.first
                self.tag.alpha = 1
            }) { (_) in
                sleep(2)
                self.dismiss(animated: true)
            }

        default:
            progressBar.setProgress(progressBar.progress + 0.001, animated: true)
        }
    }
}
