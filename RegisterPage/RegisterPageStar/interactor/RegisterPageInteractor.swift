//
//  RegisterPageInteractor.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//
import Foundation
import FirebaseAuth
class RegisterPageInteractor : PresenterToInteractorRegisterPageProtocol{
    var registerPagePresenter: InteractorToPresenterRegisterPageProtocol?
    
    func registerI(email: String, psw: String) {
        let auth = Auth.auth()
        auth.createUser(withEmail: email, password: psw){(authresult, error) in
            if error == nil{
          
                
                self.registerPagePresenter?.dataToPresenter(isCreate: true)
                
            }
            else{
                self.registerPagePresenter?.dataToPresenter(isCreate: false)
            }
        }
        
        
    }
    
    
}
