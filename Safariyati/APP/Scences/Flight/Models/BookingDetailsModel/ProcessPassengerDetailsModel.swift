//
//  ProcessPassengerDetailsModel.swift
//  Safariyati
//
//  Created by Admin on 21/09/24.
//

import Foundation



struct ProcessPassengerDetailsModel : Codable {
    let status : Bool?
    let app_reference : String?
    let booking_source : String?
    let search_id : String?
    let message : String?
    let url : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case app_reference = "app_reference"
        case booking_source = "booking_source"
        case search_id = "search_id"
        case message = "message"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        app_reference = try values.decodeIfPresent(String.self, forKey: .app_reference)
        booking_source = try values.decodeIfPresent(String.self, forKey: .booking_source)
        search_id = try values.decodeIfPresent(String.self, forKey: .search_id)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}
