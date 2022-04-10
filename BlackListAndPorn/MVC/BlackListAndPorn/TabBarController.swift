//
//  ViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 23.03.2022.
//

import UIKit
import CoreData

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Tab"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


}

//MARK: - Private methods
extension ViewController {
    private func setup() {
        view.backgroundColor = .secondarySystemBackground
        let vcBlackList = UINavigationController(rootViewController: BlackListController())
        let vcProfile = UINavigationController(rootViewController:ProfileController())
        
        vcBlackList.tabBarItem = .init(title: "BlackList", image: .checkmark, tag: 1)
        vcProfile.tabBarItem = .init(title: "Profile", image: .add, tag: 4)
        
        self.setViewControllers([vcBlackList, vcProfile], animated: true)
    }
}
