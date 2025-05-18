//
//  Transition.swift
//  NavigateCoordinator
//
//  Created by Matthew Lock on 26/04/2025.
//
import UIKit

public enum Transition: Equatable {
    case push(animated: Bool)
    case modal(animated: Bool)
}
