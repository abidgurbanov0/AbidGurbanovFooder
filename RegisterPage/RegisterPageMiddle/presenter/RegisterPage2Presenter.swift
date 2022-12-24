//
//  RegisterPage2Presenter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
import UIKit
class RegisterPage2Presenter:ViewToPresenterRegisterPage2Protocol,InteractorToPresenterRegisterPage2Protocol{
   
    var registerPage2View: PresenterToViewRegisterPage2Protocol?
    func dataToPresenter(isUpload: Bool) {
        
        registerPage2View?.dataToView(isUpload: isUpload)
    }
    
    
    
    
 
    func registerInfo(userName: String, userSurname: String, userPhone: String) {
        registerPage2Interactor?.registerInfoI(userName: userName, userSurname: userSurname, userPhone: userPhone)
    }
    
    var registerPage2Interactor: PresenterToInteractorRegisterPage2Protocol?
    
   
    
   
    
}
