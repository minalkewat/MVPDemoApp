//
//  ViewController.swift
//  MVCDemoApp
//
//  Created by Meenal Kewat on 6/11/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit

class ViewController: UIViewController,VCDelegate,UITextFieldDelegate {
    
    

    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var presenter:VCPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        msgLbl.isHidden = true
        presenter = VCPresenter()
        presenter.delegate = self
        userTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
        self.msgLbl.isHidden = true
        presenter.validateData(username: userTextField.text!, password: passwordTextField.text!)
    }
    
    
    //MARK :- Presenter Delegate Method
    func showMessage(message: String) {
        self.msgLbl.isHidden = false
        self.msgLbl.text = message
        self.msgLbl.textColor = UIColor.red
    }
    
    func userSuccessfullyLoggedIn() {
        print("name is: \(presenter.username)")
        print("email is: \(presenter.email)")
        print("gender is: \(presenter.gender)")
         self.msgLbl.isHidden = false
        self.msgLbl.text = "User LoggedIn"
        self.msgLbl.textColor = .green
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    

}

