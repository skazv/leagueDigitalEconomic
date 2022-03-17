//
//  ViewController.swift
//  Lesson6
//
//  Created by Suren Kazaryan on 07.03.2022.
//
// ВОПРОСЫ И ДОРАБОТКИ:
// 1) Попробовать через appearance

import UIKit

class ViewController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarSetup()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            tabBar.tintColor = .black
            tabBar.barTintColor = .black
            tabBar.backgroundColor = .systemCyan
        } else {
            tabBar.backgroundColor = .systemYellow
        }
    }
    
}

//MARK: - Private methods
extension ViewController {
    
    private func tabBarSetup() {
        
        let autoLayoutVc = UINavigationController(rootViewController:  AutoLayoutController())
        let xibVc = UINavigationController(rootViewController: XIBController())
        let manualVc = UINavigationController(rootViewController: ManualController())
        let navigationVc = NavigationController()
        let largeVc = LargeNavigationController()
        
        autoLayoutVc.title = "Auto Layout"
        xibVc.title = "XIB"
        manualVc.title = "Manual"
        navigationVc.title = "Navigation"
        largeVc.title = "Large"
        
        autoLayoutVc.tabBarItem.image = .strokedCheckmark
        xibVc.tabBarItem.image = .actions
        manualVc.tabBarItem.image = .checkmark
        navigationVc.tabBarItem.image = .add
        largeVc.tabBarItem.image = .remove
        
        self.setViewControllers([autoLayoutVc, xibVc, manualVc, navigationVc, largeVc], animated: true)
        self.tabBar.backgroundColor = .systemYellow
    }
    
}
