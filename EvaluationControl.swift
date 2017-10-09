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
    
    // MARK: inicializacion
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let boton = UIButton(frame: CGRect(x:0, y:0, width: 44, height: 44))
        boton.backgroundColor = UIColor.greenColor()
        addSubview(boton)
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    
    
    
    
    
    
    
    
    
    
}
