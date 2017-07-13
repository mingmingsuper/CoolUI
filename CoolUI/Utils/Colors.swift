//
//  Colors.swift
//  CoolUI
//
//  Created by liumingming on 2017/7/13.
//  Copyright © 2017年 LMM. All rights reserved.
//

import Foundation
import UIKit

public func color(_ red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat = 1.0) ->UIColor
{
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}
