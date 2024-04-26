//
//  LoginPresenter.swift
//  FIrebaseSignin
//
//  Created by pero on 2024/04/26.
//

protocol LoginPresenterInput {
    func login(email: String, password: String)
}

protocol LoginPresenterOutput {
    func showLoginSuccess()
    func showLoginFailure(error: Error)
}

class LoginPresenter {
    weak var view: ViewController?
    
    init(view: ViewController) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenterInput {
    func login(email: String, password: String) {
        AuthManager.shared.login(email: email, password: password) { [weak self] success, error in
            if success {
                // ログイン成功時の処理
                self?.view?.showLoginSuccess()
            } else {
                // ログイン失敗時の処理
                if let error = error {
                    self?.view?.showLoginFailure(error: error)
                }
            }
        }
    }
}


