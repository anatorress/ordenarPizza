//
//  VistaDeExtras.swift
//  ordenParaPizza
//
//  Created by Ana Torres on 18/07/16.
//  Copyright © 2016 Softm. All rights reserved.
//

import UIKit

class VistaDeExtras: UIViewController {

    @IBOutlet weak var tipExtra: UITextField!
    @IBOutlet weak var botonExtras: UIButton!
    let recuperados = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let loadedString = recuperados.stringForKey("KeyExtra") ?? ""
        tipExtra.text = loadedString
        if self.tipExtra.text!.isEmpty{
            print ("Vacio no avanzar")
            botonExtras.enabled = false
        }else{
            botonExtras.enabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    var datosDeQueso: (String, String, String) = ("", "","")
    
    override func viewWillAppear(animated: Bool) {
        print("Tamaño Pizza en Extras: \(datosDeQueso.0) Tipo de Masa en Extras: \(datosDeQueso.1) Tipo de Queso en Extras: \(datosDeQueso.2)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultado = extra()
        let sigVista = segue.destinationViewController as! VistaDeConfirmacion
        sigVista.confirmarOrden = resultado
    }
    
    @IBAction func textFieldEditingChanged(sender: UITextField) {
        if self.tipExtra.text!.isEmpty{
            print ("Vacio no avanzar")
            botonExtras.enabled = false
        }else{
            botonExtras.enabled = true
            recuperados.setObject(tipExtra.text!, forKey: "KeyExtra")

        }
    }
    @IBAction func textEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        tipExtra.resignFirstResponder()
    }
    
    @IBAction func agregarExtras(sender: AnyObject) {
        extra()
    }
    
    func extra() -> (String, String, String, String) {
        var tipoExtra: String = ""
        tipoExtra = self.tipExtra.text!
        print("Tamaño: \n\(datosDeQueso.0) Tipo de Masa: \n\(datosDeQueso.1) Queso: \n\(datosDeQueso.2)")
        recuperados.setObject(tipExtra.text!, forKey: "KeyExtra")
        return (datosDeQueso.0, datosDeQueso.1, datosDeQueso.2, tipoExtra)
    }


}
