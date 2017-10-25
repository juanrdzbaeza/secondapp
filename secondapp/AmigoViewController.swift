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

    
/*
 *   Este atributo tendrá doble papel:
 *      1) Referencia que guarda los datos del amigo que queremos
 *      almacenar. Esto se utiliza cuando pulsamos el botón Save.
 *      2) Referencia al amigo cuyos datos queremos editar. Esto se utilizará
 *      cuando editemos un registro ya existente.
 */
    //MARK: atributo
    var amigo: Amigo?
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nombreTxt.delegate  = self;
        if (amigo === nil) {    //  modificacion para sesion5
            saveBtn.enabled     = false; //ejercicio 5 sesion 4
        }else{
            nombreTxt.text                  = amigo?.nombre
            imagen.image                    = amigo?.foto
            controlEvaluacion.gradoAfinidad = amigo!.gradoAfinidad
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*
 *  Nuestro controlador de vista detalle (AmigoViewController) se abre de dos
 *  formas distintas:
 *
 *    1. Para crear un nuevo registro
 *    2. Editar uno existente
 */
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
/*
 *  Ahora tenemos dos formas de acceder a la vista detalle: 
 *      (1) a través de un segue modal y
 *      (2) a través de un segue push.
 *  En el segundo caso es necesario desapilar el controlador de vista de la pila de navegación.
 *  Y esta operación se realiza haciendo uso del método popViewControllerAnimated(_:).
 *  Lo que tenemos que hacer ahora es discriminar el tipo de navegación…para
 *  poder cerrar la ventana de una manera adecuada.
 */
    @IBAction func cancelar(sender: UIBarButtonItem) {
        if presentingViewController is UINavigationController{
            dismissViewControllerAnimated(true, completion: nil)
        }else{
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if (nombreTxt.text != "") {
            saveBtn.enabled = true  // ejercicio 5 sesion 4
        }
        if nombreTxt.text == "" {
            saveBtn.enabled = false
        }
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