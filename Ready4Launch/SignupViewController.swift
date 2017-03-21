//
//  SignupViewController.swift
//  Ready4Launch
//
//  Created by Eric Suarez on 3/20/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import UIKit
import Material
import Firebase
import DropDown

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var usernameTextField: TextField!
    @IBOutlet weak var favConsoleButton: FlatButton!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    let favConsoleDropdown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()

        favConsoleButton.contentHorizontalAlignment = .left
        favConsoleButton.setTitleColor(UIColor.black, for: .normal)
        favConsoleButton.titleLabel?.font = RobotoFont.regular(with: 13)
        favConsoleButton.setTitle("Favorite Console", for: .normal)
        favConsoleButton.setBackgroundImage(UIImage(named: "dropdown_menu"), for: .normal)
        favConsoleButton.addTarget(self, action: #selector(showOrDismissConsoles(sender:)), for: UIControlEvents.touchUpInside)
        
        favConsoleDropdown.anchorView = favConsoleButton
        favConsoleDropdown.direction = .bottom
        favConsoleDropdown.width = 100
        favConsoleDropdown.dataSource = ["Xbox One", "PS4", "Nintendo Switch", "Wii U", "Wii", "Nintendo 3DS", "PS Vita", "Xbox 360", "PS3"]
        favConsoleDropdown.selectionAction = { [unowned self] (index, item) in
            self.favConsoleButton.setTitle(item, for: .normal)
        }
        favConsoleDropdown.dismissMode = .automatic
//        favConsoleDropdown.bottomOffset = CGPoint(x: 0, y:favConsoleButton.bounds.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showOrDismissConsoles(sender: FlatButton) {
        if favConsoleDropdown.isHidden {
            favConsoleDropdown.show()
        } else {
            favConsoleDropdown.hide()
        }
    }
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        let username = self.usernameTextField.text
        let favoriteConsole = self.favConsoleButton.titleLabel?.text
        print(self.favConsoleButton.titleLabel?.text)
        let games = [String:String]()
        
        if email != "" && password != "" && username != "" && favoriteConsole != nil && favoriteConsole != "Favorite Console" {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: self.view.width/2, y: self.view.height/2, width: 75, height: 75))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            FIRAuth.auth()?.createUser(withEmail: email!, password: password!) { (user, error) in
                self.activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if error == nil  {
                    
                    FIRAuth.auth()?.signIn(withEmail: email!, password: password!, completion: { (user, error) -> Void in
                        
                        if error == nil  {
                            
                            UserDefaults.standard.setValue(user!.uid, forKey: "uid")
                            
                            let newUser: [String: Any] = [
                                "username": username!,
                                "favoriteConsole": favoriteConsole!,
                                "games": games
                            ]
                            
                            FIRDatabase.database().reference().child("users").child(user!.uid).setValue(newUser)
                            
                            //                            self.performSegueWithIdentifier("signupSegue", sender: self)
                            
                        } else {
                            self.displayAlert(title: "Error", message: "\(error)")
                        }
                    })
                    
                    
                } else {
                    self.displayAlert(title: "Error", message: "\(error)")
                }
            }
        
        } else {
            displayAlert(title: "Error", message: "Please enter an email and password")
        }
        
    }
    
    



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
