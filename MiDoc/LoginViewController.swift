//
//  LoginViewController.swift
//  MiDoc
//
//  Created by leon on 11/28/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var usuarioInput: UITextField!
    @IBOutlet weak var contrasenaInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func ingresarTapped(_ sender: Any) {
        let username = usuarioInput.text
        let pass = contrasenaInput.text
        if username != "" {
            if pass != "" {
                Auth.auth().signIn(withEmail: username!, password: pass!, completion: {(user,error) in
                    if error  != nil {
                        let alert = UIAlertController(title: "Credenciales incorrectas", message: "O tu usuario o tu contrasena son incorrectas, vuelve a intentarlo :)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }else{
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }
        }
    }
    
    

}
