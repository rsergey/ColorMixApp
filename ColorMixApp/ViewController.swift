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
        updateColorMixView()
        updateColorLabel()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        colorMixView.layer.cornerRadius = colorMixView.bounds.height / 10
    }

    @IBAction func updateSlider() {
        updateColorMixView()
        updateColorLabel()
    }
    
    private func updateColorMixView() {
        let color = UIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: 1)
        
        colorMixView.backgroundColor = color
    }
    
    private func updateColorLabel() {
        redValueLabel.text = String(round(redSlider.value * 100) / 100)
        greenValueLabel.text = String(round(greenSlider.value * 100) / 100)
        blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
    }
}
