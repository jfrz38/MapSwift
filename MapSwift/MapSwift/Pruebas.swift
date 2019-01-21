//
//  Pruebas.swift
//  MapSwift
//
//  Created by Aula11 on 21/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

class Pruebas {

    func inicializar(){
        
        pruebas2()
        pruebas3()
        pruebas4()
        pruebas5()
        pruebas6()
        pruebas7()
        
    }
    
    func hacer_media() -> Double{
        var n : Double = 0.0
        for d in arrayMedia{
            n+=d
        }
        
        return n/Double(arrayMedia.count)
    }
    
    func pruebas2(){
        
        //Utilizar Map para transformar arrays -> Mucho más eficiente
        var arrayMap = [Int]()
        var arrayIterar = [Int]()
        for i in 0...tamFinal{
            arrayMap.append(i)
            arrayIterar.append(i)
        }
        
        arrayMedia = [Double]()
        for _ in 0...10{
            //Mapa
            let inicioSumatoriaMapa = NSDate()
            let _ = arrayMap.map({"\($0)"})
            let finSumatoriaMapa = NSDate()
            let diferenciaMapa = (finSumatoriaMapa.timeIntervalSinceDate(inicioSumatoriaMapa) * 1000)
            
            arrayMedia.append(diferenciaMapa)
        }
        
        print("Tiempo mapa pruebas2 = ",hacer_media())
        
        arrayMedia = [Double]()
        //Iterativo
        for _ in 0...10{
            let inicioSumatoria = NSDate()
            var arrayIterarString = [String]()
            for n in arrayIterar{
                arrayIterarString.append("\(n)")
            }
            let finSumatoria = NSDate()
            let diferenciaIterativa = (finSumatoria.timeIntervalSinceDate(inicioSumatoria) * 1000)
            arrayMedia.append(diferenciaIterativa)
        }
        
        print("Tiempo iterativo pruebas2 = ",hacer_media())
    }
    
    func pruebas3(){
        //Devolver texto nombre + apellidos de empresa -> Mucho más eficiente mapa
        
        arrayMedia = [Double]()
        for _ in 0...10{
            //Mapa
            let inicioSumatoriaMapa = NSDate()
            let _ = empresa.map({$0.nombre + " " + $0.apellido})
            let finSumatoriaMapa = NSDate()
            let diferenciaMapa = (finSumatoriaMapa.timeIntervalSinceDate(inicioSumatoriaMapa) * 1000)
            arrayMedia.append(diferenciaMapa)
        }
        
        print("Tiempo mapa pruebas3 = ",hacer_media())
        
        
        arrayMedia = [Double]()
        
        for _ in 0...10{
            //Iterativo
            let inicioSumatoria = NSDate()
            var arrayIterarString = [String]()
            for ei in empresaIterar{
                arrayIterarString.append(ei.nombre + " " + ei.apellido)
            }
            let finSumatoria = NSDate()
            let diferenciaIterativa = (finSumatoria.timeIntervalSinceDate(inicioSumatoria) * 1000)
            arrayMedia.append(diferenciaIterativa)
        }
        
        print("Tiempo iterativo pruebas3 = ",hacer_media())
    }
    
    func pruebas4(){
        //Cambiar el propio array -> Mucho más eficiente array
        
        arrayMedia = [Double]()
        for _ in 0...10{
            var array1 = [Int]()
            
            for i in 0...tamFinal{
                array1.append(i)
            }
            
            
            let inicioMapa = NSDate()
            array1 = array1.map({$0 * 2})
            let finMapa = NSDate()
            let diferenciaMapa = (finMapa.timeIntervalSinceDate(inicioMapa) * 1000)
            arrayMedia.append(diferenciaMapa)
        }
        
        print("Tiempo mapa pruebas4 = ",hacer_media())
        
        arrayMedia = [Double]()
        for _ in 0...10{
            var array2 = [Int]()
            
            for i in 0...tamFinal{
                array2.append(i)
            }
            let inicioBucle = NSDate()
            for i in 0...array2.count-1{
                array2[i] = array2[i] * 2
            }
            let finBucle = NSDate()
            let diferenciaBucle = (finBucle.timeIntervalSinceDate(inicioBucle) * 1000)
            arrayMedia.append(diferenciaBucle)
        }
        
        print("Tiempo bucle pruebas4 = ",hacer_media())
        
    }
    
