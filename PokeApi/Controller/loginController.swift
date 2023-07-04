//
//  loginController.swift
//  PokeApi
//
//  Created by Admin on 03/07/23.
//

import UIKit
import LocalAuthentication
import KeychainAccess

class loginController: UIViewController {

    @IBOutlet weak var lblUsername: UITextField!
    
    @IBOutlet weak var lblpASSWORD: UITextField!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var btnAutenticar: UIButton!
    
    @IBOutlet weak var btnIngresar: UIButton!
    
    @IBOutlet weak var lblVacio: UILabel!
    
    var loginamostrar : [Login] = []
    var pokemonviewmodel = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnIngresar.isHidden = true
    }
    
    @IBAction func btnInsertar(_ sender: Any) {
        
        guard lblUsername.text != "" || lblpASSWORD.text != "" else {
               lblVacio.text =  "No dejar campos vacios"
               lblUsername.layer.borderColor = UIColor.red.cgColor
               lblUsername.layer.borderWidth = 2
               lblpASSWORD.layer.borderColor = UIColor.red.cgColor
               lblpASSWORD.layer.borderWidth = 2
               return
           }
        let usernamekeychain = lblUsername.text
        let passwordkeychain = lblpASSWORD.text
        
        let keychain = Keychain(service: "PokeApi")
        keychain["Text-1"] = usernamekeychain
        keychain["Text-2"] = passwordkeychain
        
//        var user = LoginPokemon()
//
//
//        user.username = lblUsername.text!
//        user.password = lblpASSWORD.text!
//
//        let result = pokemonviewmodel.Add(user)
//        if result.Correct!{
        if lblUsername.text != "" {
            let alert = UIAlertController(title: "Aviso", message: "Usuario agregado correctamente", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.dismiss(animated: true)
            })
            
            alert.addAction(action)
            self.present(alert, animated: true)
            print("usuario agregado")
            lblUsername.text = ""
            lblpASSWORD.text = ""
        }
        else{
            let alert = UIAlertController(title: "Aviso", message: "Error al agregar al usuario", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.dismiss(animated: true)
            })
            
            alert.addAction(action)
            self.present(alert, animated: true)
            print("Error al agregar usuario")
        }
    }
    
    
    
    @IBAction func btnAutenticar(_ sender: Any) {
        biometrics()
    
    }
    
    @IBAction func btnIngresar(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueInicioSesion", sender: self)
    }
    
    
    func biometrics() {
        let contexto = LAContext()
        var error : NSError? = nil
        if contexto.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reasen = "Autorizo inicio con FaceID"
            contexto.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasen) {
                succes, error in
                DispatchQueue.main.async { [self] in
                    guard succes, error == nil else {
                        
                        print("No se detectó rostro")
                        return
                    }
                    let keychain = Keychain(service: "PokeApi")
                    lblUsername.text = keychain["Text-1"]
                    lblpASSWORD.text = keychain["Text-2"]
                    
                    btnIngresar.isHidden = false
                    btnAdd.isHidden = true
                    btnAutenticar.isHidden = true

                }
            }
        }else{
            print("Error de autenticación")
        }
        
    }
}

