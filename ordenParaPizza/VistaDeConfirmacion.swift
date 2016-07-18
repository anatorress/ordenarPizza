//
//  VistaDeConfirmacion.swift
//  ordenParaPizza
//
//  Created by Ana Torres on 18/07/16.
//  Copyright © 2016 Softm. All rights reserved.
//

import UIKit

class VistaDeConfirmacion: UIViewController {

    @IBOutlet weak var ordenFinal: UILabel!
    let recuperados = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var confirmarOrden: (String, String, String, String) = ("", "","", "")
    
    override func viewWillAppear(animated: Bool) {
        ordenFinal.text = "Tamaño Pizza: \(confirmarOrden.0)\nTipo de Masa: \(confirmarOrden.1)\nTipo de Queso: \(confirmarOrden.2)\nIngredientes Extra: \(confirmarOrden.3)"
        print("Tamaño Pizza: \(confirmarOrden.0)\nTipo de Masa: \(confirmarOrden.1)\nTipo de Queso: \(confirmarOrden.2)\nIngredientes Extra: \(confirmarOrden.3)")
    }

    @IBAction func confirmar(sender: AnyObject) {
        let alertView = UIAlertController(title: "Confirmación", message: "Tu orden se ha mandado a la cocina exitosamente.", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertView.addAction(defaultAction)
        
        self.presentViewController(alertView, animated: true, completion: nil)
    }

}
