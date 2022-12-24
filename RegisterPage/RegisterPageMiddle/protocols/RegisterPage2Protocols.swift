//
//  RegisterPage2Protocols.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
import UIKit
protocol ViewToPresenterRegisterPage2Protocol{
    var registerPage2Interactor : PresenterToInteractorRegisterPage2Protocol?{get set}
    var registerPage2View : PresenterToViewRegisterPage2Protocol?{get set}
    func registerInfo(userName:String,userSurname:String,userPhone:String)
 
}
protocol PresenterToInteractorRegisterPage2Protocol{
    var registerPage2Presenter : InteractorToPresenterRegisterPage2Protocol?{get set}
    func registerInfoI(userName:String,userSurname:String,userPhone:String)

}

protocol InteractorToPresenterRegisterPage2Protocol{
    func dataToPresenter(isUpload:Bool)
}
protocol PresenterToViewRegisterPage2Protocol{
    func dataToView(isUpload:Bool)
    
}

protocol PresenterToRouterRegisterPage2Protocol{
    static func createModule(ref: RegisterPage2VC)
}
