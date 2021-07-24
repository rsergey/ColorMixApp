//
//  PresentationViewController.swift
//  ColorMixApp
//
//  Created by Sergey on 24.07.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColorValue(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class PresentationViewController: UIViewController {

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewColor = view.backgroundColor ?? UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        settingsVC.delegate = self
    }
}

// MARK: - Extension
extension PresentationViewController: SettingsViewControllerDelegate {
    func setNewColorValue(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}
