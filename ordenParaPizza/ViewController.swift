//
//  ViewController.swift
//  ordenParaPizza
//
//  Created by Ana Torres on 18/07/16.
//  Copyright © 2016 Softm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var botonSize: UIButton!
    @IBOutlet weak var sizePizza: UITextField!
    //var recuperada = ""
    let recuperados = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sizePizza.text = recuperada
        let loadedString = recuperados.stringForKey("KeySize") ?? ""
        sizePizza.text = loadedString
        // Do any additional setup after loading the view, typically from a nib.
        if self.sizePizza.text!.isEmpty{
            print ("Vacio no avanzar")
            botonSize.enabled = false
        }else{
            botonSize.enabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultado = sizeP()
        let sigVista = segue.destinationViewController as! VistaDeMasa
        sigVista.tamañoPizza = resultado
    }

    @IBAction func textEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textFieldEditingaChanged(sender: UITextField) {
        if self.sizePizza.text!.isEmpty{
            print ("Vacio no avanzar")
            botonSize.enabled = false
        }else{
            botonSize.enabled = true
            recuperados.setObject(sizePizza.text!, forKey: "KeySize")
        }
    }
    @IBAction func backgroundTap(sender: UIControl) {
        sizePizza.resignFirstResponder()
    }
    
    @IBAction func agregaSize(sender: AnyObject) {
        //let tfprov = self.sizePizza.text!
        sizeP()
    }
    
    func sizeP () -> String{
        var size: String = ""
        size = self.sizePizza.text!
        print ("Tamaño: \(size)")
        //recuperada = size
        recuperados.setObject(sizePizza.text!, forKey: "KeySize")
        return size
    }
    
}

