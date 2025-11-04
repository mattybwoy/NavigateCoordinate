//
//  TabController.swift
//  NavigateCoordinator
//
//  Created by Matthew Lock on 27/08/2025.
//

import UIKit

@MainActor
public protocol TabController: AnyObject, ViewController {
    var selectedIndex: Int { get set }
    var viewControllers: [UIViewController]? { get set }
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool)
}

public extension TabController {
    
    func switchToFirstTab(in tabBarController: TabController) {
        tabBarController.selectedIndex = 0
    }
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        self.setViewControllers(viewControllers, animated: animated)
    }
}

