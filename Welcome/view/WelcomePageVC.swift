//
//  WelcomePageVC.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import UIKit
import FirebaseAuth
class WelcomePageVC: UIViewController {
    var isLogin = false
    @IBOutlet weak var labelRegisterOrCont: UIButton!
    @IBOutlet weak var labelLoginOrLogout: UIButton!
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        setButtonTitle()
    }
    

    @IBAction func buttonRegisterOrCont(_ sender: Any) {
        if isLogin{
            let controller = storyboard?.instantiateViewController(withIdentifier: "mainPage") as! UITabBarController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            present(controller, animated: true, completion: nil)
        }
        else{
            performSegue(withIdentifier: "toRegisterPage", sender: nil)
        }
    }
    

    @IBAction func buttonLoginOrLogout(_ sender: Any) {
        if isLogin{
            isLogin = false
            label1.text = "Hesabın var mı ?"
            labelLoginOrLogout.setTitle("Giris", for: .normal)
            labelLoginOrLogout.tintColor=UIColor(named: "mainColor")
            labelRegisterOrCont.setTitle("Qeydiyyat", for: .normal)
            do {
              try Auth.auth().signOut()
                
            } catch let signOutError as NSError {
              print(signOutError)
            }
            
            
        }else{
            performSegue(withIdentifier: "toLogin", sender: nil)
        }
    }
    func setButtonTitle(){
        if Auth.auth().currentUser != nil{
            isLogin = true
            let userInfo = Auth.auth().currentUser
              
            let email = userInfo?.email
            label1.text = ""
            labelLoginOrLogout.setTitle("Hesabdan cix", for: .normal)
            labelLoginOrLogout.tintColor=UIColor.red
            labelRegisterOrCont.setTitle("\(email!) ile devam et", for: .normal)
        }
    }
}
