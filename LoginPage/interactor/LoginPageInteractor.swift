//
//  LoginPageInteractor.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
import FirebaseAuth
class LoginPageInteractor:PresenterToInteractorLoginPageProtocol{
    var loginPagePresenter: InteractorToPresenterLoginPageProtocol?
    
    func loginI(eMail: String, psw: String) {
        
        let auth = Auth.auth()
        
        auth.signIn(withEmail: eMail, password: psw) { (authResult, error) in
          if let error = error as? NSError {
              self.loginPagePresenter?.isLogin(isUser: false)
              self.loginPagePresenter?.sendErrorTypeToPresenter(error: error)
          } else {
      
              self.loginPagePresenter?.isLogin(isUser: true)
 
           
          }
        }
        
        
        
        
  }
                
            }
    
    
    

