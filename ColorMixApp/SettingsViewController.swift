//
//  ViewController.swift
//  ColorMixApp
//
//  Created by Sergey on 09.07.2021.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var colorMixView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var viewColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorMixView.layer.cornerRadius = 15
        
        updateSlidersValueFromUIColor(color: viewColor)
        updateColorLabelAndTextField(sliderColors: redSlider, greenSlider, blueSlider)
        updateColorMixView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - IBActions
    @IBAction func sliderValueUpdated(_ sender: UISlider) {
        updateColorLabelAndTextField(sliderColors: sender)
        updateColorMixView()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColorValue(red: CGFloat(redSlider.value),
                                  green: CGFloat(greenSlider.value),
                                  blue: CGFloat(blueSlider.value))
        dismiss(animated: true)
    }
    
    // MARK: - Pablic Nethods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textFieldText = textField.text else {
            textFieldSetDefaultValue(for: textField)
            return
        }
        guard let textFieldFloat = Float(textFieldText.replacingOccurrences(of: ",", with: ".")) else {
            textFieldSetDefaultValue(for: textField)
            return
        }
        guard textFieldFloat >= 0 && textFieldFloat <= 1 else {
            textFieldSetDefaultValue(for: textField)
            return
        }
        
        switch textField {
        case redTextField:
            redSlider.value = textFieldFloat
            sliderValueUpdated(redSlider)
        case greenTextField:
            greenSlider.value = textFieldFloat
            sliderValueUpdated(greenSlider)
        default:
            blueSlider.value = textFieldFloat
            sliderValueUpdated(blueSlider)
        }
    }
    
    // MARK: - Private Methods
    private func updateColorMixView() {
        colorMixView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    
    private func updateColorLabelAndTextField(sliderColors: UISlider...) {
        sliderColors.forEach { slider in
            switch slider {
            case redSlider:
                redValueLabel.text = String(format: "%.2f", redSlider.value)
                redTextField.text = String(format: "%.2f", redSlider.value)
            case greenSlider:
                greenValueLabel.text = String(format: "%.2f", greenSlider.value)
                greenTextField.text = String(format: "%.2f", greenSlider.value)
            default:
                blueValueLabel.text = String(format: "%.2f", blueSlider.value)
                blueTextField.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
    
    private func updateSlidersValueFromUIColor(color: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func textFieldSetDefaultValue(for textField: UITextField) {
        switch textField {
        case redTextField:
            textField.text = redValueLabel.text
        case greenTextField:
            textField.text = greenValueLabel.text
        default:
            textField.text = blueValueLabel.text
        }
    }
    
}
