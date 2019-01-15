//
//  Persona.swift
//  MapSwift
//
//  Created by Jose F. Ruiz Zamora on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

class Persona{

    var NIF: String!
    var nombre: String!
    var apellido: String!
    var sueldo: Double!
    var puesto: String!
    var practicas: Bool!
    
    init(NIF: String, nombre: String, apellido: String, sueldo: Double, puesto: String, practicas: Bool){
        
        self.NIF = NIF
        self.nombre = nombre
        self.apellido = apellido
        self.sueldo = sueldo
        self.puesto = puesto
        self.practicas = practicas
        
    }
}
