//
//  MedicinasTableViewController.swift
//  MiDoc
//
//  Created by leon on 11/27/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit
struct Med{
    let nombre: String!
    let cantidad: String!
    let descripcion: String!
    let tipo: MedicinaTipo!
    let urgencia: UrgenciaEnum!
    let hora: String!
}
class MedicinasTableViewController: UITableViewController {

    var arrayMed = [Med]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayMed = [Med(nombre: "Panadol", cantidad: "500 mg", descripcion: "Pastilla contra la fiebre", tipo: MedicinaTipo.pill, urgencia: UrgenciaEnum.high, hora: "2 horas aprox."),Med(nombre: "Panadol", cantidad: "500 mg", descripcion: "Pastilla contra la fiebre", tipo: MedicinaTipo.pill, urgencia: UrgenciaEnum.high, hora: "2 horas aprox."),Med(nombre: "Panadol", cantidad: "500 mg", descripcion: "Pastilla contra la fiebre", tipo: MedicinaTipo.pill, urgencia: UrgenciaEnum.high, hora: "2 horas aprox."),Med(nombre: "Panadol", cantidad: "500 mg", descripcion: "Pastilla contra la fiebre", tipo: MedicinaTipo.pill, urgencia: UrgenciaEnum.high, hora: "2 horas aprox."),Med(nombre: "Panadol", cantidad: "500 mg", descripcion: "Pastilla contra la fiebre", tipo: MedicinaTipo.pill, urgencia: UrgenciaEnum.high, hora: "2 horas aprox."),Med(nombre: "Panadol", cantidad: "500 mg", descripcion: "Pastilla contra la fiebre", tipo: MedicinaTipo.pill, urgencia: UrgenciaEnum.high, hora: "2 horas aprox."),Med(nombre: "Panadol", cantidad: "500 mg", descripcion: "Pastilla contra la fiebre", tipo: MedicinaTipo.pill, urgencia: UrgenciaEnum.high, hora: "2 horas aprox.")]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMed.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        cell.layer.cornerRadius = 14
        cell.layoutMargins = UIEdgeInsets(top: 25, left: 20, bottom: 25, right: 20)
        
        let x : MedicinaTipo = arrayMed[indexPath.row].tipo
        switch x{
        case .pill:
            cell.tipoMedImage.image = #imageLiteral(resourceName: "pill_red")
        case .needle:
            cell.tipoMedImage.image = #imageLiteral(resourceName: "needle_red")
        case .syrup:
            cell.tipoMedImage.image = #imageLiteral(resourceName: "syrup_red")
            
        }
        
        cell.medNombreTitle.text = arrayMed[indexPath.row].nombre
        cell.PANombreTitle.text = arrayMed[indexPath.row].cantidad
        cell.proxTomaTitle.text = arrayMed[indexPath.row].hora
        cell.descripcionTitle.text = arrayMed[indexPath.row].descripcion
        
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 8, height: 8)
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        
        createLateralTag(urgencia: arrayMed[indexPath.row].urgencia, cell: cell)
        return cell
        
    }
    
    func createLateralTag(urgencia : UrgenciaEnum, cell: CustomTableViewCell){
        let customTag = UIView()
        switch urgencia {
        case .high:
            customTag.backgroundColor = UIColor.red
        case .medium:
            customTag.backgroundColor = UIColor.yellow
        case .low:
            customTag.backgroundColor = UIColor.green
        }
        customTag.frame = CGRect(x: 0, y: 0, width: 20, height: 135)
        cell.addSubview(customTag)
        
        self.roundCorners(view: customTag, corners: [.bottomLeft, .topLeft], radius: 10.0)
        customTag.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
        customTag.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        customTag.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = false
    }
    
    
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
   

}
