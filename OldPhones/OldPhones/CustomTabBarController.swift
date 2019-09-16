//
//  CustomTabBarController.swift
//  OldPhones
//
//  Created by pennyworth on 9/10/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

class CustomTabBarController:  UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let menuViewController = MenuViewController()
        let aboutUsViewController = AboutUsViewController()
        
//        let menuViewController = UINavigationController(rootViewController: MenuViewController())
//        let aboutUsViewController = UINavigationController(rootViewController: AboutUsViewController())
        
        menuViewController.title = "Products"
        aboutUsViewController.title = "Us"
        
        viewControllers = [menuViewController, aboutUsViewController]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: MenuViewController.self) {
            let vc =  MenuViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            return false
        } else if viewController.isKind(of: AboutUsViewController.self)  {
            let vc =  AboutUsViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            return false
        }
        
        
        return true
    }
}
