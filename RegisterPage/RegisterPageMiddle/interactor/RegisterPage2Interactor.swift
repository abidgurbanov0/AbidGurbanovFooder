//
//  RegisterPage2Interactor.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
import Firebase
import FirebaseAuth
import UIKit
import FirebaseStorage
class RegisterPage2Interactor : PresenterToInteractorRegisterPage2Protocol{
    var registerPage2Presenter: InteractorToPresenterRegisterPage2Protocol?
    

    
    func registerInfoI(userName: String, userSurname: String, userPhone: String) {
        let currentUser=Auth.auth().currentUser
        let user_uid = currentUser?.uid
        let user = ["user_Uid":user_uid,"user_Name":userName,"user_Surname":userSurname,"user_Phone":userPhone]
        Database.database().reference().child("users").child(user_uid!).setValue(user)
    }
    
    
}
