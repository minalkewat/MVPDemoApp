//
//  VCPresenter.swift
//  MVCDemoApp
//
//  Created by Meenal Kewat on 6/11/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import Foundation

protocol VCDelegate {
    func showMessage(message:String)
    func userSuccessfullyLoggedIn()
}

class VCPresenter:NSObject{
    
    var delegate:VCDelegate!
    var user: User!
    
    var username:String {return user.name}
    var email:String{return user.email}
    var gender:String{return user.gender}
    
    //validate data
    func validateData(username:String, password:String){
        if username.count != 0{
            
            if password.count != 0 {
                verifyUser(username: username, password: password)
            }else{
                delegate.showMessage(message: "Password can not be empty")
            }
            
        }else{
            delegate.showMessage(message: "Username can not be empty")
        }
    }
    
    //verify user
    
    func verifyUser(username:String, password:String){
        if username == "minal" && password == "rahul"{
             user = User(name: "minal", email: "minal@gmail.com", gender: "female")
            delegate.userSuccessfullyLoggedIn()
        }else{
            delegate.showMessage(message: "Please Enter valid Username and Password")
        }
    }
    
    
}
