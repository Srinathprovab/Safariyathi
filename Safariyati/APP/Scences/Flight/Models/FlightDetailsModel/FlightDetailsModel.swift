//
//  FlightDetailsModel.swift
//  Safariyati
//
//  Created by Admin on 13/09/24.
//

import Foundation



struct FlightDetailsModel : Codable {
    let priceDetails : PriceDetails?
    let status : Bool?
    let journeySummary : [JourneySummary]?
    let baggage_details : [Baggage_details]?
    let changecharges : Changecharges?
    let flightDetails : [[FlightDetails]]?
    let bag_data : [Bag_data]?
    let cancellation : Cancellation?

    enum CodingKeys: String, CodingKey {

        case priceDetails = "priceDetails"
        case status = "status"
        case journeySummary = "journeySummary"
        case baggage_details = "baggage_details"
        case changecharges = "changecharges"
        case flightDetails = "flightDetails"
        case bag_data = "bag_data"
        case cancellation = "cancellation"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        priceDetails = try values.decodeIfPresent(PriceDetails.self, forKey: .priceDetails)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        journeySummary = try values.decodeIfPresent([JourneySummary].self, forKey: .journeySummary)
        baggage_details = try values.decodeIfPresent([Baggage_details].self, forKey: .baggage_details)
        changecharges = try values.decodeIfPresent(Changecharges.self, forKey: .changecharges)
        flightDetails = try values.decodeIfPresent([[FlightDetails]].self, forKey: .flightDetails)
        bag_data = try values.decodeIfPresent([Bag_data].self, forKey: .bag_data)
        cancellation = try values.decodeIfPresent(Cancellation.self, forKey: .cancellation)
    }

}
