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
    
    let emailTextField = TextField()
    let passwordTextField = TextField()
    let loginButton = RaisedButton()
    let signupButton = RaisedButton()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let cwLogoImageView = UIImageView(image: UIImage(named: "cwmobile-logo"))
        let cwLogoImageView = UIImageView()
        cwLogoImageView.alpha = 0.0
        cwLogoImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 175)
        cwLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cwLogoImageView)
        
        let emailIcon = UIImageView(image: UIImage(named: "email_white"))
        emailIcon.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        emailIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailIcon)
        
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.textColor = UIColor.white
        emailTextField.detailColor = UIColor.white
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        let passwordIcon = UIImageView(image: UIImage(named: "password_white"))
        passwordIcon.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        passwordIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordIcon)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.textColor = UIColor.white
        passwordTextField.isVisibilityIconButtonEnabled = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel!.font = RobotoFont.medium(with: 18)
        loginButton.frame = CGRect(x: 0, y: 0, width: 300, height: 24)
        loginButton.backgroundColor = UIColor(red: 0/255, green: 60/255, blue: 179/255, alpha: 0.8)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        let orLabel = UILabel()
        orLabel.text = "Or"
        orLabel.font = RobotoFont.medium(with: 18)
        orLabel.textColor = UIColor.white
        orLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 24)
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(orLabel)
        
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.titleLabel!.font = RobotoFont.medium(with: 18)
        signupButton.frame = CGRect(x: 0, y: 0, width: 300, height: 24)
        signupButton.backgroundColor = UIColor(red: 0/255, green: 138/255, blue: 230/255, alpha: 0.8)
        signupButton.addTarget(self, action: #selector(goToSignup), for: .touchUpInside)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signupButton)
        
        // logo image view constraints
        let logoTopConstraint = cwLogoImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 50)
        let margins = view.layoutMarginsGuide
        let logoLeadingConstraint = cwLogoImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 12)
        let logoTrailingConstraint = cwLogoImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -12)
        
        logoTopConstraint.isActive = true
        logoLeadingConstraint.isActive = true
        logoTrailingConstraint.isActive = true
        
        // email icon constraints
        let emailIconTop = emailIcon.topAnchor.constraint(equalTo: cwLogoImageView.bottomAnchor, constant:40)
        let emailIconLeading = emailIcon.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 24)
        let emailIconHeight = emailIcon.heightAnchor.constraint(equalToConstant: 25)
        let emailIconWidth = emailIcon.widthAnchor.constraint(equalToConstant: 25)
        NSLayoutConstraint.activate([emailIconTop, emailIconLeading, emailIconHeight, emailIconWidth])
        
        // email text field constraints
        let emailTop = emailTextField.topAnchor.constraint(equalTo: cwLogoImageView.bottomAnchor, constant: 40)
        let emailLeading = emailTextField.leadingAnchor.constraint(equalTo: emailIcon.trailingAnchor, constant: 16)
        let emailTrailing = emailTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -24)
        
        emailTop.isActive = true
        emailLeading.isActive = true
        emailTrailing.isActive = true
        
        NSLayoutConstraint.activate([emailTop, emailLeading, emailTrailing])
        
        emailIcon.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor).isActive = true
        
        // password icon constraints
        let passwordIconTop = passwordIcon.topAnchor.constraint(equalTo: emailIcon.bottomAnchor, constant:40)
        let passwordIconLeading = passwordIcon.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 24)
        let passwordIconHeight = passwordIcon.heightAnchor.constraint(equalToConstant: 25)
        let passwordIconWidth = passwordIcon.widthAnchor.constraint(equalToConstant: 25)
        
        NSLayoutConstraint.activate([passwordIconTop, passwordIconLeading, passwordIconHeight, passwordIconWidth])
        
        // password text field constraints
        let passwordTop = passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40)
        let passwordLeading = passwordTextField.leadingAnchor.constraint(equalTo: passwordIcon.trailingAnchor, constant: 16)
        let passwordTrailing = passwordTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -24)
        
        NSLayoutConstraint.activate([passwordTop, passwordLeading, passwordTrailing])
        
        passwordIcon.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor).isActive = true
        
        // login button setup with constraints
        let loginTop = loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40)
        let loginCenter = loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        //        let loginHeight = loginButton.heightAnchor.constraintEqualToAnchor(nil, constant: 32)
        //        let loginWidth = loginButton.widthAnchor.constraintEqualToAnchor(nil, constant: 100)
        
        let orTop = orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40)
        let orCenter = orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        let signupTop = signupButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 40)
        let signupCenter = signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        NSLayoutConstraint.activate([loginTop, loginCenter, orTop, orCenter, signupTop, signupCenter])
        
        
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
        //self.performSegue(withIdentifier: "loginToSignup", sender: self)
    }
    
    func login(sender: AnyObject) {
        
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        
        if email != "" && password != "" {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
//            FIRAuth.auth()?.signInWithEmail(email!, password: password!, completion: { (user, error) -> Void in
//                
//                self.activityIndicator.stopAnimating()
//                UIApplication.sharedApplication().endIgnoringInteractionEvents()
//                
//                if error == nil  {
//                    NSUserDefaults.standardUserDefaults().setValue(user!.uid, forKey: "uid")
//                    
//                    self.performSegueWithIdentifier("loginSegue", sender: self)
//                    
//                } else {
//                    self.displayAlert("Error", message: "\(error)")
//                }
//            })
            
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
