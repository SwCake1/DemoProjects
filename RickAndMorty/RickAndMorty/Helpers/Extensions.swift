//
//  Extensions.swift
//  RickAndMorty
//
//  Created by pennyworth on 10/21/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
