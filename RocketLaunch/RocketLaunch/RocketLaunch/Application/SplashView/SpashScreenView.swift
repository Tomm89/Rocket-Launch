//
//  SpashScreenView.swift
//  RocketLaunch
//
//  Created by Tomáš Brand on 12.03.2023.
//

import SwiftUI
import UIToolkit

struct SplashScreenView: View {
    
    // MARK: - Store properties
    
    @ObservedObject private var viewModel: SplashViewModel
    
    private var mainVStackSpacing: CGFloat = 40
    private var imageSizeWidht: CGFloat = 120
    private var imageSizeHeight: CGFloat = 200
    
    // MARK: - Init
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body and views
    
    var body: some View {
        VStack(spacing: mainVStackSpacing) {
            AppTheme.Images.rocketIdleIcon
                .resizable()
                .frame(width: imageSizeWidht, height: imageSizeHeight)
            
            HeadlineText(font: AppTheme.Fonts.headlineText, Strings.appName)
                .padding()
        }
        .lifecycle(viewModel)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundStyle(.mainBackground)
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(viewModel: SplashViewModel(appFlowController: nil))
    }
}
