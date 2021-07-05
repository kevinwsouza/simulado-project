//
//  LoginViewController.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 29/06/21.
//

import Foundation
import SwiftUI

class LoginViewController: UIViewController {
        
    var baseView: LoginView
    var viewModel: LoginViewModel
    var activeTextField : UITextField? = nil
    
// MARK: - init view
    
    required init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        self.baseView = LoginView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Life cycle
extension LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setup()

        baseView.textfieldUsername.autocorrectionType = .no
        baseView.textfieldPassword.autocorrectionType = .no
        
        baseView.textfieldUsername.delegate = self
        baseView.textfieldPassword.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.baseView.endEditing(true)
    }
}
//MARK: - Actions

extension LoginViewController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardsize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        var shouldMoveViewUp = false
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyBoard = self.baseView.frame.height - keyboardsize.height
            if bottomOfTextField > topOfKeyBoard {
                shouldMoveViewUp = true
            }
        }
        if(shouldMoveViewUp) {
            self.baseView.frame.origin.y = 0 - keyboardsize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.baseView.frame.origin.y = 0
    }
    
    @objc func btLogin() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            EventsCoordinator(navigationController: navigationController).start()
        }
    }
}

//MARK: - View Codable
extension LoginViewController: ViewCodable {
    func viewSetup() {
        baseView.buttonLogin.addTarget(self, action: #selector(btLogin), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func constraintsSetup() {
        view.addSubview(baseView)
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        baseView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    }
//MARK: - tag textfield
    
    extension LoginViewController : UITextFieldDelegate {
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.activeTextField = textField
        }
        
        func textFieldDidEndEditing(_ textfield: UITextField) {
            self.activeTextField = nil
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case baseView.textfieldUsername:
                baseView.textfieldPassword.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
            return false
        }
    }
