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
    
    //Mark: properties
    
    @IBOutlet weak var nifTxt: UITextField!
    
    @IBOutlet weak var sueldoTxt: UITextField!
    
    @IBOutlet weak var nombreTxt: UITextField!
    
    @IBOutlet weak var btnNifIgual: UIButton!
    @IBOutlet weak var btnNifNoIgual: UIButton!
    @IBOutlet weak var btnSueldoMenor: UIButton!
    @IBOutlet weak var btnSueldoIgual: UIButton!
    @IBOutlet weak var btnSueldoMayor: UIButton!
    @IBOutlet weak var btnBecario: UIButton!
    @IBOutlet weak var btnNoBecario: UIButton!
    @IBOutlet weak var btnNombreIgual: UIButton!
    @IBOutlet weak var btnNombreNoIgual: UIButton!
    
    //Visualizadores
    
    //TODO : Hacer Editing Changed de los campos de texto, cada vez que cambien su valor se comprueba si es
    //vacío o no para poner los botones correspondientes en .disable = true o no
    //P. ej: Si el campo nombre está vacío, los botones del nombre estarán disabled y a false
    //Si no está vacío se mostrarán disable = false
    //dependiendo de si están en false o no se mostrará alpha 0.25 0 1 (al ponerse en false al dejar
    //el campo de texto vacío no debería haber problema)
    
    //Mark: functions
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        opciones.append(nifIgual)   //0
        opciones.append(nifNoIgual) //1
        opciones.append(sueldoMayor)//2
        opciones.append(sueldoMenor)//3
        opciones.append(sueldoIgual)//4
        opciones.append(becarioSi)  //5
        opciones.append(becarioNo)  //6
        opciones.append(nombreIgual)//7
        opciones.append(nombreNoIgual)//8
        
        btnNifIgual.alpha = 0.25
        btnNifNoIgual.alpha = 0.25
        
    }

    @IBAction func nifIgual(sender: UIButton) {
        opciones[0] = true  //NIF igual
        opciones[1] = false //NIF distinto
        btnNifIgual.alpha = 1
        btnNifNoIgual.alpha = 0.25
    }

    @IBAction func nifDistinto(sender: UIButton) {
        opciones[0] = false //NIF igual
        opciones[1] = true  //NIF distinto
        btnNifIgual.alpha = 0.25
        btnNifNoIgual.alpha = 1
    }

    @IBAction func sueldoMenor(sender: UIButton) {
        opciones[3] = true  //Sueldo menor
        opciones[4] = false //Sueldo igual
        opciones[2] = false //Sueldo mayor
    }
    
    @IBAction func sueldoIgual(sender: UIButton) {
        opciones[3] = false //Sueldo menor
        opciones[4] = true  //Sueldo igual
        opciones[2] = false //Sueldo mayor
    }
    
    @IBAction func sueldoMayor(sender: UIButton) {
        opciones[3] = false //Sueldo menor
        opciones[4] = false //Sueldo igual
        opciones[2] = true  //Sueldo mayor
    }
    
    @IBAction func esBecario(sender: UIButton) {
        opciones[5] = true  //Becario
        opciones[6] = false //No becario
    }
    
    @IBAction func noEsBecario(sender: UIButton) {
        opciones[5] = false //Becario
        opciones[6] = true  //No becario
    }
    
    @IBAction func nombreIgual(sender: UIButton) {
        opciones[7] = true  //Nombre igual
        opciones[8] = false //nombre diferente
    }
    
    @IBAction func nombreDistinto(sender: UIButton) {
        opciones[7] = false //Nombre igual
        opciones[8] = true  //Nombre diferente
    }

    //Pulsar la lupa para realizar búsqueda
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier != "toResult") {
            return
        }
        
        comprobarBotones()
        //Tiempo
        let inicioTiempoMap = NSDate()
        //Búsqueda Map
        let resultadosFinalesMap = busquedaMap()
        let finTiempoMap = NSDate()
        let diferenciaMap = (finTiempoMap.timeIntervalSinceDate(inicioTiempoMap) * 1000)
        print("Tiempo búsqueda map = ",diferenciaMap)
        
        //print("Resultado map = ",resultadosFinalesMap.map({$0.nombre}))
        
        
        //Tiempo iterativo
        let inicioTiempoIterativo = NSDate()
        //Búsqueda iterativa
        let resultadosFinalesIterar = busquedaBucle()
        let finTiempoIterativo = NSDate()
        let diferenciaIterativa = (finTiempoIterativo.timeIntervalSinceDate(inicioTiempoIterativo) * 1000)
        print("Tiempo búsqueda iterativa = ",diferenciaIterativa)
        //print("Resultados iterativo = ",resultadosFinalesIterar.map({$0.nombre}))
        print("Nº resultados = ",resultadosFinalesMap.count)
        if(resultadosFinalesMap.count == resultadosFinalesIterar.count){
            var i = 0
            var distinto = false
            for p in resultadosFinalesMap{
                if(p.NIF != resultadosFinalesMap[i].nombre){
                    print("No coincide")
                    distinto = true //hay uno distinto
                    break
                }
                i+=1
                
            }
            if(!distinto){
                print("Coincide")
            }
            
        }else{
            print("No coincide")
        }
    }
    
    func comprobarBotones(){
        //Comprobar los campos de texto
        if(nifTxt.text! == ""){
            opciones[0] = false
            opciones[1] = false
        }else{
            nifInsertado = nifTxt.text!
        }
        
        if(nombreTxt.text! == ""){
            opciones[7] = false
            opciones[8] = false
        }else{
            nombreInsertado = nombreTxt.text!
        }
        
        if(sueldoTxt.text! == "" && getSueldoTotal == false && getSueldoMedio == false){
            opciones[2] = false
            opciones[3] = false
            opciones[4] = false
        }else{
            //TODO : Comprobar si es un número o no
            sueldoInsertado = Double(sueldoTxt.text!)
        }
    }
    
    //Realiza la búsqueda utilizando Map
    func busquedaMap() -> [Persona]{
        
        var j = 0
        for op in opciones{
            if(op == true){
                break
            }
            if(opciones.count-1 == j){
                //Devuelve un array vacío
                //TODO indicar que no se ha seleccionado nada
                return [Persona]()
            }
            j+=1
        }
        
        var resultadosBusqueda = empresa
        var i = 0
        for _ in opciones{
            if(opciones[i]==true){
             resultadosBusqueda = metodoPorPosicionMap(i,entrada: resultadosBusqueda)
            }
            i+=1
        }
        
        if(getSueldoTotal || getSueldoMedio){
            //Calcular sueldo medio o total de la opción elegida
            //Se realiza en el mismo if porque para calcular la media se necesita el total
            let resultadoFinal = resultadosBusqueda.reduce(0){(sueldoActual,sueldoSiguiente) -> Double in
                return sueldoActual+sueldoSiguiente.sueldo
            }
            
            let sueldoMedio = resultadoFinal/Double(resultadosBusqueda.count)
            
        }
        
        return resultadosBusqueda
        
    }
    
    //Accede al método según la posición que esté true
    func metodoPorPosicionMap(pos:Int, entrada:[Persona]) -> [Persona]{
        
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
    
    
    
    
    
    ///PARTE ITERATIVA
    
    //Utiliza la búsqueda iterativamente
    func busquedaBucle() -> [Persona]{
        
        var j = 0
        for op in opciones{
            if(op == true){
                break
            }
            if(opciones.count-1 == j){
                //Devuelve un array vacío
                //TODO indicar que no se ha seleccionado nada
                return [Persona]()
            }
            j+=1
        }
        
        var resultadosBusqueda = empresa
        var i = 0
        for _ in opciones{
            if(opciones[i]==true){
                resultadosBusqueda = metodoPorPosicionIterar(i,entrada: resultadosBusqueda)
            }
            i+=1
        }
        
        if(getSueldoTotal || getSueldoMedio){
            //Calcular sueldo medio o total de la opción elegida
            //Se realiza en el mismo if porque para calcular la media se necesita el total
            
            //let sueldoMedio = resultadoFinal/Double(resultadosBusqueda.count)
            
        }
        
        return resultadosBusqueda
    }
    
    //Accede al método iterativo según la posición que esté true
    func metodoPorPosicionIterar(pos:Int, entrada:[Persona]) -> [Persona]{
        
        switch pos {
        case 0:
            //NIF igual
            return filtro_NIF_iterar(entrada,accion: "=",nif: nifInsertado)
        case 1:
            //NIF no igual
            return filtro_NIF_iterar(entrada,accion: "!=",nif: nifInsertado)
        case 2:
            //Sueldo mayor
            return filtro_sueldo_iterar(entrada, accion: ">", sueldo: sueldoInsertado)
        case 3:
            //Sueldo menor
            return filtro_sueldo_iterar(entrada, accion: "<", sueldo: sueldoInsertado)
        case 4:
            //Sueldo igual
            return filtro_sueldo_iterar(entrada, accion: "=", sueldo: sueldoInsertado)
        case 5:
            //Becario
            return filtro_practicas_iterar(entrada,accion: true)
        case 6:
            //No becario
            return filtro_practicas_iterar(entrada,accion: false)
        case 7:
            //Nombre igual
            return filtro_nombre_iterar(entrada,accion: "=",nombre: nombreInsertado)
        case 8:
            //Nombre no igual
            return filtro_nombre_iterar(entrada,accion: "!=",nombre: nombreInsertado)
        default:
            print("error")
            return entrada
        }
        
    }
    
    func filtro_NIF_iterar( entrada:[Persona], accion: String, nif: String) -> [Persona]{
        //NIF igual a nif de entrada: devuelve array de objetos personas que coincida
        
        var filtroNIF = [Persona]()
        
        if(accion == "="){
            for p in entrada{
                if(p.NIF == nif){
                    filtroNIF.append(p)
                }
            }
        }else{
            //Accion = !=
            for p in entrada{
                if(p.NIF != nif){
                    filtroNIF.append(p)
                }
            }
            
        }
        
        return filtroNIF
    }
    
    func filtro_sueldo_iterar( entrada:[Persona],accion: String, sueldo:Double) -> [Persona]{
        
        var filtroSueldo = [Persona]()
        
        if(accion == "<"){
            for p in entrada{
                if (p.sueldo < sueldo){
                    filtroSueldo.append(p)
                }
            }
        }else if(accion == "="){
            for p in entrada{
                if (p.sueldo == sueldo){
                    filtroSueldo.append(p)
                }
            }
        }else{
            //Accion: >
            for p in entrada{
                if (p.sueldo > sueldo){
                    filtroSueldo.append(p)
                }
            }
        }
        
        return filtroSueldo
    }
    
    func filtro_practicas_iterar( entrada:[Persona],accion: Bool) -> [Persona]{
        
        var filtroPracticas = [Persona]()
        
        if (accion){
            for p in entrada{
                if(p.practicas == true){
                    filtroPracticas.append(p)
                }
            }
        }else{
            //accion == false
            for p in entrada{
                if(p.practicas == false){
                    filtroPracticas.append(p)
                }
            }
        }
        
        return filtroPracticas
    }
    
    func filtro_nombre_iterar( entrada:[Persona],accion: String, nombre:String) -> [Persona]{
        
        var filtroNombre=[Persona]()
        
        if(accion == "="){
            for p in entrada{
                if(p.nombre == nombre){
                    filtroNombre.append(p)
                }
            }
        }else if(accion == "!="){
            for p in entrada{
                if(p.nombre != nombre){
                    filtroNombre.append(p)
                }
            }
        }else if(accion == "contenga"){
            for p in entrada{
                if(p.nombre.containsString(nombre)){
                    filtroNombre.append(p)
                }
            }
        }else{
            //accion = no contenga
            for p in entrada{
                if(!p.nombre.containsString(nombre)){
                    filtroNombre.append(p)
                }
            }
        }
        
        return filtroNombre
    }

}


