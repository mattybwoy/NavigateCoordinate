//
//  Coordinator.swift
//  NavigateCoordinator
//
//  Created by Matthew Lock on 23/04/2025.
//

public protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }
    var navigator: Navigator { get }
    var baseViewController: ViewController? { get set }
    var parentCoordinator: Coordinator? { get set }

    func finish(animated: Bool)
    func start(transition: Transition, onDismissed: (() -> Void)?)
    func startChild(
        _ child: Coordinator,
        transition: Transition,
        onDismissed: (() -> Void)?
    )
}

public extension Coordinator {

    @MainActor func finish(animated: Bool) {
        navigator.exitFlow(coordinator: self, animated: animated)
    }

    func startChild(
        _ child: Coordinator,
        transition: Transition,
        onDismissed: (() -> Void)?
    ) {
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start(transition: transition, onDismissed: { [weak self, weak child] in
            guard let self, let child else { return }

            self.removeChild(child)
            onDismissed?()
        })
    }

    private func removeChild(_ child: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === child }) else {
            return
        }

        childCoordinators.remove(at: index)
    }
}
