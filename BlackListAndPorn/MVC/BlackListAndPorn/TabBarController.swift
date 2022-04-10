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
       // fetchAllCategories()
    }


}

//MARK: - Private methods
extension ViewController {
    private func setup() {
        view.backgroundColor = .secondarySystemBackground
        let vcBlackList = UINavigationController(rootViewController: BlackListController())
        let vcGame = UINavigationController(rootViewController: GameViewController())
        let vcPhotoCollection = UINavigationController(rootViewController: PhotoViewController())
        let vcProfile = UINavigationController(rootViewController:ProfileController())
        
        vcBlackList.tabBarItem = .init(title: "BlackList", image: .checkmark, tag: 1)
        vcGame.tabBarItem = .init(title: "Game", image: .remove, tag: 2)
        vcPhotoCollection.tabBarItem = .init(title: "Photo", image: .actions, tag: 3)
        vcProfile.tabBarItem = .init(title: "Profile", image: .add, tag: 4)
        
        //self.setViewControllers([vcBlackList, vcGame, vcPhotoCollection, vcProfile], animated: true)
        self.setViewControllers([vcBlackList], animated: true)
    }
}
