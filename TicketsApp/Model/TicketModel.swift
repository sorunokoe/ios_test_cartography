
import UIKit

class TicketModel{
    
    var fromCity:String!
    var toCity: String!
    var flight: String!
    var companyImage: UIImage!
    
    var fromTime: String!
    var fromDate: String!
    
    var toTime: String!
    var toDate: String!
    
    var duration: String!
    
    var typeClass: String!
    var cost: String!
    
    init(fromCity:String, toCity:String, flight:String, companyImage: UIImage, fromDate: String, fromTime: String, toTime:String, toDate:String, duration:String, typeClass:String, cost:String) {
        self.fromCity = fromCity
        self.toCity = toCity
        self.flight = flight
        self.companyImage = companyImage
        self.fromDate = fromDate
        self.fromTime = fromTime
        self.toDate = toDate
        self.toTime = toTime
        self.duration = duration
        self.typeClass = typeClass
        self.cost = cost
    }
    
}
