//
//  ViewController.swift
//  MapSwift
//
//  Created by Jose F. Ruiz Zamora on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

var resultadoBusqueda = [Persona]()
var resultadoBusquedaString = [String]()
var tiempoMap : Double = 0.0
var tiempoBucle : Double = 0.0
var tiempoStringMap : Double = 0.0
var tiempoStringBucle : Double = 0.0
var empresa = [Persona]()
var empresaIterar = [Persona]()
var mediaSeleccionada = false
var totalSeleccionado = false
var mostrarNombreSeleccionado = false
var sueldoTotalMap : Double = 0.0
var sueldoTotalIterativo : Double = 0.0
var sueldoMedioMap : Double = 0.0
var sueldoMedioIterativo : Double = 0.0
var tamFinal : Int = 0
var arrayMedia = [Double]()
var resultadosPruebas = false

class EmpleadoTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        inicializar()
        
        
        if(resultadosPruebas){
            let tamanios = [1,10,100,500,1000,10000,100000,1000000]
            for n in tamanios{
                tamFinal = n
                let prueba = Pruebas()
                prueba.inicializar()
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inicializar(){
        
        print("Pruebas con tamaño = ",String(tamFinal))
        
        //Crear personas aleatorias en la empresa
        
        //Tres prototipos de personas: Jefe - empleado - becario
        
        //Generar X personas de forma aleatoria: 1 = jefe, 2 = empleado 3 = becario
        
        var numNif = 1
        var numNombreJefe = 1
        var numNombreEmpleado = 1
        var numNombreBecario = 1
        for _ in 0...500{
            let n = Int(arc4random_uniform(UInt32(101-1))+UInt32(1))
            var p: Persona!
            if(n < 10){
                //Crear jefe
                p = Persona(NIF: "NIF"+String(numNif),nombre: "Jefe"+String(numNombreJefe),apellido: "jefazo",sueldo: 2600,puesto: "jefazo",practicas: false)
                numNombreJefe+=1
            }else if(n < 75){
                //Crear empleado
                p = Persona(NIF: "NIF"+String(numNif),nombre: "Empleado"+String(numNombreEmpleado),apellido: "currante",sueldo: 1200,puesto: "empleado",practicas: false)
                //Incrementar o no el contador (para que haya personas que se llamen igual)
                let r = Int(arc4random_uniform(UInt32(5-1))+UInt32(1))
                // 25% de que se repita un nombre
                if(r != 1){
                    numNombreEmpleado+=1
                }
            }else{
                //Crear becario
                p = Persona(NIF: "NIF"+String(numNif),nombre: "Becario"+String(numNombreBecario),apellido: "beca",sueldo: 800,puesto: "becario",practicas: true)
                let r = Int(arc4random_uniform(UInt32(5-1))+UInt32(1))
                // 25% de que se repita un nombre
                if(r != 1){
                    numNombreBecario+=1
                }
            }
            empresa.append(p)
            numNif+=1
        }
        
        for p in empresa{
            let persona = Persona(NIF:p.NIF,nombre:p.nombre,apellido:p.apellido
                ,sueldo:p.sueldo,puesto:p.puesto,practicas: p.practicas)
            empresaIterar.append(persona)
        }
        
        //Medir tiempos
        arrayMedia = [Double]()
        for _ in 0...10{
            //Iterar
            let inicioIterar = NSDate()
            var coleccionIterar = [Persona]()
            for e in empresaIterar{
                coleccionIterar.append(e)
            }
            let finIterar = NSDate()
            let diferencia = (finIterar.timeIntervalSinceDate(inicioIterar) * 1000)
            arrayMedia.append(diferencia)
        }
        
        print("Tiempo iterativo para insertar = ",hacer_media())
        
        arrayMedia = [Double]()
        for _ in 0...10{
            //Map
            let inicioMap = NSDate()
            let _ = empresa.map({$0})
            let finMap = NSDate()
            let diferencia2 = (finMap.timeIntervalSinceDate(inicioMap) * 1000)
            arrayMedia.append(diferencia2)
        }
        
        print("Tiempo mapa para insertar = ",hacer_media())

        
    }
    
    func hacer_media() -> Double{
        var n : Double = 0.0
        for d in arrayMedia{
            n+=d
        }
        
        return n/Double(arrayMedia.count)
    }
    
        
}
