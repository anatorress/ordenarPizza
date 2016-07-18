//
//  VistaDeMasa.swift
//  ordenParaPizza
//
//  Created by Ana Torres on 18/07/16.
//  Copyright © 2016 Softm. All rights reserved.
//

import UIKit

class VistaDeMasa: UIViewController {

    @IBOutlet weak var botonMasa: UIButton!
    @IBOutlet weak var tipMasa: UITextField!
    //var recuperada = ""
    let recuperados = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tipMasa.text=recuperada

        // Do any additional setup after loading the view.
        let loadedString = recuperados.stringForKey("KeyMasa") ?? ""
        tipMasa.text = loadedString
        if self.tipMasa.text!.isEmpty{
            print ("Vacio no avanzar")
            botonMasa.enabled = false
        }else{
            botonMasa.enabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var tamañoPizza: String = ""
    
    override func viewWillAppear(animated: Bool) {
        //resultadoIMC.text = String(indiceIM)
        print("Tamaño Pizza en Masa: \(tamañoPizza)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultado = masa()
        let sigVista = segue.destinationViewController as! VistaDeQueso
        sigVista.datosDeMasa = resultado
    }
    
    @IBAction func textEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textFieldEditingChanged(sender: UITextField) {
        if self.tipMasa.text!.isEmpty{
            print ("Vacio no avanzar")
            botonMasa.enabled = false
        }else{
            botonMasa.enabled = true
            recuperados.setObject(tipMasa.text!, forKey: "KeyMasa")

        }
        //recuperada = self.tipMasa.text!
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        tipMasa.resignFirstResponder()
    }
    
    @IBAction func agregarMasa(sender: AnyObject) {
        masa()
    }
    
    func masa() -> (String, String) {
        var tipoMasa: String = ""
        tipoMasa = self.tipMasa.text!
        print("Tamaño: \n\(tamañoPizza) Tipo de Masa: \n\(tipoMasa)")
        recuperados.setObject(tipMasa.text!, forKey: "KeyMasa")
        return (tamañoPizza, tipoMasa)
    }

}
