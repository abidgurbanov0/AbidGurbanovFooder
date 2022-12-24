//
//  UserPageInteractor.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import UIKit
class UserPageInteractor:PresenterToInteractorUserPageProtocol{
  
 
    
    var ref =  Database.database().reference().child("users")
    var userPagePresenter: InteractorToPresenterUserPageProtocol?
    var avatarImage:UIImage?
    var user_ImageName = "defaultImage"
    
    let uid = Auth.auth().currentUser?.uid
    
    func deleteFoodFromFavListI(yemek_adi:String){
        
            let uid = Auth.auth().currentUser?.uid
            let ref =  Database.database().reference().child("users").child(uid!).child("favorites")
 
            ref.child(yemek_adi).removeValue()
          
    }
    
    
    
    func getFavFoodListI(){
        
        let refFav =  Database.database().reference().child("users").child(uid!).child("favorites")
        refFav.observe(.value, with: { snapshot in
            var favFoodList = [Foods]()
            
            if let gelenVeri = snapshot.value as? [String:AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let foodID = d["foodID"] as? Int
                        let foodImageName = d["foodImageName"] as? String ?? ""
                        let foodName = d["foodName"] as? String ?? ""
                        let foodPrice = d["foodPrice"] as? Int
                        
                        let tempFavFood = Foods(id: foodID, name: foodName, image: foodImageName, price: foodPrice,category: "")
                        
                        
                        favFoodList.append(tempFavFood)
                    }
                }
            }
           
            self.userPagePresenter?.favListToPresenter(favFoodList: favFoodList)
        })
    }

    
    
    
    
    
    
    
    
    func updateUserInfoI(user_Name:String,user_Surname:String,user_Phone:String){
        let uid = Auth.auth().currentUser?.uid
        
        let userUpdate = ["user_Name":user_Name,"user_Phone":user_Phone,"user_Surname":user_Surname]
        ref.child(uid!).updateChildValues(userUpdate)
      
    }
    
    

    func getUserInfoFromFireBaseI() {
        
        let query = ref.queryOrdered(byChild: "user_Uid").queryEqual(toValue:Auth.auth().currentUser?.uid)
        query.observe(.value, with: { snapshot in
            


            if let gelenVeri = snapshot.value as? [String:AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let user_Name = d["user_Name"] as? String ?? ""
                        let user_Surname = d["user_Surname"] as? String ?? ""
                        let user_Phone = d["user_Phone"] as? String ?? ""
                        self.user_ImageName = d["user_ImageName"] as? String ?? ""
                       
                 
                        
                        
                        
                      
                        
                        self.userPagePresenter?.dataToPresenter(user_Name: user_Name, user_Surname: user_Surname, user_Phone: user_Phone)
                    }}
                
            } })
    }
    

    
}

