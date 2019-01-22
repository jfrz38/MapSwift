//
//  ResultadoTableViewController.swift
//  MapSwift
//
//  Created by Aula11 on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

class ResultadoTableViewController: UITableViewController {

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultadoBusqueda.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ResultsCell", forIndexPath: indexPath) as! ResultadoViewCell
        
        cell.nombreResLbl.text = resultadoBusqueda[indexPath.row].nombre
        cell.apellidoResLbl.text = resultadoBusqueda[indexPath.row].apellido
        cell.nifResLbl.text = resultadoBusqueda[indexPath.row].NIF
        var esBecarioPregunta : Bool
        var esBecarioTexto : String
        esBecarioPregunta = resultadoBusqueda[indexPath.row].practicas
        if(esBecarioPregunta == true){
            esBecarioTexto = "Becario"
        } else {
            esBecarioTexto = "Empleado"
        }
        cell.becarioResLbl.text = esBecarioTexto
        cell.puestoResLbl.text = resultadoBusqueda[indexPath.row].puesto
        cell.sueldoResLbl.text = "\(resultadoBusqueda[indexPath.row].sueldo)"
        
        //cell.telefono.text = pacientes[indexPath.row].telefono
        //cell.sexo.text = pacientes[indexPath.row].sexo
        //cell.edad.text = pacientes[indexPath.row].edad
        //cell.foto.image = pacientes[indexPath.row].foto
        //cell.evaluacion.gradoAfinidad = amigos[indexPath.row].gradoAfinidad
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath
        indexPath: NSIndexPath) -> Bool {
        return true
    }

}
