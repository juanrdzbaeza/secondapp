//
//  Amigo.swift
//  secondapp
//
//  Created by Juan Rodríguez Baeza on 9/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class Amigo {
    //MARK: atributos
    
    var nombre: String
    var foto: UIImage?
    var gradoAfinidad: Int
    
    //MARK: Inicializacion
    
    init?(nombre: String, foto:UIImage?, gAfinidad:Int){
        if nombre.isEmpty || gAfinidad < 0 {
            return nil
        }
        self.nombre         = nombre
        self.foto           = foto
        self.gradoAfinidad  = gAfinidad
    }
    
    
}
