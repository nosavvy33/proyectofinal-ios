//
//  FuncionesCoreData.swift
//  MiDoc
//
//  Created by leon on 12/8/18.
//  Copyright © 2018 leon. All rights reserved.
//

import Foundation
import Alamofire
import CoreData


func guardarCondicionUsuario(usuarioid: Int32, nombre: String, detalle: String?) {
    var condicionUsuarioList : [NSManagedObject] = []
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    let entity =
        NSEntityDescription.entity(forEntityName: "CondicionUsuario",
                                   in: managedContext)!
    
    let cond = NSManagedObject(entity: entity,
                               insertInto: managedContext)
    
    let condicionid = obtenerCondiciones().count
    cond.setValue(nombre, forKey: "nombre")
    cond.setValue(usuarioid, forKey: "usuarioid")
    cond.setValue(detalle, forKey: "detalle")
    cond.setValue(condicionid, forKey: "id" )
    do {
        try managedContext.save()
        condicionUsuarioList.append(cond)
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

func obtenerCondiciones() -> [CondicionUsuario]{
    var condicionesList : [CondicionUsuario] = []
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return []
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    //2
    let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "CondicionUsuario")
    
    //3
    do {
        condicionesList = try managedContext.fetch(fetchRequest) as! [CondicionUsuario]
    /*    condicionesList.map({
            (val: CondicionUsuario) in
            print(val.nombre!+" "+val.detalle!)
        })*/
        return condicionesList
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
    return []
}

func eliminarCondicion(cond : CondicionUsuario){
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    managedContext.delete(cond as! NSManagedObject)
    
    //3
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}
