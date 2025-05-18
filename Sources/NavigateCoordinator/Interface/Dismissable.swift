//
//  Dismissable.swift
//  NavigateCoordinator
//
//  Created by Matthew Lock on 16/04/2025.
//

public protocol Dismissable {
    var onDismissed: (() -> Void)? { get set }
}
