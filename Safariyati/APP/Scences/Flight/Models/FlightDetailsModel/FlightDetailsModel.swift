//
//  FlightDetailsModel.swift
//  Safariyati
//
//  Created by Admin on 13/09/24.
//

import Foundation



struct FlightDetailsModel : Codable {
    let status : Bool?
    let journeySummary : [JourneySummary]?
    let flightDetails : [[FlightDetails]]?
    let baggage_details : [Baggage_details]?
    let priceDetails : PriceDetails?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case journeySummary = "journeySummary"
        case flightDetails = "flightDetails"
        case baggage_details = "baggage_details"
        case priceDetails = "priceDetails"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        journeySummary = try values.decodeIfPresent([JourneySummary].self, forKey: .journeySummary)
        flightDetails = try values.decodeIfPresent([[FlightDetails]].self, forKey: .flightDetails)
        baggage_details = try values.decodeIfPresent([Baggage_details].self, forKey: .baggage_details)
        priceDetails = try values.decodeIfPresent(PriceDetails.self, forKey: .priceDetails)
    }

}
