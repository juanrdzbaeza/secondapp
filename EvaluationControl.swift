//
//  EvaluationControl.swift
//  secondapp
//
//  Created by Juan Rodríguez Baeza on 9/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class EvaluationControl: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK Atributos
    var gradoAfinidad = 0 {
        didSet{
            actualizaEstrellas()
        }
    }
    var botones = [UIButton]()
    
    // MARK: inicializacion
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //let alto = self.frame.height
        //let alto = CGFloat(44)
        //let ancho = self.frame.width/5
        for i in 0..<5{
            let boton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            //boton.backgroundColor = UIColor.greenColor()
            boton.setImage(UIImage(named:"estrella vacia"), forState: .Normal)
            boton.setImage(UIImage(named:"estrella llena" ), forState: .Selected)
            boton.adjustsImageWhenHighlighted = false
            boton.addTarget(self, action: #selector(btnEval(_:)), forControlEvents: .TouchDown)
            boton.tag = i+1
            botones += [boton]
            addSubview(boton)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    override func layoutSubviews() {
        let alto = self.frame.size.height
        let espacioLibre = Int(Int(self.frame.size.width) - Int(alto) * botones.count)
        let espaciado = Int(espacioLibre / botones.count)
        
        for(i, boton) in botones.enumerate(){
            boton.frame.origin.x = CGFloat(i * (Int(alto) + espaciado))
            boton.frame.size.height = alto
            boton.frame.size.width = alto
        }
        
        actualizaEstrellas()
    }
    
    func btnEval(boton: UIButton) {
        //print("Boton \(boton.tag) pulsato...")
        gradoAfinidad = botones.indexOf(boton)! + 1
        //actualizaEstrellas()
    }
    
    func actualizaEstrellas(){
        for (i, botonI) in botones.enumerate(){
            botonI.selected = gradoAfinidad > i
        }
    }
    
    
    
}
