//
//  NavigationStackView.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI

struct NavigationStackView<Content>: View where Content: View {
    @ObservedObject private var navigationStackViewModel: NavigationStackViewModel = .init()
    private let content: Content
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    public init(transitionType: NavigationTransition = .default,
                @ViewBuilder content: () -> Content) {
        self.content = content()
        switch transitionType {
        case .none:
            self.transition = (.identity, .identity)
        case .custom(let trans):
            self.transition = (trans, trans)
        default:
            self.transition = NavigationTransition.defaultTransition
        }
    }
    
    var body: some View {
        let showRoot: Bool = navigationStackViewModel.currentView == nil
        let navigationType: NavigationType = navigationStackViewModel.navigationType
        return ZStack {
            Group {
                if showRoot {
                    content
                        .transition(navigationType == .push ? transition.push : transition.pop)
                        .environmentObject(navigationStackViewModel)
                } else {
                    navigationStackViewModel.currentView!.view
                        .transition(navigationType == .push ? transition.push : transition.pop)
                        .environmentObject(navigationStackViewModel)
                }
            }
        }
    }
}
