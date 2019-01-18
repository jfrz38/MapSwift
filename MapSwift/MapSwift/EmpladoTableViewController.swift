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
var tiempoStringMap : Double = 0.0
var tiempoStringBucle : Double = 0.0
var empresa = [Persona]()
var empresaIterar = [Persona]()
var mediaSeleccionada = false
var totalSeleccionado = false
var sueldoTotalMap : Double = 0.0
var sueltoTotalIterativo : Double = 0.0

class EmpleadoTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inicializar()
        
        /*pruebas()
        
        let pr_NIF = pruebas_NIF(empresa,accion: "!=",nif: "NIF")
        print("pr_NIF = ",pr_NIF)
        let pr_sueldo = pruebas_sueldo(pr_NIF, accion: "=", sueldo: 100)
        print("pr_sueldo = ",pr_sueldo)
        let pr_practica = pruebas_practicas(pr_sueldo, accion: "no")
        print("pr_practica = ",pr_practica)
         */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inicializar(){
        
        //Crear personas aleatorias en la empresa
        
        //Tres prototipos de personas: Jefe - empleado - becario
        
        //Generar X personas de forma aleatoria: 1 = jefe, 2 = empleado 3 = becario
        
        var numNif = 1
        var numNombreJefe = 1
        var numNombreEmpleado = 1
        var numNombreBecario = 1
        for _ in 0...100000{
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
        
        /*
        let p = Persona(NIF: "NIF",nombre: "nombre",apellido: "apellidos",sueldo: 2600,puesto: "jefazo",practicas: false)
        let p2 = Persona(NIF: "NIF2",nombre: "nombre2",apellido: "apellidos2",sueldo: 2600,puesto: "mindundi",practicas: true)
        let p3 = Persona(NIF: "NIF3",nombre: "nombre3",apellido: "apellidos3",sueldo: 100,puesto: "xd",practicas: true)
        let p4 = Persona(NIF: "NIF4",nombre: "nombre4",apellido: "apellidos4",sueldo: 600,puesto: "xd",practicas: false)
        
        empresa.append(p)
        empresa.append(p2)
        empresa.append(p3)
        empresa.append(p4)
        */
        //Medir tiempos
        
        //Iterar
        let inicioIterar = NSDate()
        var coleccionIterar = [Persona]()
        for e in empresaIterar{
            coleccionIterar.append(e)
        }
        let finIterar = NSDate()
        let diferencia = (finIterar.timeIntervalSinceDate(inicioIterar) * 1000)
        print("Tiempo iterativo para insertar = ",diferencia)
        
        //Map
        let inicioMap = NSDate()
        let _ = empresa.map({$0})
        let finMap = NSDate()
        let diferencia2 = (finMap.timeIntervalSinceDate(inicioMap) * 1000)
        print("Tiempo mapa para insertar = ",diferencia2)
        
        //pruebas()
        
        pruebas2()
        pruebas3()
        
        /*let resultCollection = empresa.map({
            (persona) -> String in
            return persona.nombre
        })*/
        
        //print("Array inicial = ",empresa.map({$0.NIF}))
        
        //Mostrar todos los NIF de la empresa
        //let nifCollection = empresa.map({$0.NIF})
        //print("Todos los NIF = ",nifCollection)
        
        //Filtro edad y nombre
        //let filtroEdad = empresa.filter({$0.sueldo > 10 && $0.nombre == "nombre"}).map({return $0.nombre})
        //print("filtro edad  > 10 y nombre = nombre : ",filtroEdad)
        
        //Sumatoria
        /*
        let reduceSuma = empresa.reduce(0){(sueldoActual,sueldoSiguiente) -> Double in
            return sueldoActual+sueldoSiguiente.sueldo
        }
        print("Sueldo total = ",reduceSuma)
        print("Sueldo medio = ",(reduceSuma/Double(empresa.count)))
         */
        
        //Duplicar valor
        //let duplicarSueldo = empresa.map({$0.sueldo*2})
        //print("Sueldos dobles = ",duplicarSueldo)
        //print("Sueldos = ",empresa.map({$0.sueldo}))
        
        //Pruebas con diccionario
        /*
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
        */
        
        /*
        //Filter en diccionario
        let filterDiccionario = bookAmount.filter{(key,value) -> Bool in
            value > 20
        }
        print("filtro diccionario 1 = ",filterDiccionario)
        //Más corto
        let filtroDiccionario2 = bookAmount.filter{$1 > 50} //$0 es key y $1 value
        print("filtro diccionario 2 = ",filtroDiccionario2)
        */
        
        //Encadenar métodos
        //Sumar sueldos únicamente de las prácticas
        /*
        let sueldoPracticas = empresa.filter({$0.practicas == true}).map({return $0}).reduce(0){
            (sueldoActual,sueldoSiguiente)-> Double in
            return sueldoActual + sueldoSiguiente.sueldo
        }
        print("sueldo total prácticas = ",sueldoPracticas)
         */
        
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
        
        //Sumar valores
        //var empresaIterar = [Persona]()
        //empresaIterar.appendContentsOf(empresa)
        //var empresaMap: [Persona] = empresa
        //Iterativo
        var arrayAuxIterativo = [Persona]()
        var arrayAuxDouble = [Double]()
        let inicioSumatoria = NSDate()
        for p in empresaIterar{
            //let sueldoAux = p.sueldo
            //let persona = Persona(NIF:p.NIF,nombre:p.nombre,apellido:p.apellido
                //,sueldo:p.sueldo*2,puesto:p.puesto,practicas: p.practicas)
            //arrayIterativo.append(p)
            //arrayIterativo.last?.sueldo = sueldoAux * 2
            //p.sueldo = sueldoAux * 2
            //arrayAuxIterativo.append(persona)
            //p.sueldo = p.sueldo*2
            //arrayAuxIterativo.append(p)
            arrayAuxDouble.append(p.sueldo)
        }
        let finSumatoria = NSDate()
        let diferenciaIterativa = (finSumatoria.timeIntervalSinceDate(inicioSumatoria) * 1000)
        print("Tiempo iterativo = ",diferenciaIterativa)
        //print("Empresa iterativo = ",arrayAuxIterativo.map({$0.sueldo}))
        //print("Resultado iterativo = ",arrayAuxDouble)
        
        //Mapa
        let inicioSumatoriaMapa = NSDate()
        /*let sumatoriaMapa = empresa.reduce(0){(sueldoActual,sueldoSiguiente) -> Double in
            return sueldoActual+sueldoSiguiente.sueldo
        }*/
        let newArray = empresa.map{$0.sueldo*2}
        let finSumatoriaMapa = NSDate()
        let diferenciaMapa = (finSumatoriaMapa.timeIntervalSinceDate(inicioSumatoriaMapa) * 1000)
        print("Tiempo mapa = ",diferenciaMapa)
        //print("empresaMap = ",newArray.map({$0}))
        //print("Resultado mapa = ",sumatoriaMapa)
        //Duplicar valor
        //let duplicarSueldo = empresa.map({$0}).map({$0.sueldo*2})
        //print("Sueldos dobles = ",duplicarSueldo)
        //print("Empresa map = ",newArray)
        
        /*print("Empresa = ",empresa.map({$0.sueldo}))
        print("empresaIterar= ",empresaIterar.map({$0.sueldo}))
        print("arrayAuxIterativo = ",arrayAuxIterativo.map({$0.sueldo}))
        print("newArray = ",newArray.map({$0}))*/
    }
    
    
    
    //Métodos donde el mapa es más rápido
    
    func mapaMasRapido(){
        //Al añadir valores de un atributo
        //let duplicarSueldo = empresa.map({$0.sueldo}) es más rápido que un bucle y: arrayAuxDouble.append(p.sueldo)
        
        //Cuando se muestra el objeto entero el mapa NO es más rápido pero sí lo es para coger únicamente un atributo del objeto
    }
    
    func pruebas2(){
    
        //Utilizar Map para transformar arrays -> Mucho más eficiente
        var arrayMap = [Int]()
        var arrayIterar = [Int]()
        for i in 0...10000{
            arrayMap.append(i)
            arrayIterar.append(i)
        }
        
        //Mapa
        let inicioSumatoriaMapa = NSDate()
        let _ = arrayMap.map({"\($0)"})
        let finSumatoriaMapa = NSDate()
        let diferenciaMapa = (finSumatoriaMapa.timeIntervalSinceDate(inicioSumatoriaMapa) * 1000)
        print("Tiempo mapa pruebas2 = ",diferenciaMapa)
        
        
        //Iterativo
        let inicioSumatoria = NSDate()
        var arrayIterarString = [String]()
        for n in arrayIterar{
            arrayIterarString.append("\(n)")
        }
        let finSumatoria = NSDate()
        let diferenciaIterativa = (finSumatoria.timeIntervalSinceDate(inicioSumatoria) * 1000)
        print("Tiempo iterativo pruebas2 = ",diferenciaIterativa)
    }
    
    func pruebas3(){
        //Devolver texto nombre + apellidos de empresa -> Mucho más eficiente mapa
        
        //Mapa
        let inicioSumatoriaMapa = NSDate()
        let _ = empresa.map({$0.nombre + " " + $0.apellido})
        let finSumatoriaMapa = NSDate()
        let diferenciaMapa = (finSumatoriaMapa.timeIntervalSinceDate(inicioSumatoriaMapa) * 1000)
        print("Tiempo mapa pruebas3 = ",diferenciaMapa)
        
        
        //Iterativo
        let inicioSumatoria = NSDate()
        var arrayIterarString = [String]()
        for ei in empresaIterar{
            arrayIterarString.append(ei.nombre + " " + ei.apellido)
        }
        let finSumatoria = NSDate()
        let diferenciaIterativa = (finSumatoria.timeIntervalSinceDate(inicioSumatoria) * 1000)
        print("Tiempo iterativo pruebas3 = ",diferenciaIterativa)
    }
    
    
}
