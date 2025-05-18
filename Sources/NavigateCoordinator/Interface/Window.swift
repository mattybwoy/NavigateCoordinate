//
//  Window.swift
//  NavigateCoordinator
//
//  Created by Matthew Lock on 14/04/2025.
//

import UIKit

public protocol Window: AnyObject {
    var rootViewController: ViewController? { get set }

    func makeKeyAndVisible()
}

public extension Window {
    @MainActor
    var rootViewController: ViewController? {
        get {
            guard
                let selfAsUIWindow = self as? UIWindow,
                let rootViewController = selfAsUIWindow.rootViewController as? ViewController
            else { return nil }

            return rootViewController
        }

        set {
            guard
                let selfAsUIWindow = self as? UIWindow,
                let rootViewControllerToSet = newValue as? UIViewController
            else { return }

            selfAsUIWindow.rootViewController = rootViewControllerToSet
        }
    }
}

extension UIWindow: @preconcurrency Window {}
