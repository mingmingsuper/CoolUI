//
//  ViewController.swift
//  CoolUI
//
//  Created by liumingming on 2017/7/13.
//  Copyright © 2017年 LMM. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var mTableView: UITableView!

    lazy var mViewModel = DemoViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI()
    {
        self.title = "测试Demo"
        mTableView.estimatedRowHeight = 50
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mViewModel.rows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DemoItemCell
        cell.mTitleLabel.text = mViewModel.name(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let segue = mViewModel.segue(indexPath)
        self.performSegue(withIdentifier: segue, sender: nil)
    }
}
