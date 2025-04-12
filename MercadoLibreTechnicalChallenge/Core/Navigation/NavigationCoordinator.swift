
import SwiftUI

@MainActor
class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: Routes) {
        path.append(route)
    }

    func pop() {
        if !path.isEmpty {
            var newPath = path
            newPath.removeLast()
            path = newPath
        }
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
