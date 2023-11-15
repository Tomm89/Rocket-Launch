//
//  SplashViewModel.swift
//  RocketLaunch
//
//  Created by Tomáš Brand on 15.11.2023.
//

import SwiftUI
import UIToolkit
import Utilities

// MARK: - State

extension SplashViewModel {
    struct State {}
}

// MARK: - View model

final class SplashViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    // MARK: State
    @Published private(set) var state: State = State()
    
    // MARK: Dependencies
    private weak var appFlowController: AppFlowController?

    // MARK: Init
    init(appFlowController: AppFlowController?) {
        self.appFlowController = appFlowController
        super.init()
    }
     
    // MARK: Lifecycle
    override func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.setupMain()
        }
    }
    
    // MARK: Intent
    enum Intent {}

    func onIntent(_ intent: Intent) {
        // We can handle some data here if we need them before redirection to homepage
        executeTask(Task {})
    }
    
    // MARK: Private
    private func setupMain() {
        appFlowController?.setupMain()
    }
}
