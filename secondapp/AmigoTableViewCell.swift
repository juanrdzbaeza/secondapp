//
//  AmigoTableViewCell.swift
//  secondapp
//
//  Created by Juan Rodríguez Baeza on 16/10/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class AmigoTableViewCell: UITableViewCell {

    //MARK: propiedades
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var evaluacion: EvaluationControl!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
