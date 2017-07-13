//
//  CellModel.swift
//  CoolUI
//
//  Created by liumingming on 2017/7/13.
//  Copyright © 2017年 LMM. All rights reserved.
//

struct CellModel
{
    var segue:String = ""
    var name:String = ""
    
    init(_ segue: String, _ name:String)
    {
        self.segue = segue
        self.name = name
    }
}
