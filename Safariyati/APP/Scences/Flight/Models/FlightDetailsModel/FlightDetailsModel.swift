//
//  FlightDetailsModel.swift
//  Safariyati
//
//  Created by Admin on 13/09/24.
//

import Foundation



struct FlightDetailsModel : Codable {
    let priceDetails : PriceDetails?
    let changecharges : Changecharges?
    let journeySummary : [JourneySummary]?
    let flightDetails : [[FlightDetails]]?
    let status : Bool?
    let cancellation : Cancellation?
    let baggage_details : [Baggage_details]?

    enum CodingKeys: String, CodingKey {

        case priceDetails = "priceDetails"
        case changecharges = "changecharges"
        case journeySummary = "journeySummary"
        case flightDetails = "flightDetails"
        case status = "status"
        case cancellation = "cancellation"
        case baggage_details = "baggage_details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        priceDetails = try values.decodeIfPresent(PriceDetails.self, forKey: .priceDetails)
        changecharges = try values.decodeIfPresent(Changecharges.self, forKey: .changecharges)
        journeySummary = try values.decodeIfPresent([JourneySummary].self, forKey: .journeySummary)
        flightDetails = try values.decodeIfPresent([[FlightDetails]].self, forKey: .flightDetails)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        cancellation = try values.decodeIfPresent(Cancellation.self, forKey: .cancellation)
        baggage_details = try values.decodeIfPresent([Baggage_details].self, forKey: .baggage_details)
    }

}
