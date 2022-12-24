//
//  LoginPagePresenter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
class LoginPagePresenter:ViewToPresenterLoginPageProtocol, InteractorToPresenterLoginPageProtocol{
    func sendErrorTypeToPresenter(error: NSError) {
        loginPageView?.sendErrorTypeToView(error: error)
    }
    
    func isLogin(isUser: Bool) {
        loginPageView?.isLoginV(isUser: isUser)
    }
    
    var loginPageView: PresenterToViewLoginPageProtocol?
    
    func login(eMail: String, psw: String) {
       
        loginPageInteractor?.loginI(eMail: eMail, psw: psw)
        
    }
    
    var loginPageInteractor: PresenterToInteractorLoginPageProtocol?
    
    var LoginPageInteractor: PresenterToInteractorLoginPageProtocol?
    
    
}
