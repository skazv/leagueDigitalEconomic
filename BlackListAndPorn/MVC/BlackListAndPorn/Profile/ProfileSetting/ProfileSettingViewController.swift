//
//  ProfileSettingViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 25.03.2022.
//

import UIKit

class ProfileSettingViewController: UIViewController {
    
    let profileSetting = ProfileSettingView()
    
    override func loadView() {
        view = profileSetting
        title = "Profile settings"
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
}
