//
//  LoginPageRouter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
class LoginPageRouter:PresenterToRouterLoginPageProtocol{
    static func createModule(ref: LoginPageVC) {
        
        let presenter = LoginPagePresenter()
        ref.loginPagePresenterObject = presenter
        ref.loginPagePresenterObject?.loginPageInteractor = LoginPageInteractor()
        ref.loginPagePresenterObject?.loginPageView = ref
        ref.loginPagePresenterObject?.loginPageInteractor?.loginPagePresenter = presenter
        

    }
    
    
}
