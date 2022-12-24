//
//  PaymentPageVC.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//


import UIKit
import UserNotifications
class OrderDetailVC: UIViewController {
    
    @IBOutlet weak var labelTotalPrice2: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    @IBOutlet weak var labelCardInfo: UILabel!
    @IBOutlet weak var labelAdress: UILabel!
    var price:String?
    var permissionControl = false
    var delegate:OrderDetailToCartPage?
    override func viewDidLoad() {
        
        labelTotalPrice.text = "\(price!) azn"
        labelTotalPrice2.text = labelTotalPrice.text
        UNUserNotificationCenter.current().delegate = self
  
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler:{ granted , error in
            
            self.permissionControl = granted
            
        }
        )
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonNext(_ sender: Any) {
   
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            
            self.performSegue(withIdentifier: "toOrderTrackingPage", sender: nil)
         
            self.delegate?.deleteCart()
        
            if permissionControl
            {
                let content = UNMutableNotificationContent()
                content.title = "FoodEr"
                content.subtitle = "Your order is ready"
                content.body = "The curier is on the way"
                content.badge = 1
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger (timeInterval: 10, repeats: false)
                let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
                
            }
        }
        
    }
    
    
}
extension OrderDetailVC : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound,.badge])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Notif clicked")
        
        let app = UIApplication.shared
        app.applicationIconBadgeNumber = 0
        if  app.applicationState == .active
        {
            print("active")
        }
        else
        {
            print("passive")
        }
        completionHandler()
    }
}

