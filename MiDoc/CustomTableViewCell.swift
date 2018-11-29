//
//  CustomTableViewCell.swift
//  MiDoc
//
//  Created by leon on 11/27/18.
//  Copyright © 2018 leon. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var medNombreTitle: UILabel!
    @IBOutlet weak var PANombreTitle: UILabel!
    @IBOutlet weak var proxTomaTitle: UILabel!
    @IBOutlet weak var tipoMedImage: UIImageView!
    @IBOutlet weak var descripcionTitle: UILabel!
    
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 15
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    
}
