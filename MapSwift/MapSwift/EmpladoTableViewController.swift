//
//  ViewController.swift
//  MapSwift
//
//  Created by Jose F. Ruiz Zamora on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

var resultadoBusqueda = [Persona]()
var tiempoMap : Double = 0.0
var tiempoBucle : Double = 0.0
var empresa = [Persona]()

class EmpleadoTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inicializar()
        
        pruebas()
        
        let pr_NIF = pruebas_NIF(empresa,accion: "!=",nif: "NIF")
        print("pr_NIF = ",pr_NIF)
        let pr_sueldo = pruebas_sueldo(pr_NIF, accion: "=", sueldo: 100)
        print("pr_sueldo = ",pr_sueldo)
        let pr_practica = pruebas_practicas(pr_sueldo, accion: "no")
        print("pr_practica = ",pr_practica)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inicializar(){
        let p = Persona(NIF: "NIF",nombre: "nombre",apellido: "apellidos",sueldo: 2600,puesto: "jefazo",practicas: false)
        let p2 = Persona(NIF: "NIF2",nombre: "nombre2",apellido: "apellidos2",sueldo: 2600,puesto: "mindundi",practicas: true)
        let p3 = Persona(NIF: "NIF3",nombre: "nombre3",apellido: "apellidos3",sueldo: 100,puesto: "xd",practicas: true)
        let p4 = Persona(NIF: "NIF4",nombre: "nombre4",apellido: "apellidos4",sueldo: 600,puesto: "xd",practicas: false)
        
        empresa.append(p)
        empresa.append(p2)
        empresa.append(p3)
        empresa.append(p4)
        
        //Medir tiempos
        
        //Iterar
        let inicioIterar = NSDate()
        var coleccionIterar = [Persona]()
        for e in empresa{
            coleccionIterar.append(e)
        }
        let finIterar = NSDate()
        let diferencia = (finIterar.timeIntervalSinceDate(inicioIterar) * 1000)
        print("fin iterar = ",diferencia)
        
        //Map
        let inicioMap = NSDate()
        var coleccionMap = [Persona]()
        coleccionMap = empresa.map({$0})
        let finMap = NSDate()
        let diferencia2 = (finMap.timeIntervalSinceDate(inicioMap) * 1000)
        print("fin map = ",diferencia2)
        
        
        
        let resultCollection = empresa.map({
            (persona) -> String in
            return persona.nombre
        })
        
        print("resultado = ",resultCollection)
        
        //Mostrar todos los NIF de la empresa
        let nifCollection = empresa.map({$0.NIF})
        print("NIF = ",nifCollection)
        
        //Filtro según edad
        let filtroEdad = empresa.filter({$0.sueldo > 10 && $0.nombre == "nombre"}).map({return $0.nombre})
        print("filtro edad = ",filtroEdad)
        
        //Sumatoria
        let reduceSuma = empresa.reduce(0){(sueldoActual,sueldoSiguiente) -> Double in
            return sueldoActual+sueldoSiguiente.sueldo
        }
        print("reduce suma = ",reduceSuma)
        print("Sueldo medio = ",(reduceSuma/Double(empresa.count)))
        
        //Duplicar valor
        let duplicarSueldo = empresa.map({$0.sueldo*2})
        print("Sueldos dobles = ",duplicarSueldo)
        print("Sueldos = ",empresa.map({$0.sueldo}))
        
        //Pruebas con diccionario
        let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
        let kmToPoint = milesToPoint.map { name,miles in miles * 1.6093 }
        print("km 1 = ",milesToPoint)
        print("km 2 = ",kmToPoint)
        //Más pruebas
        let bookAmount = ["harrypotter":100.0, "junglebook":100.0]
        let returnMap = bookAmount.map{(key,value) in
            return key.capitalizedString+" xd"
        }
        print("mayúsculas = ",returnMap)
        
        //Filter en diccionario
        let filterDiccionario = bookAmount.filter{(key,value) -> Bool in
            value > 20
        }
        print("filtro diccionario 1 = ",filterDiccionario)
        //Más corto
        let filtroDiccionario2 = bookAmount.filter{$1 > 50} //$0 es key y $1 value
        print("filtro diccionario 2 = ",filtroDiccionario2)
        
        //Encadenar métodos
        //Sumar sueldos únicamente de las prácticas
        let sueldoPracticas = empresa.filter({$0.practicas == true}).map({return $0}).reduce(0){
            (sueldoActual,sueldoSiguiente)-> Double in
            return sueldoActual + sueldoSiguiente.sueldo
        }
        print("sueldo total prácticas = ",sueldoPracticas)
        
    }
    
    func pruebas(){
        //Iterar sobre los campos de texto, si es vacío se pasa al siguiente
        //con excepción de sueldo que tiene la opción de total y media
        
        //Iterar sobre todas las opciones (igual, distinto, mayor, menor, etc) de cada campo de texto
        //Cuando una iteración sea true (esté marcada) se llama al método que devuelve un map de Persona
        
        //Iterativamente se van llamando a los métodos seleccionados haciendo criba y devolviendo solo los objetos correspondientes
        
        //Para la sumatoria y la media:
        //La sumatoria es el penúltimo método a llamar y la media el último; ya que se necesita realizar todos los filtros anteriores
        //además que la media utiliza la sumatoria / array.count
        
    }
    
    func pruebas_NIF( entrada:[Persona], accion: String, nif: String) -> [Persona]{
        //NIF igual a nif de entrada: devuelve array de objetos personas que coincida
        
        var filtroNIF:[Persona]
        
        if(accion == "="){
            filtroNIF = entrada.filter({$0.NIF == nif}).map({return $0})
            //Filtro contains
            //filtroNIF = entrada.filter({$0.NIF.containsString("NIF")}).map({return $0})
        }else{
            //Accion = !=
            filtroNIF = entrada.filter({$0.NIF != nif}).map({return $0})
            
        }
        
        return filtroNIF
    }
    
    func pruebas_nombre(entrada:[Persona],accion: String, nombre:String) -> [Persona]{
        var filtroNombre:[Persona]
        if(accion == "="){
            filtroNombre = entrada.filter({$0.nombre == nombre}).map({return $0})
        }else if(accion == "!="){
            filtroNombre = entrada.filter({$0.nombre != nombre}).map({return $0})
        }else if(accion == "contenga"){
            filtroNombre = entrada.filter({$0.nombre.containsString(nombre)}).map({return $0})
        }else{
            //accion = no contenga
            filtroNombre = entrada.filter({!$0.nombre.containsString(nombre)}).map({return $0})
        }
        
        return filtroNombre
    }
    
    func pruebas_sueldo(entrada:[Persona],accion: String, sueldo:Double) -> [Persona]{
        
        var filtroSueldo:[Persona]
        
        if(accion == "<"){
            filtroSueldo = entrada.filter({$0.sueldo < sueldo}).map({return $0})
        }else if(accion == "="){
            filtroSueldo = entrada.filter({$0.sueldo == sueldo}).map({return $0})
        }else{
            //Accion = >
            filtroSueldo = entrada.filter({$0.sueldo > sueldo}).map({return $0})
        }
        return filtroSueldo
    }
    
    func pruebas_practicas(entrada:[Persona],accion: String) -> [Persona]{
        var filtroPracticas: [Persona]
        
        if (accion == "si"){
            filtroPracticas = entrada.filter({$0.practicas == true}).map({return $0})
        }else{
            //accion == no
            filtroPracticas = entrada.filter({$0.practicas == false}).map({return $0})
        }
        
        return filtroPracticas
    }
    
    
}
