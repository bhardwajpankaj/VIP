//
//  LargeTapAreaButton.swift
//  David
//
//  Created by Ankit Agarwal on 01/04/19.
//  Copyright © 2019 MacTest. All rights reserved.
//

import UIKit

class LargeTapAreaButton: UIButton {
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let newArea = CGRect(
            x: self.bounds.origin.x - 5.0,
            y: self.bounds.origin.y - 5.0,
            width: self.bounds.size.width + 10.0,
            height: self.bounds.size.height + 20.0
        )
        return newArea.contains(point)
    }
}
