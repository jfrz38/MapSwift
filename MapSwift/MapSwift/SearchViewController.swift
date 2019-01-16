//
//  SerachViewController.swift
//  MapSwift
//
//  Created by Aula11 on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var nifIgual = false
    var nifNoIgual = false
    var sueldoMayor = false
    var sueldoMenor = false
    var sueldoIgual = false
    var becarioSi = false
    var becarioNo = false
    var nombreIgual = false
    var nombreNoIgual = false
    var getSueldoTotal = false
    var getSueldoMedio = false
    var opciones = [Bool]()
    var nifInsertado: String!
    var sueldoInsertado: Double!
    var nombreInsertado: String!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        opciones.append(nifIgual)
        opciones.append(nifNoIgual)
        opciones.append(sueldoMayor)
        opciones.append(sueldoMenor)
        opciones.append(sueldoIgual)
        opciones.append(becarioSi)
        opciones.append(becarioNo)
        opciones.append(nombreIgual)
        opciones.append(nombreNoIgual)
        
    }
    
    //Mark: properties
    
    @IBOutlet weak var nifTxt: UITextField!
    
    @IBOutlet weak var sueldoTxt: UITextField!
    
    @IBOutlet weak var nombreTxt: UITextField!
    
    
    //Mark: functions

    @IBAction func nifIgual(sender: UIButton) {
        nifIgual = true
        nifNoIgual = false
    }

    @IBAction func nifDistinto(sender: UIButton) {
        nifIgual = false
        nifNoIgual = true
    }

    @IBAction func sueldoMenor(sender: UIButton) {
        sueldoMenor = true
        sueldoIgual = false
        sueldoMayor = false
    }
    
    @IBAction func sueldoIgual(sender: UIButton) {
        sueldoMenor = false
        sueldoIgual = true
        sueldoMayor = false
    }
    
    @IBAction func sueldoMayor(sender: UIButton) {
        sueldoMenor = false
        sueldoIgual = false
        sueldoMayor = true
    }
    
    @IBAction func esBecario(sender: UIButton) {
        becarioSi = true
        becarioNo = false
    }
    
    @IBAction func noEsBecario(sender: UIButton) {
        becarioSi = false
        becarioNo = true
    }
    
    @IBAction func nombreIgual(sender: UIButton) {
        nombreIgual = true
        nombreNoIgual = false
    }
    
    @IBAction func nombreDistinto(sender: UIButton) {
        nombreIgual = false
        nombreNoIgual = true
    }

    //Pulsar la lupa para realizar búsqueda
    func busqueda(){
        var resultadosBusqueda = empresa
        
        var i = 0
        for _ in opciones{
            if(opciones[i]==true){
             resultadosBusqueda = metodoPorPosicion(i,entrada: resultadosBusqueda)
            }
            i+=1
        }
        
        /*
 
         //Sumatoria
         let reduceSuma = empresa.reduce(0){(sueldoActual,sueldoSiguiente) -> Double in
         return sueldoActual+sueldoSiguiente.sueldo
         }
         print("reduce suma = ",reduceSuma)
         print("Sueldo medio = ",(reduceSuma/Double(empresa.count)))
 */
        
        if(getSueldoTotal || getSueldoMedio){
            //Calcular sueldo medio o total de la opción elegida
            //Se realiza en el mismo if porque para calcular la media se necesita el total
            let resultadoFinal = resultadosBusqueda.reduce(0){(sueldoActual,sueldoSiguiente) -> Double in
                return sueldoActual+sueldoSiguiente.sueldo
            }
            
            let sueldoMedio = resultadoFinal/Double(resultadosBusqueda.count)
            
        }
        
    }
    
    //Accede al método según la posición que esté true
    func metodoPorPosicion(pos:Int, entrada:[Persona]) -> [Persona]{
        
        switch pos {
        case 0:
            //NIF igual
            return filtro_NIF(entrada,accion: "=",nif: nifInsertado)
        case 1:
            //NIF no igual
            return filtro_NIF(entrada,accion: "!=",nif: nifInsertado)
        case 2:
            //Sueldo mayor
            return filtro_sueldo(entrada, accion: ">", sueldo: sueldoInsertado)
        case 3:
            //Sueldo menor
            return filtro_sueldo(entrada, accion: "<", sueldo: sueldoInsertado)
        case 4:
            //Sueldo igual
            return filtro_sueldo(entrada, accion: "=", sueldo: sueldoInsertado)
        case 5:
            //Becario
            return filtro_practicas(entrada,accion: true)
        case 6:
            //No becario
            return filtro_practicas(entrada,accion: false)
        case 7:
            //Nombre igual
            return filtro_nombre(entrada,accion: "=",nombre: nombreInsertado)
        case 8:
            //Nombre no igual
            return filtro_nombre(entrada,accion: "!=",nombre: nombreInsertado)
        default:
            print("error")
            return entrada
        }
        
    }
    //Realiza la búsqueda utilizando Map
    func busquedaMap(){
        
    }
    
    //Utiliza la búsqueda iterativamente
    func busquedaBucle(){
        
    }
    
    func filtro_NIF( entrada:[Persona], accion: String, nif: String) -> [Persona]{
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
    
    func filtro_sueldo(entrada:[Persona],accion: String, sueldo:Double) -> [Persona]{
        
        var filtroSueldo:[Persona]
        
        if(accion == "<"){
            filtroSueldo = entrada.filter({$0.sueldo < sueldo}).map({return $0})
        }else if(accion == "="){
            filtroSueldo = entrada.filter({$0.sueldo == sueldo}).map({return $0})
        }else{
            //Accion: >
            filtroSueldo = entrada.filter({$0.sueldo > sueldo}).map({return $0})
        }
        return filtroSueldo
    }
    
    func filtro_practicas(entrada:[Persona],accion: Bool) -> [Persona]{
        var filtroPracticas: [Persona]
        
        if (accion){
            filtroPracticas = entrada.filter({$0.practicas == true}).map({return $0})
        }else{
            //accion == false
            filtroPracticas = entrada.filter({$0.practicas == false}).map({return $0})
        }
        
        return filtroPracticas
    }

    
    func filtro_nombre(entrada:[Persona],accion: String, nombre:String) -> [Persona]{
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
    
    
}
