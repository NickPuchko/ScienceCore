//
//  CreationViewController.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 27.11.2020.
//

import UIKit



class CreationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var model = CreationModel()
    
    @IBOutlet weak var addStyle: UIButton!
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var url: UITextField!
    @IBOutlet weak var spreadingPicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var counter: UIStepper!
    @IBAction func stepper(_ sender: Any) {
        stepperLabel.text = String(Int(counter.value))
        model.project.crue = Int(counter.value)
    }
    @IBOutlet weak var stepperLabel: UILabel!
    
    @IBAction func changeLabel(_ sender: Any) {
        guard let text = label.text else { return }
        model.project.label = text
        
        guard let urltext = url.text else { return }
        if text != "" && urltext != ""{
            UIView.animate(withDuration: 1.5) {
                self.addStyle.alpha = 1
                self.addStyle.isUserInteractionEnabled = true
            }
        } else {
            UIView.animate(withDuration: 1.5) {
                self.addStyle.alpha = 0.05
                self.addStyle.isUserInteractionEnabled = false
            }
        }
        
    }
    
    @IBAction func changeURL(_ sender: Any) {
        guard let urltext = url.text else { return }
        model.project.ref = URL(string: urltext) ?? Sample.project.ref
        
        guard let text = label.text else { return }
        if text != "" && urltext != ""{
            UIView.animate(withDuration: 1.5) {
                self.addStyle.alpha = 1
                self.addStyle.isUserInteractionEnabled = true
            }
        } else {
            UIView.animate(withDuration: 1.5) {
                self.addStyle.alpha = 0.05
                self.addStyle.isUserInteractionEnabled = false
            }
        }
    }
    
    @IBAction func returnLabel(_ sender: Any) {
        resignFirstResponder()
        if url.text == "" {
            url.becomeFirstResponder()
        }
        
    }

    @IBAction func returnURL(_ sender: Any) {
        resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStyle.isUserInteractionEnabled = false
        spreadingPicker.dataSource = self
        spreadingPicker.delegate = self

        

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Spreading.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Международный"
        case 1:
            return "Федеральный"
        default:
            return "Региональный"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            model.project.spreading = .worldwide
        case 1:
            model.project.spreading = .capital
        default:
            model.project.spreading = .regional
        }
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
    
        model.project.date = datePicker.date
        let vc: AbstractViewController = storyboard!.instantiateViewController(identifier: "AbstractViewController") as AbstractViewController
        vc.model = AbstractModel(project: model.project)
        self.present(vc, animated: true, completion: {
            self.goToProfile()
        })
    }
    
    func goToProfile() {
        self.tabBarController?.selectedIndex = 4
    }

    
    
    
    
    
//
//    struct Project {
//        var label: String
//        var date: Date
//        var ref: URL
//        var vacations: [User]
//        var crue: [User]
//        var type: ProjectType = .article
//        var spreading: Spreading = .regional
//        lazy var value: Float = {
//            type.rawValue * spreading.rawValue
//        }()
//    }
//
//    enum Tag: String {
//        case economics, math, computerScience, law
//    }
//
//    enum ProjectType: Float {
//        case article = 1, preprint = 0.8
//    }
//
//    enum Spreading: Float {
//        case worldwide = 100, capital = 60, regional = 30
//    }

 

}
