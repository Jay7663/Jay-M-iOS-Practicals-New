//
//  LogInPresenter.swift
//  IOS Practicals New
//
//  Created by Modhawadiya Jay on 12/04/22.
//

import Foundation

protocol LogInResponse {
    func logInSuccess(message: String)
    func logInFailed(message: String)
} // End of Protocol

class LogInPresenter {
    
    // MARK: - Variables
    var logInResponse: LogInResponse?
    var email: String?
    var password: String?
    
    // MARK: - Initializer
    init(view: LogInResponse) {
        self.logInResponse = view
    }
    
    // MARK: - Functions
    func doLogIn() {
        if (email == "jay@gmail.com" && password == "jay123") {
            self.logInResponse?.logInSuccess(message: "Log In Success !!!")
        } else {
            self.logInResponse?.logInFailed(message: "Log In Failed !!! ")
        }
    }
    
} // End of Class

