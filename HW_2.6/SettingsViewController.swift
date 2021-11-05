//
//  ViewController.swift
//  HW2.2
//
//  Created by Егор Кромин on 22.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var redSliderOutlet: UISlider!
    @IBOutlet var greenSliderOutlet: UISlider!
    @IBOutlet var blueSliderOutlet: UISlider!
    
    @IBOutlet var redLabelValue: UILabel!
    @IBOutlet var greenLabelValue: UILabel!
    @IBOutlet var blueLabelValue: UILabel!
    
    @IBOutlet var redValueTextField: UITextField!
    @IBOutlet var greenValueTextField: UITextField!
    @IBOutlet var blueValueTextField: UITextField!
    
    @IBOutlet var coloredView: UIView!
    
    var colors = (CGFloat(0), CGFloat(0), CGFloat(0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        coloredView.layer.cornerRadius = 10
        coloredView.layer.borderWidth = 1
        coloredView.layer.borderColor = UIColor.black.cgColor
        
        redValueTextField.inputAccessoryView = addDoneButton()
        greenValueTextField.inputAccessoryView = addDoneButton()
        blueValueTextField.inputAccessoryView = addDoneButton()
        
        redSliderOutlet.setValue(Float(colors.0), animated: false)
        greenSliderOutlet.setValue(Float(colors.1), animated: false)
        blueSliderOutlet.setValue(Float(colors.2), animated: false)
        sliderValueChanged()
        sliderAction()
    }

    @IBAction func sliderAction() {
        
        coloredView.backgroundColor = UIColor(red: CGFloat(redSliderOutlet.value), green: CGFloat(greenSliderOutlet.value), blue: CGFloat(blueSliderOutlet.value), alpha: 1)
    }
    @IBAction func sliderValueChanged() {
        redLabelValue.text = String(format: "%.2f", redSliderOutlet.value)
        greenLabelValue.text = String(format: "%.2f", greenSliderOutlet.value)
        blueLabelValue.text = String(format: "%.2f", blueSliderOutlet.value)
        
        redValueTextField.text = String(format: "%.2f", redSliderOutlet.value)
        greenValueTextField.text = String(format: "%.2f", greenSliderOutlet.value)
        blueValueTextField.text = String(format: "%.2f", blueSliderOutlet.value)
        
    }
    @IBAction func valueTextFieldDidEdited() {
        redSliderOutlet.setValue(Float(redValueTextField.text!) ?? 0, animated: true)
        greenSliderOutlet.setValue(Float(greenValueTextField.text!) ?? 0, animated: true)
        blueSliderOutlet.setValue(Float(blueValueTextField.text!) ?? 0, animated: true)
        sliderValueChanged()
        sliderAction()
        
    }
    
    @IBAction func doneButtonPressed() {
        
    }
    

}
extension SettingsViewController {
   @objc func endEditing() {
        view.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
        super .touchesBegan(touches, with: event)
    }
    
    func addDoneButton() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(endEditing))
        
        toolBar.setItems([space, doneButton], animated: false)
       return toolBar
    }
}
