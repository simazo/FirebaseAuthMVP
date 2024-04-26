//
//  ViewController.swift
//  FirebaseAuthMVP
//
//  Created by pero on 2024/04/26.
//

import UIKit

class ViewController: UIViewController {

    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    let button = UIButton()
    
    private var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initText()
        initButton()
        
        presenter = LoginPresenter(view: self)
    }

    @objc  func buttonTapped(sender : Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            presenter.login(email: email, password: password)
        }
    }
    
    private func initButton(){
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        
        // 位置とサイズ
        button.frame = CGRect(x:screenWidth/4, y:screenHeight/2,
                              width:screenWidth/2, height:60)
        // タイトル
        button.setTitle("ボタン", for:UIControl.State.normal)
        
        // フォントサイズ
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 20)
        
        // 背景色
        button.backgroundColor = UIColor.orange
        
        // タップされたときの処理
        button.addTarget(self,
                         action: #selector(ViewController.buttonTapped(sender:)),
                         for: .touchUpInside)
        
        // Viewにボタンを追加
        self.view.addSubview(button)
    }
    
    private func initText(){
        emailTextField = UITextField(frame: CGRect(x: 20, y: 100, width: 280, height: 40))
        emailTextField.placeholder = "email"
        emailTextField.borderStyle = .roundedRect
        self.view.addSubview(emailTextField)
        
        passwordTextField = UITextField(frame: CGRect(x: 20, y: 180, width: 280, height: 40))
        passwordTextField.placeholder = "password"
        passwordTextField.borderStyle = .roundedRect
        self.view.addSubview(passwordTextField)
    }

}

extension ViewController: LoginPresenterOutput {
    func showLoginSuccess() {
        print("ログイン成功しました")
    }
    
    func showLoginFailure(error: Error) {
        print("ログイン失敗: \(error.localizedDescription)")
    }
}
