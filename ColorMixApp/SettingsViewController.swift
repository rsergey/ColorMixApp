//
//  ViewController.swift
//  ColorMixApp
//
//  Created by Sergey on 09.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var colorMixView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var viewColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setNavigationBarHidden(true, animated: false)
        colorMixView.layer.cornerRadius = 15
        
        updateSlidersValueFromUIColor(color: viewColor)
        updateColorLabel(sliderColors: redSlider, greenSlider, blueSlider)
        updateColorMixView()
    }

    @IBAction func updateSlider(_ sender: UISlider) {
        updateColorLabel(sliderColors: sender)
        updateColorMixView()
    }
    
    private func updateColorMixView() {
        colorMixView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    
    private func updateColorLabel(sliderColors: UISlider...) {
        sliderColors.forEach { slider in
            switch slider {
            case redSlider:
                redValueLabel.text = String(format: "%.2f", redSlider.value)
            case greenSlider:
                greenValueLabel.text = String(format: "%.2f", greenSlider.value)
            default:
                blueValueLabel.text = String(format: "%.2f", blueSlider.value)
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
}
