//
//  AmigoTableViewController.swift
//  secondapp
//
//  Created by Juan Rodríguez Baeza on 16/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class AmigoTableViewController: UITableViewController {
/*
 * creamos un observador de la variable amigos para que si nota algun cambio guarde la informacion
 */
    var amigos = [Amigo](){
        didSet{
            guardarDatos()
        }
    }
    //var amigos = [Amigo?]() // ejercicio 2 sesion 4
/*
 *  Con esta línea creamos un botón especial (tipo Edit) en la parte izquierda
 *  de la barra de navegación. Atención al método cargarDatosEjemplo() …
 *  simplemente por legibilidad y claridad en el código.
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem() // modificacion sesion 5
        self.editButtonItem().title = "Editar" // cambiamos el nombre del boton al cargar la vista
        cargarDatos()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    /* el fichero de persistencia de datos ya ha sido creado y contiene datos, por lo que a priori este metodo ya no es necesario
    func cargarDatosEjemplo(){
        let amigo1 = Amigo(nombre: "Selu y Juan", foto: UIImage(named:"SeluYJuan")!, gAfinidad: 5)
        let amigo2 = Amigo(nombre: "Yuyu", foto: UIImage(named:"YuyuCirujano")!, gAfinidad: 4)
        let amigo3 = Amigo(nombre: "Manolo santander", foto: UIImage(named:"SantanderPeperoni")!, gAfinidad: 5)
        amigos += [amigo1!, amigo2!, amigo3!]
        //amigos += [amigo1, amigo2, amigo3] // ejercicio 2 sesion 4
    }
    */
    func cargarDatos(){
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(Amigo.amigoURL.path!) as? [Amigo] {
            self.amigos += array
        }else{
            //como tampoco es su llamada desde este punto del programa, en principio nunca se escribirá este print
            //cargarDatosEjemplo()
            print("aqui no entra")
        }
    }
    
    func guardarDatos() {
        let exito = NSKeyedArchiver.archiveRootObject(self.amigos, toFile: Amigo.amigoURL.path!)
        if !exito {
            print("error")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return amigos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AmigoTableViewCell", forIndexPath: indexPath) as! AmigoTableViewCell
        cell.nombre.text                = amigos[indexPath.row].nombre
        cell.foto.image                 = amigos[indexPath.row].foto
        cell.evaluacion.gradoAfinidad   = amigos[indexPath.row].gradoAfinidad
        cell.accessoryType = .Checkmark //ejercicio 3 sesion 4
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.beginUpdates()
        tableView.reloadRowsAtIndexPaths(tableView.indexPathsForVisibleRows!, withRowAnimation: .Automatic)
        tableView.endUpdates()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle != .Delete { return }
        amigos.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if segue.identifier != "mostrarDetalle" {return}
        
        let celdaRef    = sender as! AmigoTableViewCell
        let destinoVC   = segue.destinationViewController as! AmigoViewController
        
        let filaSeleccionada    = tableView.indexPathForCell(celdaRef)
        destinoVC.amigo         = amigos[(filaSeleccionada?.row)!]
    }
/*
 *  Modificamos los titulos de los botones en el modo de edición para cuando se entra en dicho modo
 *  le asignamos OK, y para cuando salga el mismo nombre que al ser cargada la vista Editar.
 */
    override func setEditing (editing:Bool, animated:Bool)    {
        super.setEditing(editing,animated:animated)
        if(self.editing){
            self.editButtonItem().title = "OK"
        }else{
            self.editButtonItem().title = "Editar"
        }
    }
    
/*
 *   Vamos a crear un nuevo método que, en función de una variable que
 *   determine el modo en el que se ha abierto la vista, llame a un método u
 *   otro. En concreto, vamos a eliminar el método existente y vamos a crear
 *   estos tres métodos:
 */
    // MARK: - Unwind segue desde AmigoViewController
    @IBAction func actualizaLista(sender: UIStoryboardSegue){
        let sourceViewController = sender.sourceViewController as! AmigoViewController
        
        if let idFilaSeleccionada = tableView.indexPathForSelectedRow {
            updateNuevoAmigo(sourceViewController.amigo!, idFila: idFilaSeleccionada)
        }else{
            addNuevoAmigo(sourceViewController.amigo!)
        }
        
    }
    func addNuevoAmigo(amigo: Amigo){
        amigos.append(amigo)
        let newIndexPath = NSIndexPath(forRow: amigos.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
    }
    func updateNuevoAmigo(amigo: Amigo, idFila: NSIndexPath){
        amigos[idFila.row] = amigo
        tableView.reloadRowsAtIndexPaths([idFila], withRowAnimation: .Fade)
    }
    
/*-----------------------------------------------------------------------*/
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