    func pruebas5(){
        //Filtrar arrays para devolver solo el menor que X número -> Bucle más eficiente
        
        //Tamaño aleatorio
        let tam = Int(arc4random_uniform(UInt32(tamFinal-1))+UInt32(0))
        arrayMedia = [Double]()
        for _ in 0...10{
            var array1 = [Int]()
            
            for i in 0...tamFinal{
                array1.append(i)
            }
            
            let inicioMapa = NSDate()
            array1 = array1.filter({$0 < tam})
            let finMapa = NSDate()
            let diferenciaMapa = (finMapa.timeIntervalSinceDate(inicioMapa) * 1000)
            arrayMedia.append(diferenciaMapa)
            
        }
        
        print("Tiempo mapa pruebas5 = ",hacer_media())
        
        
        arrayMedia = [Double]()
        
        for _ in 0...10{
            var array2 = [Int]()
            
            for i in 0...tamFinal{
                array2.append(i)
            }
            
            let inicioBucle = NSDate()
            var array2aux = [Int]()
            for i in array2{
                if(i < tam){
                    array2aux.append(i)
                }
            }
            array2 = array2aux
            let finBucle = NSDate()
            let diferenciaBucle = (finBucle.timeIntervalSinceDate(inicioBucle) * 1000)
            arrayMedia.append(diferenciaBucle)
        }
        
        
        print("Tiempo bucle pruebas5 = ",hacer_media())
        
    }
    
    func pruebas6(){
        //Reduce : Sumatoria de todos los elementos
        
        arrayMedia = [Double]()
        for _ in 0...10{
            var array1int = [Int]()
            for i in 0...tamFinal{
                array1int.append(i)
            }
            
            let inicioMapa = NSDate()
            let _  = array1int.reduce(0){ (antes, despues) -> Int in
                return antes + despues
            }
            let finMapa = NSDate()
            let diferenciaMapa = (finMapa.timeIntervalSinceDate(inicioMapa) * 1000)
            arrayMedia.append(diferenciaMapa)
        }
        
        print("Tiempo mapa int pruebas6 = ",hacer_media())
        
        arrayMedia = [Double]()
        for _ in 0...10{
            var array2int = [Int]()
            for i in 0...tamFinal{
                array2int.append(i)
            }
            
            let inicioBucle = NSDate()
            var sumatoriaBucle = 0
            for i in array2int{
                sumatoriaBucle += i
            }
            let finBucle = NSDate()
            let diferenciaBucle = (finBucle.timeIntervalSinceDate(inicioBucle) * 1000)
            arrayMedia.append(diferenciaBucle)
        }
        
        print("Tiempo bucle int pruebas6 = ",hacer_media())
        
        
    }
    
    func pruebas7(){
        //Pasar int a string y añadirle €
        
        arrayMedia = [Double]()
        for _ in 0...10{
            var array1int = [Int]()
            for i in 0...tamFinal{
                array1int.append(i)
            }
            
            
            let inicioMapa = NSDate()
            let _ = array1int.map({String($0)+"€"})
            let finMapa = NSDate()
            let diferenciaMapa = (finMapa.timeIntervalSinceDate(inicioMapa) * 1000)
            arrayMedia.append(diferenciaMapa)
        }
        
        print("Tiempo mapa pruebas7 = ",hacer_media())
        
        arrayMedia = [Double]()
        for _ in 0...10{
            var array2int = [Int]()
            for i in 0...tamFinal{
                array2int.append(i)
            }
            
            let inicioBucle = NSDate()
            var arrStrAux = [String]()
            for num in array2int{
                arrStrAux.append(String(num)+"€")
            }
            let finBucle = NSDate()
            let diferenciaBucle = (finBucle.timeIntervalSinceDate(inicioBucle) * 1000)
            arrayMedia.append(diferenciaBucle)
        }
        
        print("Tiempo bucle pruebas7 = ",hacer_media())
        
    }
    
    func otrasPruebas(){
                
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

}
