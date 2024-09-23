//
//  TourPackageDetailsModel.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import Foundation



struct TourPackageDetailsModel : Codable {
    let tour_data : Tour_data?
    let tours_itinerary_dw : [Tours_itinerary_dw]?
    let tour_price : [Tour_price]?
    let tour_price_changed : [Tour_price_changed]?
    let min_price : Int?
    let adult_1_price : Int?
    let adult_2_price : Int?
    let adult_3_price : Int?
    let child_pricing : Int?

    enum CodingKeys: String, CodingKey {

        case tour_data = "tour_data"
        case tours_itinerary_dw = "tours_itinerary_dw"
        case tour_price = "tour_price"
        case tour_price_changed = "tour_price_changed"
        case min_price = "min_price"
        case adult_1_price = "adult_1_price"
        case adult_2_price = "adult_2_price"
        case adult_3_price = "adult_3_price"
        case child_pricing = "child_pricing"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tour_data = try values.decodeIfPresent(Tour_data.self, forKey: .tour_data)
        tours_itinerary_dw = try values.decodeIfPresent([Tours_itinerary_dw].self, forKey: .tours_itinerary_dw)
        tour_price = try values.decodeIfPresent([Tour_price].self, forKey: .tour_price)
        tour_price_changed = try values.decodeIfPresent([Tour_price_changed].self, forKey: .tour_price_changed)
        min_price = try values.decodeIfPresent(Int.self, forKey: .min_price)
        adult_1_price = try values.decodeIfPresent(Int.self, forKey: .adult_1_price)
        adult_2_price = try values.decodeIfPresent(Int.self, forKey: .adult_2_price)
        adult_3_price = try values.decodeIfPresent(Int.self, forKey: .adult_3_price)
        child_pricing = try values.decodeIfPresent(Int.self, forKey: .child_pricing)
    }

}
