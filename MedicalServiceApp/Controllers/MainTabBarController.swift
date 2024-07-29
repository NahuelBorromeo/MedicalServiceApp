//
//  MainTabBarController.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 22/07/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let homeController = HomeViewController()
        let doctorsController = DoctorsViewController()
        let categoriesController = CategoriesViewController()
        let logoutController = LogoutViewController()
        
        homeController.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house"), tag: 0)
        doctorsController.tabBarItem = UITabBarItem(title: "Doctores", image: UIImage(systemName: "stethoscope"), tag: 1)
        categoriesController.tabBarItem = UITabBarItem(title: "Especialidades", image: UIImage(systemName: "list.bullet"), tag: 2)
        logoutController.tabBarItem = UITabBarItem(title: "Cerrar Sesión", image: UIImage(systemName: "arrow.left"), tag: 3)
        
        let homeNav = UINavigationController(rootViewController: homeController)
        let doctorsNav = UINavigationController(rootViewController: doctorsController)
        let categoriesNav = UINavigationController(rootViewController: categoriesController)
        let logoutNav = UINavigationController(rootViewController: logoutController)
        
        self.viewControllers = [homeNav, doctorsNav, categoriesNav, logoutNav]
    }
}

// MARK: - getTabBarHeight

extension UITabBarController {
    func getTabBarHeight() -> CGFloat {
        return self.tabBar.bounds.height
    }
}

