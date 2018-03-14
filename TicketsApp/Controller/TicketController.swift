//
//  TicketController.swift
//  TicketsApp
//
//  Created by Mac on 14.03.2018.
//  Copyright © 2018 salgara. All rights reserved.
//

import UIKit

class TicketController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var allTickets: [TicketModel]!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        initData()
        
        tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height)
        tableView.register(TicketCell.self, forCellReuseIdentifier: "TicketCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        view.addSubview(tableView)
        
    }
    
    func initData(){
        allTickets = [TicketModel]()
        let ticket1 = TicketModel(fromCity: "Астана", toCity: "Павлодар", flight: "Canadair CRJ - Рейс DV-719", companyImage: #imageLiteral(resourceName: "scat-airlines"), fromDate: "14 декабря, ср", fromTime: "07:00", toTime: "07:45", toDate: "14 декабря, ср", duration: "0ч 45м", typeClass: "Эконом класс", cost: "12965")
        let ticket2 = TicketModel(fromCity: "Астана", toCity: "Павлодар", flight: "Embraer 190 - Рейс KC-315", companyImage: #imageLiteral(resourceName: "Air_Astana_logo"), fromDate: "14 декабря, ср", fromTime: "07:45   ", toTime: "08:55", toDate: "14 декабря, ср", duration: "1ч 10м", typeClass: "Эконом класс", cost: "16765")
        allTickets.append(ticket1)
        allTickets.append(ticket2)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTickets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath as IndexPath) as! TicketCell
        cell.initProperties(ticket: allTickets[indexPath.row])
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/3
    }
    
    
    
    
    
}
