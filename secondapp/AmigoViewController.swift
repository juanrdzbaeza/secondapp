//
//  ViewController.swift
//  secondapp
//
//  Created by Juan Rodríguez Baeza on 2/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class AmigoViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var controlEvaluacion: EvaluationControl!

    //MARK: atributo
    var amigo: Amigo?
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nombreTxt.delegate    = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender !== saveBtn) {return}
        amigo = Amigo(nombre: nombreTxt.text ?? "", foto: imagen.image, gAfinidad: controlEvaluacion.gradoAfinidad)
    }
    
    //MARK: Actions
   @IBAction func seleccionarImagen(sender: UITapGestureRecognizer) {
        nombreTxt.resignFirstResponder()
        let imagePickerCtrl         = UIImagePickerController()
        imagePickerCtrl.sourceType  = .PhotoLibrary
        imagePickerCtrl.delegate    = self
        presentViewController(imagePickerCtrl, animated:true, completion:nil)
    }
    
    @IBAction func cancelar(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
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