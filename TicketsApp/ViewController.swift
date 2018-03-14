//
//  ViewController.swift
//  TicketsApp
//
//  Created by Mac on 14.03.2018.
//  Copyright © 2018 salgara. All rights reserved.
//

import UIKit
import Cartography

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.11, green:0.44, blue:0.89, alpha:1.0)
        let bar_title = UIBarButtonItem(title: "Авиабилеты", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        bar_title.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = bar_title
        
        tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height)
        tableView.register(FindTicketCell.self, forCellReuseIdentifier: "FindTicketCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
//        let textLable = UILabel()
//        textLable.text = "Hello World"
//        view.addSubview(textLable)
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindTicketCell", for: indexPath as IndexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height
    }
    
    
    
    
    
    

    
    

}

