//
//  BasicHostingController.swift
//  NavigateCoordinator
//
//  Created by Matthew Lock on 23/04/2025.
//

import SwiftUI

public final class BasicHostingController<V>: UIHostingController<V>, ViewController where V: View {

    nonisolated(unsafe) public var onDismissed: (() -> Void)?
    
    override public func viewDidDisappear(_ animated: Bool) {
        if isBeingDismissed {
            onDismissed?()
            onDismissed = nil
        }
        super.viewDidDisappear(animated)
    }

    deinit {
        onDismissed?()
        onDismissed = nil
    }
}
