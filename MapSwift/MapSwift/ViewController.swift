//
//  ViewController.swift
//  MapSwift
//
//  Created by Jose F. Ruiz Zamora on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var empresa = [Persona]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inicializar()
        
        var r = empresa.map({$0.sueldo + 2})
        var sueldo = empresa.map({$0.sueldo})
        //var r2 = sueldo.reduce(0,combine:+)
        for p in empresa{
            print(p.sueldo)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inicializar(){
        let p = Persona(NIF: "NIF",nombre: "nombre",apellido: "apellidos",sueldo: 2600,puesto: "jefazo",practicas: false)
        let p2 = Persona(NIF: "NIF2",nombre: "nombre2",apellido: "apellidos2",sueldo: 2600,puesto: "mindundi",practicas: true)
        print("aa = ",p.NIF," bb = ",p2.NIF)
        
        empresa.append(p)
        empresa.append(p2)
        
    }


}

