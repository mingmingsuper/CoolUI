//
//  DemoViewModel.swift
//  CoolUI
//
//  Created by liumingming on 2017/7/13.
//  Copyright © 2017年 LMM. All rights reserved.
//

import UIKit

class DemoViewModel
{
    var mMenus:[CellModel] = []
    
    init()
    {
        createMenus()
    }
    
    func createMenus()
    {
        mMenus.append(CellModel("touchLabel","特殊点击事件Label"))
    }
    
    func rows() -> Int
    {
        return mMenus.count
    }
    
    func name(_ indexPath:IndexPath) -> String
    {
        return mMenus[indexPath.row].name
    }
    
    func segue(_ indexPath:IndexPath) -> String
    {
        return mMenus[indexPath.row].segue
    }
}
