//
//  LoginController.swift
//  DavidHawk
//
//  Created by Pankaj Bhardwaj on 04/06/19.
//  Copyright © 2019 Pankaj Bhardwaj. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: NSObjectProtocol
{
    func successLoggedIn(viewModel: LoginModel.Fetch.ViewModel)
    func errorLoggedIn(viewModel: LoginModel.Fetch.ViewModel)
}

class LoginController: UIViewController, LoginDisplayLogic
{
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    @IBOutlet weak var emailTextField: FloatLabelTextField!
    @IBOutlet weak var passwordTextField: FloatLabelTextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func initializeUI()
    {
        emailTextField.placeholder = "Email Id/Mobile"
        passwordTextField.placeholder = "Password"
    }
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad(){
        super.viewDidLoad()
        initializeUI()
    }
    
    func successLoggedIn(viewModel: LoginModel.Fetch.ViewModel) {
        // SuccessfullyLogged in
        // Navigate to Next Screen
        router?.changeRootController()
    }
    
    func errorLoggedIn(viewModel: LoginModel.Fetch.ViewModel) {
        print(viewModel.profile?.name ?? "Error")
    }
    
    @IBAction func forgetPasswordClicked(_ sender: Any) {
    }
    @IBAction func loginClicked(_ sender: Any) {
        interactor?.loginRequestInitiated(request: LoginModel.Fetch.Request(emailId: "abc@gmail.com", password: "123456"))
        
    }
    @IBAction func signupClicked(_ sender: Any) {
    }
}


