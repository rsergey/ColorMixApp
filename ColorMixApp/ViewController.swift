//
//  ViewController.swift
//  ColorMixApp
//
//  Created by Sergey on 09.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorMixView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorMixView.layer.cornerRadius = 15
        updateColorLabel(sliderColor: 0)
        updateColorMixView()
    }

    @IBAction func updateSlider(_ sender: UISlider) {
        updateColorLabel(sliderColor: sender.tag)
        updateColorMixView()
    }
    
    private func updateColorMixView() {
        colorMixView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    
    private func updateColorLabel(sliderColor: Int) {
        switch sliderColor {
        case 1:
            redValueLabel.text = String(format: "%.2f", redSlider.value)
        case 2:
            greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        case 3:
            blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        default:
            redValueLabel.text = String(format: "%.2f", redSlider.value)
            greenValueLabel.text = String(format: "%.2f", greenSlider.value)
            blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        }
    }
}
