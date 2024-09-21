//
//  IndexModel.swift
//  Safariyati
//
//  Created by Admin on 20/09/24.
//

import Foundation



struct IndexModel : Codable {
    let flight_top_destinations : [Flight_top_destinations]?
    let top_destination_hotel : [Top_destination_hotel]?
    let perfect_holidays : [Perfect_holidays]?

    enum CodingKeys: String, CodingKey {

        case flight_top_destinations = "flight_top_destinations"
        case top_destination_hotel = "top_destination_hotel"
        case perfect_holidays = "perfect_holidays"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flight_top_destinations = try values.decodeIfPresent([Flight_top_destinations].self, forKey: .flight_top_destinations)
        top_destination_hotel = try values.decodeIfPresent([Top_destination_hotel].self, forKey: .top_destination_hotel)
        perfect_holidays = try values.decodeIfPresent([Perfect_holidays].self, forKey: .perfect_holidays)
    }

}
