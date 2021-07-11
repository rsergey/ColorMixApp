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
        updateColorLabel(sliderColor: "")
        updateColorMixView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        colorMixView.layer.cornerRadius = colorMixView.bounds.height / 10
    }

    @IBAction func updateSlider(_ sender: UISlider) {
        updateColorLabel(sliderColor: sender.restorationIdentifier ?? "")
        updateColorMixView()
    }
    
    private func updateColorMixView() {
        colorMixView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    
    private func updateColorLabel(sliderColor: String) {
        switch sliderColor {
        case "red":
            redValueLabel.text = String(round(redSlider.value * 100) / 100)
        case "green":
            greenValueLabel.text = String(round(greenSlider.value * 100) / 100)
        case "blue":
            blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
        default:
            redValueLabel.text = String(round(redSlider.value * 100) / 100)
            greenValueLabel.text = String(round(greenSlider.value * 100) / 100)
            blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
        }
    }
}
