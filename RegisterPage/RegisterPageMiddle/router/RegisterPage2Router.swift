//
//  RegisterPage2Router.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//
import Foundation

class RegisterPage2Router{
    static func createModule(ref: RegisterPage2VC) {
        let presenter = RegisterPage2Presenter()
        ref.registerPage2PresenterObject=presenter
        ref.registerPage2PresenterObject?.registerPage2Interactor = RegisterPage2Interactor()
        ref.registerPage2PresenterObject?.registerPage2View = ref
        ref.registerPage2PresenterObject?.registerPage2Interactor?.registerPage2Presenter = presenter
  
        
        
        
        
    }
    
}
