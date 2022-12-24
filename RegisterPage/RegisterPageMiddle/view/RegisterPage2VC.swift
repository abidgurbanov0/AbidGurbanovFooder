//
//  Register2VC.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import UIKit

class RegisterPage2VC: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    var registerPage2PresenterObject : ViewToPresenterRegisterPage2Protocol?
   
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfSurname: UITextField!
    @IBOutlet weak var tfName: UITextField!
    var avatarImageName:String?
    var isUpload = false
    var isPhotoSelected = false
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        RegisterPage2Router.createModule(ref: self)
        indicator.stopAnimating()
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }
    


           


    @IBAction func buttonNext(_ sender: Any) {
        
        if tfName.text!.count<2{
            animationTF(textfield: tfName)
        }
        
        else if tfSurname.text!.count < 1{
            animationTF(textfield: tfSurname)
        }
        else if !isValidPhone(phone: tfPhone.text!) {
            animationTF(textfield: tfPhone)
        }
        else{
            
            
            if let uN = tfName.text, let uS = tfSurname.text, let uP = tfPhone.text{
                registerPage2PresenterObject?.registerInfo(userName: uN, userSurname: uS, userPhone: uP)
                performSegue(withIdentifier: "register2ToComp", sender: nil)
            }
            
            
        }
    }
        
        
       

      
       
    }
    func isValidPhone(phone: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phone)
        }
    func animationTF(textfield:UITextField){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textfield.center.x - 10, y: textfield.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textfield.center.x + 10, y: textfield.center.y))

        textfield.layer.add(animation, forKey: "position")
    }
 


extension RegisterPage2VC:PresenterToViewRegisterPage2Protocol{
    func dataToView(isUpload: Bool) {
        self.isUpload = isUpload
        if isUpload{
            self.indicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            
        }
    }
    
}
