//
//  AuthViewController.swift
//  Telegram Music
//
//  Created by Ismatulla Mansurov on 1/8/22.
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var PhoneView: UIView!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var CodeView: UIView!
    @IBOutlet weak var CodeTextField: UITextField!
    @IBOutlet weak var PasswordView: UIView!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - Private properties
    
    private var authService = ServiceLayer.instance.authService
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService.delegate = self
        ServiceLayer.instance.telegramService.run()
        
        PhoneView.isHidden = true
        CodeView.isHidden = true
        PasswordView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    
    // MARK: - Actions
    
    @IBAction func sendPhone(_ sender: Any) {
        guard let phone = PhoneTextField.text else { return }
        authService.sendPhone(phone)
    }

    @IBAction func sendCode(_ sender: Any) {
        guard let code = CodeTextField.text else { return }
        authService.sendCode(code)
    }

   
    @IBAction func sendPassword(_ sender: Any) {
        guard let passwd = PasswordTextField.text else { return }
        authService.sendPassword(passwd)
    }
}


extension AuthViewController: AuthServiceDelegate {
    
    func waitPhoneNumer() {
        PhoneView.isHidden = false
        CodeView.isHidden = true
        PasswordView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func waitCode() {
        PhoneView.isHidden = true
        CodeView.isHidden = false
        PasswordView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func waitPassword() {
        PhoneView.isHidden = true
        CodeView.isHidden = true
        PasswordView.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func onReady() {
        ApplicationController.showMain()
    }
    
    func onError(_ error: Swift.Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
