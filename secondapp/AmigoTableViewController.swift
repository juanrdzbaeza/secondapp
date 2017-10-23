//
//  AmigoTableViewController.swift
//  secondapp
//
//  Created by Juan Rodríguez Baeza on 16/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class AmigoTableViewController: UITableViewController {
    
    var amigos = [Amigo]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let amigo1 = Amigo(nombre: "Selu y Juan", foto: UIImage(named:"SeluYJuan")!, gAfinidad: 5)
        let amigo2 = Amigo(nombre: "Yuyu", foto: UIImage(named:"YuyuCirujano")!, gAfinidad: 4)
        let amigo3 = Amigo(nombre: "Manolo santander", foto: UIImage(named:"SantanderPeperoni")!, gAfinidad: 5)
        amigos += [amigo1!, amigo2!, amigo3!]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        cell.nombre.text = amigos[indexPath.row].nombre
        cell.foto.image = amigos[indexPath.row].foto
        cell.evaluacion.gradoAfinidad = amigos[indexPath.row].gradoAfinidad
        return cell
    }
    
    // MARK: - Unwind segue desde AmigoViewController
    @IBAction func addNuevoAmigo(sender: UIStoryboardSegue){
        let sourceViewController = sender.sourceViewController as! AmigoViewController
        let nuevoAmigo = sourceViewController.amigo
        
        amigos.append(nuevoAmigo!)
        let newIndexPath = NSIndexPath(forRow: amigos.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.beginUpdates()
        tableView.reloadRowsAtIndexPaths(tableView.indexPathsForVisibleRows!, withRowAnimation: .Automatic)
        tableView.endUpdates()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
