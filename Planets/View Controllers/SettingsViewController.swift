//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func plutosPlanetStatusDidChange(newValue: Bool)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!

    var delegate: SettingsViewControllerDelegate!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        shouldShowPlutoSwitch.isOn = UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
    }
    
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: .shouldShowPlutoKey)
        delegate.plutosPlanetStatusDidChange(newValue: sender.isOn)
    }
}
