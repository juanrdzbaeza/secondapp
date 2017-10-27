//
//  Amigo.swift
//  secondapp
//
//  Created by Juan Rodríguez Baeza on 9/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class Amigo: NSObject, NSCoding {
    //MARK: atributos
    
    var nombre: String
    var foto: UIImage?
    var gradoAfinidad: Int

/*
 * A continuación, tendremos que crear un camino persistente al sistema de
 * archivos en el que los datos serán almacenados. Para ello, crearemos dos
 * nuevas propiedades en Amigo.swift:
 */
    //MARK: atributos de clase
    static let directorio = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let amigoURL = directorio.URLByAppendingPathComponent("listadoAmigos")
    
    //MARK: Inicializacion
    init?(nombre: String, foto:UIImage?, gAfinidad:Int){
        if nombre.isEmpty || gAfinidad < 0 {
            return nil
            //self.nombre         = "juan"
            //self.gradoAfinidad  = 1       // posible solucion ejerccio 5 sesion 4 (mala solución)
        }
        self.nombre         = nombre
        self.foto           = foto
        self.gradoAfinidad  = gAfinidad
        super.init()
    }
    
/*
 * Inmediatamente, veréis que Xcode se quejará ya que la clase Amigo no
 * conforma con el protocolo NSCoding… Este protocolo declara dos
 * métodos que toda clase que lo adopte debe implementar:
 */
    required convenience init?(coder aDecoder: NSCoder) {
        let nombre          = aDecoder.decodeObjectForKey("Nombre") as! String
        let foto            = aDecoder.decodeObjectForKey("Foto") as? UIImage
        let gradoAfinidad   = aDecoder.decodeIntegerForKey("GradoAfinidad")
        
        self.init(nombre: nombre, foto: foto, gAfinidad: gradoAfinidad)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(nombre, forKey: "Nombre")
        aCoder.encodeObject(foto, forKey: "Foto")
        aCoder.encodeInteger(gradoAfinidad, forKey: "GradoAfinidad")
    }
}
