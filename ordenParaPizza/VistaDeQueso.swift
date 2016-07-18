//
//  VistaDeQueso.swift
//  ordenParaPizza
//
//  Created by Ana Torres on 18/07/16.
//  Copyright © 2016 Softm. All rights reserved.
//

import UIKit

class VistaDeQueso: UIViewController {

    @IBOutlet weak var botonQueso: UIButton!
    @IBOutlet weak var tipQueso: UITextField!
    let recuperados = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let loadedString = recuperados.stringForKey("KeyQueso") ?? ""
        tipQueso.text = loadedString
        if self.tipQueso.text!.isEmpty{
            print ("Vacio no avanzar")
            botonQueso.enabled = false
        }else{
            botonQueso.enabled = true
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var datosDeMasa: (String, String) = ("","")
    
    override func viewWillAppear(animated: Bool) {
        print("Tamaño Pizza en Queso: \(datosDeMasa.0) Tipo de Masa en Queso: \(datosDeMasa.1)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultado = queso()
        let sigVista = segue.destinationViewController as! VistaDeExtras
        sigVista.datosDeQueso = resultado
    }
    
    @IBAction func textEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textFieldEditingChanged(sender: AnyObject) {
        if self.tipQueso.text!.isEmpty{
            print ("Vacio no avanzar")
            botonQueso.enabled = false
        }else{
            botonQueso.enabled = true
            recuperados.setObject(tipQueso.text!, forKey: "KeyQueso")

        }
    }
    @IBAction func backgroundTap(sender: UIControl) {
        tipQueso.resignFirstResponder()
    }
    @IBAction func agregarQueso(sender: AnyObject) {
        queso()
    }
    
    func queso() -> (String, String, String) {
        var tipoQueso: String = ""
        tipoQueso = self.tipQueso.text!
        print("Tamaño: \n\(datosDeMasa.0) Tipo de Masa: \n\(datosDeMasa.1) Queso: \n\(tipoQueso)")
        recuperados.setObject(tipQueso.text!, forKey: "KeyQueso")
        return (datosDeMasa.0, datosDeMasa.1, tipoQueso)
    }

}
