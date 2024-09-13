//
//  ActiveBookingSourceModel.swift
//  Safariyati
//
//  Created by Admin on 11/09/24.
//

import Foundation



struct ActiveBookingSourceModel : Codable {
    let status : Bool?
    let data : [BookingSourceData]?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([BookingSourceData].self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}




struct BookingSourceData : Codable {
    let source_id : String?
    let origin : String?

    enum CodingKeys: String, CodingKey {

        case source_id = "source_id"
        case origin = "origin"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source_id = try values.decodeIfPresent(String.self, forKey: .source_id)
        origin = try values.decodeIfPresent(String.self, forKey: .origin)
    }

}
