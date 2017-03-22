//
//  LoginViewController.swift
//  Ready4Launch
//
//  Created by Eric Suarez on 3/20/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import UIKit
import Firebase
import Material

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var loginButton: RaisedButton!
    @IBOutlet weak var signupButton: RaisedButton!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.isVisibilityIconButtonEnabled = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel!.font = RobotoFont.medium(with: 12)
        loginButton.backgroundColor = UIColor.red
        loginButton.titleColor = UIColor.white
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.titleLabel!.font = RobotoFont.medium(with: 12)
        signupButton.backgroundColor = UIColor.red
        signupButton.titleColor = UIColor.white
        
        // Set up tap to dismiss keyboard
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields to resign the first responder status.
        view.endEditing(true)
    }
    
    func goToSignup(sender: AnyObject) {
        self.performSegue(withIdentifier: "loginToSignup", sender: self)
    }
    
    func login(sender: AnyObject) {
        
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        
        if email != "" && password != "" {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: view.width/2, y: view.height/2, width: 75, height: 75))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            FIRAuth.auth()?.signIn(withEmail: email!, password: password!) { (user, error) in
                self.activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if error == nil  {
                    UserDefaults.standard.setValue(user!.uid, forKey: "uid")
                    
                    //self.performSegueWithIdentifier("loginSegue", sender: self)
                    
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
