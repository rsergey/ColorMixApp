//
//  PresentationViewController.swift
//  ColorMixApp
//
//  Created by Sergey on 24.07.2021.
//

import UIKit

class PresentationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }
    
    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewColor = view.backgroundColor ?? UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }

}
