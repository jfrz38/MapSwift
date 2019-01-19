//
//  SerachViewController.swift
//  MapSwift
//
//  Created by Aula11 on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

var tiempoMedioMapa : Double = 0.0
var tiempoMedioIterar : Double = 0.0

class SearchViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    /*
    var nifIgual = false
    var nifNoIgual = false
    var sueldoMayor = false
    var sueldoMenor = false
    var sueldoIgual = false
    var becarioSi = false
    var becarioNo = false
    var nombreIgual = false
    var nombreNoIgual = false
    */
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
    //@IBOutlet weak var btnNombreNoIgual: UIButton!
    @IBOutlet weak var btnNombreNoIgual: UIButton!
    
    @IBOutlet weak var btnMostrarNombre: UIButton!
    @IBOutlet weak var btnMedia: UIButton!
    @IBOutlet weak var btnTotal: UIButton!
    
    //TODO : Hacer Editing Changed de los campos de texto, cada vez que cambien su valor se comprueba si es
    //vacío o no para poner los botones correspondientes en .disable = true o no
    //P. ej: Si el campo nombre está vacío, los botones del nombre estarán disabled y a false
    //Si no está vacío se mostrarán disable = false
    //dependiendo de si están en false o no se mostrará alpha 0.25 0 1 (al ponerse en false al dejar
    //el campo de texto vacío no debería haber problema)
    
    //Mark: functions
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        /*
        opciones.append(nifIgual)   //0
        opciones.append(nifNoIgual) //1
        opciones.append(sueldoMayor)//2
        opciones.append(sueldoMenor)//3
        opciones.append(sueldoIgual)//4
        opciones.append(becarioSi)  //5
        opciones.append(becarioNo)  //6
        opciones.append(nombreIgual)//7
        opciones.append(nombreNoIgual)//8
        */
        //Valores falsos por defecto
        for _ in 0...8{
            opciones.append(false)
        }
        btnNifIgual.alpha = 0.25
        btnNifNoIgual.alpha = 0.25
        btnSueldoMenor.alpha = 0.25
        btnSueldoIgual.alpha = 0.25
        btnSueldoMayor.alpha = 0.25
        btnBecario.alpha = 0.25
        btnNoBecario.alpha = 0.25
        btnNombreIgual.alpha = 0.25
        btnNombreNoIgual.alpha = 0.25
        btnMostrarNombre.alpha = 0.25
        btnMedia.alpha = 0.25
        btnTotal.alpha = 0.25
        
    }

    @IBAction func nifIgual(sender: UIButton) {
        if(opciones[0] == true){
            //Desactivar botón
            opciones[0] = false  //NIF igual
            //opciones[1] = false //NIF distinto
            btnNifIgual.alpha = 0.25
            //btnNifNoIgual.alpha = 0.25
        }else{
            opciones[0] = true  //NIF igual
            opciones[1] = false //NIF distinto
            btnNifIgual.alpha = 1
            btnNifNoIgual.alpha = 0.25
        }
        
    }

    @IBAction func nifDistinto(sender: UIButton) {
        if(opciones[1]==true){
            //Desactivar botón
            opciones[1] = false  //NIF distinto
            btnNifNoIgual.alpha = 0.25
        }else{
            opciones[0] = false //NIF igual
            opciones[1] = true  //NIF distinto
            btnNifIgual.alpha = 0.25
            btnNifNoIgual.alpha = 1
        }
        
    }

    @IBAction func sueldoMenor(sender: UIButton) {
        if(opciones[3] == true){
            //Desactivar botón
            opciones[3] = false  //Sueldo menor
            btnSueldoMenor.alpha = 0.25
        }else{
            opciones[3] = true  //Sueldo menor
            opciones[4] = false //Sueldo igual
            opciones[2] = false //Sueldo mayor
            btnSueldoMenor.alpha = 1
            btnSueldoIgual.alpha = 0.25
            btnSueldoMayor.alpha = 0.25
        }
        
    }
    
    @IBAction func sueldoIgual(sender: UIButton) {
        if(opciones[4] == true){
            //Desactivar botón
            opciones[4] = false
            btnSueldoIgual.alpha = 0.25
        }else{
            opciones[3] = false //Sueldo menor
            opciones[4] = true  //Sueldo igual
            opciones[2] = false //Sueldo mayor
            btnSueldoMenor.alpha = 0.25
            btnSueldoIgual.alpha = 1
            btnSueldoMayor.alpha = 0.25
        }
        
    }
    
    @IBAction func sueldoMayor(sender: UIButton) {
        if(opciones[2] == true){
            opciones[2] = false
            btnSueldoMayor.alpha = 0.25
        }else{
            opciones[3] = false //Sueldo menor
            opciones[4] = false //Sueldo igual
            opciones[2] = true  //Sueldo mayor
            btnSueldoMenor.alpha = 0.25
            btnSueldoIgual.alpha = 0.25
            btnSueldoMayor.alpha = 1
        }
        
    }
    
    @IBAction func esBecario(sender: UIButton) {
        if(opciones[5] == true){
            opciones[5] = false
            btnBecario.alpha = 0.25
        }else{
            opciones[5] = true  //Becario
            opciones[6] = false //No becario
            btnBecario.alpha = 1
            btnNoBecario.alpha = 0.25
        }
        
    }
    
    @IBAction func noEsBecario(sender: UIButton) {
        if(opciones[6] == true){
            opciones[6] = false
            btnNoBecario.alpha = 0.25
        }else{
            opciones[5] = false //Becario
            opciones[6] = true  //No becario
            btnBecario.alpha = 0.25
            btnNoBecario.alpha = 1
        }
        
    }
    
    @IBAction func nombreIgual(sender: UIButton) {
        if(opciones[7]==true){
            opciones[7] = false
            btnNombreIgual.alpha = 0.25
        }else{
            opciones[7] = true  //Nombre igual
            opciones[8] = false //nombre diferente
            btnNombreIgual.alpha = 1
            btnNombreNoIgual.alpha = 0.25
        }
        
    }
    
    @IBAction func nombreDistinto(sender: UIButton) {
        if(opciones[8]==true){
            opciones[8] = false
            btnNombreNoIgual.alpha = 0.25
        }else{
            opciones[7] = false //Nombre igual
            opciones[8] = true  //Nombre diferente
            btnNombreIgual.alpha = 0.25
            btnNombreNoIgual.alpha = 1
        }
        
    }
    
    @IBAction func mostrarNombre(sender: UIButton) {
        if(mostrarNombreSeleccionado){
            mostrarNombreSeleccionado = false
            btnMostrarNombre.alpha = 0.25
        }else{
            mostrarNombreSeleccionado = true
            btnMostrarNombre.alpha = 1
        }
    }
    
    @IBAction func tapTotal(sender: UIButton) {
        if(getSueldoTotal){
            getSueldoTotal = false
            btnTotal.alpha = 0.25
        }else{
            getSueldoTotal = true
            btnTotal.alpha = 1
        }
    }
    
    @IBAction func tapMedia(sender: UIButton) {
        if(getSueldoMedio){
            getSueldoMedio = false
            btnMedia.alpha = 0.25
        }else{
            getSueldoMedio = true
            btnMedia.alpha = 1
        }
    }

    //Pulsar la lupa para realizar búsqueda
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier != "toResult") {
            return
        }
        
        if (!comprobarBotones()){
            //Allert controller
            //AlertController campos vacíos
            let alertController = UIAlertController(title: "¡Cuidado!", message: "Selecciona al menos un campo", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            return;
        }
        
        var arrayTiempoMedioMap = [Double]()
        var arrayTiempoMedioIterar = [Double]()
        
        for _ in 1...10{
            //Tiempo
            let inicioTiempoMap = NSDate()
            //Búsqueda Map
            let resultadosFinalesMap = busquedaMap()
            let finTiempoMap = NSDate()
            let diferenciaMap = (finTiempoMap.timeIntervalSinceDate(inicioTiempoMap) * 1000)
            //print("Tiempo búsqueda map = ",diferenciaMap)
            arrayTiempoMedioMap.append(diferenciaMap)
            resultadoBusqueda = resultadosFinalesMap
        }
        
        //Valor medio de los resultados
        var aux = 0.0
        for i in arrayTiempoMedioMap{
            aux+=i
        }
        tiempoMedioMapa = aux/Double(arrayTiempoMedioMap.count)
        print("Tiempo búsqueda medio map = ",tiempoMedioMapa)
        
        
        for _ in 1...10{
            //Tiempo iterativo
            let inicioTiempoIterativo = NSDate()
            //Búsqueda iterativa
            let resultadosFinalesIterar = busquedaBucle()
            let finTiempoIterativo = NSDate()
            let diferenciaIterativa = (finTiempoIterativo.timeIntervalSinceDate(inicioTiempoIterativo) * 1000)
            //print("Tiempo búsqueda iterativa = ",diferenciaIterativa)
            arrayTiempoMedioIterar.append(diferenciaIterativa)
            resultadoBusqueda = resultadosFinalesIterar
        }
        
        aux = 0.0
        for i in arrayTiempoMedioIterar{
            aux+=i
        }
        tiempoMedioIterar = aux/Double(arrayTiempoMedioIterar.count)
        print("Tiempo búsqueda medio iterar = ",tiempoMedioIterar)
        
        //Mostrar por nombre
        if(mostrarNombreSeleccionado){
            tiemposAtributos()
        }
        
        //print("Resultados iterativo = ",resultadosFinalesIterar.map({$0.nombre}))
        
        /*if(resultadosFinalesMap.count == resultadosFinalesIterar.count){
            print("Nº resultados = ",resultadosFinalesMap.count)
            var i = 0
            var distinto = false
            for p in resultadosFinalesMap{
                if(p.NIF != resultadosFinalesMap[i].NIF){
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
        }*/
        
        //print("Resultados iterativo: ",resultadosFinalesIterar.map({$0.NIF}))
        //print("Resultados map: ",resultadosFinalesMap.map({$0.NIF}))
    }
    
    func tiemposAtributos(){
        //Mapa
        var tiempoMedioStringMap = [Double]()
        for _ in 1...10000{
            let inicioTiempoMap = NSDate()
            var _ = resultadoBusqueda.map({$0.nombre+" "+$0.apellido})
            let finTiempoMap = NSDate()
            let diferenciaMap = (finTiempoMap.timeIntervalSinceDate(inicioTiempoMap) * 1000)
            tiempoMedioStringMap.append(diferenciaMap)
        }
        var aux = 0.0
        for i in tiempoMedioStringMap{
            aux+=i
        }
        tiempoStringMap = aux/Double(tiempoMedioStringMap.count)
        print("Tiempo medio string map = ",aux/Double(tiempoMedioStringMap.count))
        
        //Iterativo
        var tiempoMedioStringIterativo = [Double]()
        for _ in 1...10{
            let inicioTiempoIterativo = NSDate()
            //Búsqueda iterativa
            var atributosIterativo = [String]()
            for rb in resultadoBusqueda{
                atributosIterativo.append(rb.nombre+" "+rb.apellido)
            }
            let finTiempoIterativo = NSDate()
            let diferenciaIterativa = (finTiempoIterativo.timeIntervalSinceDate(inicioTiempoIterativo) * 1000)
            tiempoMedioStringIterativo.append(diferenciaIterativa)
            resultadoBusquedaString = atributosIterativo

        }
        aux = 0.0
        for i in tiempoMedioStringIterativo{
            aux+=i
        }
        tiempoStringBucle = aux/Double(tiempoMedioStringIterativo.count)
        print("Tiempo medio string iterativo = ",tiempoStringBucle)

    }
    
    func comprobarBotones() -> Bool{
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
        
        //Alert controler si está todo vacío
        var j = 0
        for op in opciones{
            if(op == true){
                break
            }
            if(opciones.count-1 == j){
                //Devuelve un array vacío
                //TODO indicar que no se ha seleccionado nada
                return false
            }
            j+=1
        }
        
        return true

    }
    
    //Realiza la búsqueda utilizando Map
    func busquedaMap() -> [Persona]{
        
        
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
            sueldoTotalMap = resultadosBusqueda.reduce(0){(sueldoActual,sueldoSiguiente) -> Double in
                return sueldoActual+sueldoSiguiente.sueldo
            }
            if(getSueldoMedio){
                sueldoMedioMap = sueldoTotalMap/Double(resultadosBusqueda.count)
            }
            
            
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
            filtroNIF = entrada.filter({$0.NIF == nif})
            //Filtro contains
            //filtroNIF = entrada.filter({$0.NIF.containsString("NIF")})
        }else{
            //Accion = !=
            filtroNIF = entrada.filter({$0.NIF != nif})
            
        }
        
        return filtroNIF
    }
    
    func filtro_sueldo(entrada:[Persona],accion: String, sueldo:Double) -> [Persona]{
        
        var filtroSueldo:[Persona]
        
        if(accion == "<"){
            filtroSueldo = entrada.filter({$0.sueldo < sueldo})
        }else if(accion == "="){
            filtroSueldo = entrada.filter({$0.sueldo == sueldo})
        }else{
            //Accion: >
            filtroSueldo = entrada.filter({$0.sueldo > sueldo})
        }
        return filtroSueldo
    }
    
    func filtro_practicas(entrada:[Persona],accion: Bool) -> [Persona]{
        var filtroPracticas: [Persona]
        
        if (accion){
            filtroPracticas = entrada.filter({$0.practicas == true})
        }else{
            //accion == false
            filtroPracticas = entrada.filter({$0.practicas == false})
        }
        
        return filtroPracticas
    }

    
    func filtro_nombre(entrada:[Persona],accion: String, nombre:String) -> [Persona]{
        var filtroNombre:[Persona]
        if(accion == "="){
            filtroNombre = entrada.filter({$0.nombre == nombre})
        }else if(accion == "!="){
            filtroNombre = entrada.filter({$0.nombre != nombre})
        }else if(accion == "contenga"){
            filtroNombre = entrada.filter({$0.nombre.containsString(nombre)})
        }else{
            //accion = no contenga
            filtroNombre = entrada.filter({!$0.nombre.containsString(nombre)})
        }
        
        return filtroNombre
    }
    
    
    
    
    
    ///PARTE ITERATIVA
    
    //Utiliza la búsqueda iterativamente
    func busquedaBucle() -> [Persona]{
        
        var resultadosBusqueda = empresaIterar
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
            for rb in resultadosBusqueda{
                sueldoTotalIterativo += rb.sueldo
            }
            if(getSueldoMedio){
                sueldoMedioIterativo = sueldoTotalIterativo/Double(resultadosBusqueda.count)
            }
            
            
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


