//
//  BasicTabBarController.swift
//  NavigateCoordinator
//
//  Created by Matthew Lock on 23/06/2025.
//
import UIKit

open class BasicTabBarController: UITabBarController, TabController {
    
    nonisolated(unsafe) public var onDismissed: (() -> Void)?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

