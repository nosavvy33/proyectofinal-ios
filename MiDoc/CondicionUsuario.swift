//
//  CondicionUsuario.swift
//  MiDoc
//
//  Created by leon on 12/8/18.
//  Copyright © 2018 leon. All rights reserved.
//

import Foundation
class CondicionUsuario {
    var id : Int32 = 0
    var nombre : String
    var usuarioId : Int32
    var detalle : String
    init (id: Int32, nombre : String, usuarioId : Int32, detalle : String){
        self.id = id
        self.nombre = nombre
        self.usuarioId = usuarioId
        self.detalle = detalle
    }
}
