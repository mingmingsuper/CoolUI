//
//  DemoItemCell.swift
//  CoolUI
//
//  Created by liumingming on 2017/7/13.
//  Copyright © 2017年 LMM. All rights reserved.
//

import UIKit

class DemoItemCell: UITableViewCell
{
    @IBOutlet weak var mTitleLabel: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.selectionStyle = .none
    }


}
