
import UIKit
import Cartography


class TicketCell: UITableViewCell{
    
    var city:UILabel
    var flight: UILabel
    var companyImage: UIImageView
    var fromTime: UILabel
    var fromDate: UILabel
    var toTime: UILabel
    var toDate: UILabel
    var duration: UILabel
    var typeClass: UILabel
    var preCost: UILabel
    var cost: UILabel
    var airplaneImage: UIImageView
    
    func initProperties(ticket: TicketModel) {
        self.city.text = ticket.fromCity+" - "+ticket.toCity
        self.flight.text = ticket.flight
        self.companyImage.image = ticket.companyImage
        self.fromDate.text = ticket.fromDate
        self.fromTime.text = ticket.fromTime
        self.toDate.text = ticket.toDate
        self.toTime.text = ticket.toTime
        self.duration.text = ticket.duration
        self.typeClass.text = ticket.typeClass
        self.cost.text = ticket.cost+" KZT"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        self.city = UILabel()
        self.flight = UILabel()
        self.fromTime = UILabel()
        self.fromDate = UILabel()
        self.toTime = UILabel()
        self.toDate = UILabel()
        self.duration = UILabel()
        self.typeClass = UILabel()
        self.cost = UILabel()
        self.companyImage = UIImageView()
        self.airplaneImage = UIImageView()
        self.preCost = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initViews()
        addView()
        setupConstraints()
    }
    
    func initViews(){
        city.textColor = .black
        city.font = UIFont.systemFont(ofSize: 18.0)
        
        flight.textColor = .gray
        flight.font = UIFont.systemFont(ofSize: 12.0)
        
        companyImage.contentMode = UIViewContentMode.scaleToFill
        
        fromTime.textColor = UIColor(red:0.11, green:0.44, blue:0.89, alpha:1.0)
        fromTime.font = UIFont.boldSystemFont(ofSize: 32.0)
        fromDate.textColor = .gray
        fromDate.font = UIFont.systemFont(ofSize: 12.0)
        
        airplaneImage.image = #imageLiteral(resourceName: "Vector-1")
        airplaneImage.contentMode = UIViewContentMode.scaleToFill
        
        toTime.textColor = UIColor(red:0.11, green:0.44, blue:0.89, alpha:1.0)
        toTime.font = UIFont.boldSystemFont(ofSize: 32.0)
        toDate.textColor = .gray
        toDate.font = UIFont.systemFont(ofSize: 12.0)
        
        duration.textColor = .gray
        duration.font = UIFont.systemFont(ofSize: 12.0)
        
        typeClass.textColor = .black
        typeClass.font = UIFont.systemFont(ofSize: 16.0)
        
        cost.textColor = UIColor(red:0.11, green:0.44, blue:0.89, alpha:1.0)
        cost.font = UIFont.systemFont(ofSize: 17.0)
        
        preCost.text = "Стоимость от"
        preCost.textColor = .black
        preCost.font = UIFont.systemFont(ofSize: 16.0)
        
    }
    func addView(){
        self.addSubview(city)
        self.addSubview(flight)
        self.addSubview(fromTime)
        self.addSubview(fromDate)
        self.addSubview(toTime)
        self.addSubview(toDate)
        self.addSubview(duration)
        self.addSubview(typeClass)
        self.addSubview(cost)
        self.addSubview(companyImage)
        self.addSubview(airplaneImage)
        self.addSubview(preCost)
    }
    func setupConstraints(){
        constrain(city, self){label, view in
            label.top == view.top+10
            label.left == view.left+20
            label.width == view.width/2
            label.height == 20
        }
        constrain(city, flight, self){city, flight, view in
            flight.top == city.bottom+5
            flight.left == view.left+20
            flight.width == view.width/1.5
            flight.height == 20
        }
        constrain(companyImage, self){image, view in
            image.width == view.width/4
            image.height == 30
            image.top == view.top+10
            image.right == view.right-20
        }
        constrain(flight, fromTime, fromDate, self){ flight, time, date, view in
            time.top == flight.bottom+10
            time.left == view.left+20
            date.top == time.bottom+5
            date.left == view.left+20
            time.width == view.width/3
            date.width == view.width/3
        }
        constrain(flight, fromTime, airplaneImage, self){ flight, time, image, view in
            image.centerX == view.centerX
            image.top == flight.bottom+10
            image.width == 25
            image.height == 25
        }
        constrain(airplaneImage, duration, self){image, label, view in
            label.centerX == view.centerX
            label.top == image.bottom+5
        }
        constrain(flight, toTime, toDate, self){ flight, time, date, view in
            time.top == flight.bottom+10
            time.right == view.right+20
            date.top == time.bottom+5
            date.right == view.right+20
            time.width == view.width/3
            date.width == view.width/3
        }
        constrain(fromDate, typeClass, self){date, type, view in
            type.top == date.bottom+25
            type.left == view.left+20
            type.width == view.width/3
        }
        constrain(fromDate, cost, self){date, cost, view in
            cost.top == date.bottom+25
            cost.right == view.right-20
        }
        constrain(fromDate, preCost, cost, self){date, precost, cost, view in
            precost.top == date.bottom+25
            precost.right == cost.left-10
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
