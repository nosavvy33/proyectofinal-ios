//
//  AnadirCondicionViewController.swift
//  MiDoc
//
//  Created by leon on 12/8/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit
import Alamofire
import DropDown
struct Condicion : Decodable{
    let id: Int32
    let nombre: String
}
class AnadirCondicionViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet weak var searchBarCondicion: UISearchBar!
    var condicionDropDown = DropDown()
    var arrayCondiciones : [Condicion] = []
    var dataCondicionesFiltered : [Condicion] = []
    
    
    @IBOutlet weak var detallesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarCondicion.delegate = self
        condicionDropDown.anchorView = searchBarCondicion
        condicionDropDown.bottomOffset = CGPoint(x: 0, y: (condicionDropDown.anchorView?.plainView.bounds.height)!)
        condicionDropDown.backgroundColor = .white
        condicionDropDown.direction = .bottom
        condicionDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.searchBarCondicion.text = item
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getCondiciones()
    }
    
    
    @IBAction func anadirButtonTapped(_ sender: Any) {
        let txtNombre = searchBarCondicion.text
        let txtDetalle = detallesTextField.text
        if txtNombre == ""{
            let alertaVC = UIAlertController(title: "Error", message: "El campo de condicion es obligatorio", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            alertaVC.addAction(okAction)
            self.present(alertaVC, animated: true, completion: nil)
        }else{
            guardarCondicionUsuario(usuarioid: 1, nombre: txtNombre!, detalle: txtDetalle)
            performSegue(withIdentifier: "condicioncreated", sender: nil)
        }
    }
    
    
    func getCondiciones (){
        Alamofire.request("https://api.jsonbin.io/b/5c0be47fc10055104caa0776").responseJSON(completionHandler: {(responseObject) in
            if responseObject.result.isSuccess{
                do{
                self.arrayCondiciones = try JSONDecoder().decode([Condicion].self, from: responseObject.data!)
                    self.dataCondicionesFiltered = self.arrayCondiciones
                }catch let err{
                    print(err)
                }
            }
            if responseObject.result.isFailure {
                let error : NSError = responseObject.result.error! as NSError
                print(error)
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            dataCondicionesFiltered = searchText.isEmpty ? self.arrayCondiciones : self.arrayCondiciones.filter({ (dat) -> Bool in
                dat.nombre.range(of: searchText, options: .caseInsensitive) != nil
            })
            
        condicionDropDown.dataSource = dataCondicionesFiltered.map({
            (val: Condicion) -> String in
            return val.nombre
        })
            condicionDropDown.show()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBarCondicion.setShowsCancelButton(true, animated: true)
        for ob: UIView in ((searchBar.subviews[0] )).subviews {
            if let z = ob as? UIButton {
                let btn: UIButton = z
                btn.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBarCondicion.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarCondicion.resignFirstResponder()
        searchBarCondicion.text = ""
        dataCondicionesFiltered = self.arrayCondiciones
        condicionDropDown.hide()
    }

}
