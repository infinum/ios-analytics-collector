//
//  SettingsViewController.swift
//  Collar
//
//  Created by Filip Gulan on 19/03/2020.
//  Copyright © 2020 Infinum. All rights reserved.
//

import UIKit

public class SettingsViewController: UITableViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var popupEnabledSwitch: UISwitch!
    
    // MARK: - Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        setupCloseButton()
        configureUI()
    }
}

private extension SettingsViewController {
        
    func setupCloseButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .stop,
            target: self,
            action: #selector(closeButtonActionHandler)
        )
    }

    func configureUI() {
        popupEnabledSwitch.isOn = LogItemPopupQueue.shared.enabled
    }
}

// MARK: - Action handlers

private extension SettingsViewController {
    
    @objc
    func closeButtonActionHandler() {
        dismiss(animated: true)
    }
    
    @IBAction
    func popupEnabledSwitchActionHandler() {
        LogItemPopupQueue.shared.enabled = popupEnabledSwitch.isOn
    }
}

extension SettingsViewController {
    
    static func fromStoryboard() -> SettingsViewController {
        return UIStoryboard(name: "Settings", bundle: .framework)
            .instantiateViewController(withIdentifier: "SettingsViewController")
            as! SettingsViewController
    }
}
