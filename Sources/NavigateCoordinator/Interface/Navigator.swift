//
//  Navigator.swift
//  NavigateCoordinator
//
//  Created by Matthew Lock on 16/04/2025.
//

import Foundation

@MainActor
public protocol Navigator: AnyObject {
    func navigate(to viewController: ViewController, transition: Transition)
    func exitFlow(coordinator: Coordinator, animated: Bool)
    func dismiss(animated: Bool)
    func popViewController(animated: Bool)
    func popToViewController(_ viewController: ViewController, animated: Bool)
    func popToRootViewController(animated: Bool)
}
