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
    let farebreckdown : [Farebreckdown]?
    let hand_bag : String?
    let baggage : [Baggage]?
    let baggage_key : [String]?
    let cancellation : String?
    let cancellation_charges : Cancellation_charges?
    let brand_feature : [Brand_feature]?
    let date_change : String?
    let include_bag : String?
   // let fare_access_key : String?
    let fare_price : String?
    let fare_heading : String?

    enum CodingKeys: String, CodingKey {

        case farebreckdown = "farebreckdown"
        case hand_bag = "hand_bag"
        case baggage = "baggage"
        case baggage_key = "baggage_key"
        case cancellation = "cancellation"
        case cancellation_charges = "Cancellation_charges"
        case brand_feature = "brand_feature"
        case date_change = "date_change"
        case include_bag = "include_bag"
     //   case fare_access_key = "fare_access_key"
        case fare_price = "fare_price"
        case fare_heading = "fare_heading"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        farebreckdown = try values.decodeIfPresent([Farebreckdown].self, forKey: .farebreckdown)
        hand_bag = try values.decodeIfPresent(String.self, forKey: .hand_bag)
        baggage = try values.decodeIfPresent([Baggage].self, forKey: .baggage)
        baggage_key = try values.decodeIfPresent([String].self, forKey: .baggage_key)
        cancellation = try values.decodeIfPresent(String.self, forKey: .cancellation)
        cancellation_charges = try values.decodeIfPresent(Cancellation_charges.self, forKey: .cancellation_charges)
        brand_feature = try values.decodeIfPresent([Brand_feature].self, forKey: .brand_feature)
        date_change = try values.decodeIfPresent(String.self, forKey: .date_change)
        include_bag = try values.decodeIfPresent(String.self, forKey: .include_bag)
    //    fare_access_key = try values.decodeIfPresent(String.self, forKey: .fare_access_key)
        fare_price = try values.decodeIfPresent(String.self, forKey: .fare_price)
        fare_heading = try values.decodeIfPresent(String.self, forKey: .fare_heading)
    }

}
