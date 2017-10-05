//
//  ViewController.swift
//  secondapp
//
//  Created by Juan Rodríguez Baeza on 2/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var imagen: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nombreTxt.delegate    = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func botonReset(sender: UIButton) {
        nombreLabel.text    = "Hola desconocido"
        imagen.image        = UIImage(named: "imagen predeterminada")
    }
    
   @IBAction func seleccionarImagen(sender: UITapGestureRecognizer) {
        nombreTxt.resignFirstResponder()
        let imagePickerCtrl         = UIImagePickerController()
        imagePickerCtrl.sourceType  = .PhotoLibrary
        imagePickerCtrl.delegate    = self
        presentViewController(imagePickerCtrl, animated:true, completion:nil)
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if nombreTxt.text != "" {
            nombreLabel.text    = "Hola "+nombreTxt.text!
            nombreTxt.text      = nil
        }else{
            nombreLabel.text = "Hola desconocido"
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage   = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagen.image        = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
        
    }

}




























