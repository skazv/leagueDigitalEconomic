//
//  ViewController.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 23.03.2022.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

//MARK: - Private methods
extension ViewController {
    private func setup() {
        view.backgroundColor = .secondarySystemBackground
        let bl = BlackListRouter.createBlackListModul()
        let vcBackList = UINavigationController(rootViewController: bl)
        let vcProfile = UINavigationController(rootViewController:ProfileController())
        
        vcBackList.tabBarItem = .init(title: "BlackList", image: UIImage(systemName: "book.fill"), tag: 0)
        vcProfile.tabBarItem = .init(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        self.setViewControllers([vcBackList, vcProfile], animated: true)
    }
}
