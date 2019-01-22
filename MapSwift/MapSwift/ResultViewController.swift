//
//  ResultViewController.swift
//  MapSwift
//
//  Created by Aula11 on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit
import Charts

class ResultViewController : UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,ChartViewDelegate {

    @IBOutlet weak var sueldosTotalesLbl: UILabel!

    @IBOutlet weak var sueldoMedioLbl: UILabel!
    @IBOutlet weak var chart: BarChartView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    
        if (mediaSeleccionada == true){
            sueldoMedioLbl.text = "Sueldo medio = \(sueldoMedioIterativo)"
        } else {
            sueldoMedioLbl.hidden = true
        }
        if(totalSeleccionado == true){
            sueldosTotalesLbl.text = "Sueldos totales = \(sueldoTotalIterativo)"
        } else {
            sueldosTotalesLbl.hidden = true
        }
        
        let textos = ["Tiempo iterativo", "Tiempo mapa"]
        let tiempoBusqueda = [tiempoMedioIterar, tiempoMedioMapa] //Tiempo búsqueda iterativo y map
        //let tiempoEscritura = [tiempoStringBucle, tiempoStringMap]  //Tiempo escritura iterativo y mapa
        setChartBarGroupDataSet(textos, values: tiempoBusqueda, /*values2: tiempoEscritura,*/ sortIndex: 1)

    }
    
    func setChartBarGroupDataSet(dataPoints: [String], values: [Double], /*values2: [Double],*/sortIndex:Int) {
        
        var dataEntries: [BarChartDataEntry] = []
        //var dataEntries2: [BarChartDataEntry] = []
        
        
        for i in 0..<dataPoints.count {
            
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        
        /*for i in 0..<dataPoints.count {
            
            let dataEntry = BarChartDataEntry(value: values2[i], xIndex: i)
            dataEntries2.append(dataEntry)
        }*/
        
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Búsqueda")
        //let chartDataSet2 = BarChartDataSet(yVals: dataEntries2, label: "Escritura")
        
        //chartDataSet2.colors =  [UIColor.cyanColor()]
        
        chartDataSet.colors =  [UIColor.magentaColor()]
        
        
        let dataSets: [BarChartDataSet] = [chartDataSet/*,chartDataSet2*/]
        
        let data = BarChartData(xVals: dataPoints, dataSets: dataSets)
        
        chart.data = data
        
        chart.descriptionText = " "
        
        
        chart.rightAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawAxisLineEnabled = false
        chart.rightAxis.drawLabelsEnabled = false
        
        
        
        chart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        
    }

    
    
    }



/*
 
 
 
 @IBOutlet var barChartView: BarChartView!
 
 let generos = ["Aciertos", "Fallos"]
 var aciertosM : Int16 = 0
 var fallosM : Int16 = 0
 var aciertosH : Int16 = 0
 var fallosH : Int16 = 0
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 let resultadosMasculino = [Double(aciertosH), Double(fallosH)] //Aciertos y fallos niños
 let resultadosFemenino = [Double(aciertosM), Double(fallosM)]  //Aciertos y fallos niñas
 setChartBarGroupDataSet(generos, values: resultadosMasculino, values2: resultadosFemenino, sortIndex: 1)
 
 }
 
 func setChartBarGroupDataSet(dataPoints: [String], values: [Double], values2: [Double],sortIndex:Int) {
 
 var dataEntries: [BarChartDataEntry] = []
 var dataEntries2: [BarChartDataEntry] = []
 
 
 for i in 0..<dataPoints.count {
 
 let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
 dataEntries.append(dataEntry)
 }
 
 
 for i in 0..<dataPoints.count {
 
 let dataEntry = BarChartDataEntry(value: values2[i], xIndex: i)
 dataEntries2.append(dataEntry)
 }
 
 
 let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Masculino")
 let chartDataSet2 = BarChartDataSet(yVals: dataEntries2, label: "Femenino")
 
 chartDataSet2.colors =  [UIColor(red: 255/255, green: 206/255, blue: 241/255, alpha: 1)]
 
 chartDataSet.colors =  [UIColor(red: 143/255, green: 214/255, blue: 128/255, alpha: 1)]
 
 
 let dataSets: [BarChartDataSet] = [chartDataSet,chartDataSet2]
 
 let data = BarChartData(xVals: dataPoints, dataSets: dataSets)
 
 barChartView.data = data
 
 barChartView.descriptionText = " "
 
 
 barChartView.rightAxis.drawGridLinesEnabled = false
 barChartView.rightAxis.drawAxisLineEnabled = false
 barChartView.rightAxis.drawLabelsEnabled = false
 
 
 
 barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
 
 
 }

 
 */