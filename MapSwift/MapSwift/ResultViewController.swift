//
//  ResultViewController.swift
//  MapSwift
//
//  Created by Aula11 on 15/1/19.
//  Copyright © 2019 Jose F. Ruiz Zamora. All rights reserved.
//

import UIKit

internal class ResultViewController : UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var sueldosTotalesLbl: UILabel!

    @IBOutlet weak var sueldoMedioLbl: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    
        if (!mediaSeleccionada){
            sueldoMedioLbl.hidden = true
        }
        if(!totalSeleccionado){
            sueldosTotalesLbl.hidden = true
        }
    }
    
}