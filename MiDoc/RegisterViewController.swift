//
//  RegisterViewController.swift
//  MiDoc
//
//  Created by leon on 11/28/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {

    
    @IBOutlet weak var newUsernameInput: UITextField!
    
    @IBOutlet weak var newPasswordInput: UITextField!
    
    
    @IBOutlet weak var newPasswordConfirmInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func crearCuentaTapped(_ sender: Any) {
        let username = newUsernameInput.text!
        let password = newPasswordInput.text!
        let confirm = newPasswordConfirmInput.text!
        if username != "" && password != "" && confirm != "" {
            if password != confirm {
                let alert = UIAlertController(title: "Crear usuario", message: "Las contrasenas no coinciden, vuelve a intentarlo :)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                Auth.auth().createUser(withEmail: username, password: password, completion: {(user, error) in
                    if error != nil {
                        let alert = UIAlertController(title: "Crear usuario", message: "Ocurrio un error al crear tu cuenta, vuelve a intentarlo mas tarde :)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }else{
                        let alert = UIAlertController(title: "Operacion exitosa", message: "Te damos la bienvenida a MiDoc, ahora puedes ingresar a tu cuenta :)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        self.performSegue(withIdentifier: "resultregister", sender: nil)
                    }
                })
            }
        }else{
            let alert = UIAlertController(title: "Crear usuario", message: "Todos los campos son obligatorios, vuelve a intentarlo :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func cancelarTapped(_ sender: Any) {
        performSegue(withIdentifier: "resultregister", sender: nil)
    }
    
}
