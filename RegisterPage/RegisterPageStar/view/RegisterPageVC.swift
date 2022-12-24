//
//  RegisterPageVC.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import UIKit

class RegisterPageVC: UIViewController {
    

  
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tfEmail: UITextField!
    
  
    @IBOutlet weak var tfPassword: UITextField!
    
    
    @IBOutlet weak var labelError: UILabel!
    
    var registerPagePresenterObject : ViewToPresenterRegisterPageProtocol?
    
    

    override func viewDidLoad() {
        labelError.isHidden = true
        
        RegisterPageRouter.createModule(ref: self)
        self.hideKeyboardWhenTappedAround()
        super.viewDidLoad()
        indicator.stopAnimating()

    
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        sender.preventRepeatedPresses()
      
        if let email = tfEmail.text , let psw = tfPassword.text{
            if isValidEmail(email){
          
                    self.view.isUserInteractionEnabled = false
                    indicator.startAnimating()
                    registerPagePresenterObject?.register(email: email, psw: psw)
                
                
            }else{
                animationTF(textfield: tfEmail)
                labelError.text = "Duzgun E-mail girin"
                labelError.isHidden = false
            }
            
            
            
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
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
 
}
extension RegisterPageVC : PresenterToViewRegisterPageProtocol{
    func dataToView(isCreate:Bool){
        if isCreate{
            self.view.isUserInteractionEnabled = true
            indicator.stopAnimating()
            labelError.isHidden = true
            performSegue(withIdentifier: "toRegister2", sender: nil)
        }
        else{
            self.view.isUserInteractionEnabled = true
            indicator.stopAnimating()
            labelError.text = "Email istifade olunur."
            labelError.isHidden = false
            animationTF(textfield: tfEmail)
        }
    }
}
