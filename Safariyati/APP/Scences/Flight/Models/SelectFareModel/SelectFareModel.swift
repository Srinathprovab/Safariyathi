//
//  SelectFareModel.swift
//  Safariyati
//
//  Created by Admin on 17/09/24.
//

import Foundation



struct SelectFareModel : Codable {
    let data : [SelectFareData]?
    let status : Bool?
    let msg : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case msg = "msg"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([SelectFareData].self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
    }

}


struct SelectFareData : Codable {
    let fare_heading : String?
    let hand_bag : String?
    let brand_feature : Brand_feature?
  //  let baggage : Baggage?
    let cancellation : String?
    let date_change : String?
    let include_bag : String?
    let fare_price : String?
    let cancellation_charges : Cancellation_charges?

    enum CodingKeys: String, CodingKey {

        case fare_heading = "fare_heading"
        case hand_bag = "hand_bag"
        case brand_feature = "brand_feature"
   //     case baggage = "baggage"
        case cancellation = "cancellation"
        case date_change = "date_change"
        case include_bag = "include_bag"
        case fare_price = "fare_price"
        case cancellation_charges = "Cancellation_charges"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fare_heading = try values.decodeIfPresent(String.self, forKey: .fare_heading)
        hand_bag = try values.decodeIfPresent(String.self, forKey: .hand_bag)
        brand_feature = try values.decodeIfPresent(Brand_feature.self, forKey: .brand_feature)
    //    baggage = try values.decodeIfPresent(Baggage.self, forKey: .baggage)
        cancellation = try values.decodeIfPresent(String.self, forKey: .cancellation)
        date_change = try values.decodeIfPresent(String.self, forKey: .date_change)
        include_bag = try values.decodeIfPresent(String.self, forKey: .include_bag)
        fare_price = try values.decodeIfPresent(String.self, forKey: .fare_price)
        cancellation_charges = try values.decodeIfPresent(Cancellation_charges.self, forKey: .cancellation_charges)
    }

}
