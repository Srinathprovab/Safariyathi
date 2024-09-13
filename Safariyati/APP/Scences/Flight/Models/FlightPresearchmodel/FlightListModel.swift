//
//  FlightListModel.swift
//  Safariyati
//
//  Created by Admin on 11/09/24.
//

import Foundation

struct FlightListModel : Codable {
    let data : FlightData?
    let msg : String?
    let status : Bool?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case msg = "msg"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(FlightData.self, forKey: .data)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
    }

}



struct FlightData : Codable {
    let col_2x_result : Bool?
    let is_domestic : Bool?
    let search_params : Search_params?
    let search_id : String?
    let j_flight_list : [[J_flight_list]]?
    let journey_id : Int?
    let traceId : String?

    enum CodingKeys: String, CodingKey {

        case col_2x_result = "col_2x_result"
        case is_domestic = "is_domestic"
        case search_params = "search_params"
        case search_id = "search_id"
        case j_flight_list = "j_flight_list"
        case journey_id = "journey_id"
        case traceId = "traceId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        col_2x_result = try values.decodeIfPresent(Bool.self, forKey: .col_2x_result)
        is_domestic = try values.decodeIfPresent(Bool.self, forKey: .is_domestic)
        search_params = try values.decodeIfPresent(Search_params.self, forKey: .search_params)
        search_id = try values.decodeIfPresent(String.self, forKey: .search_id)
        j_flight_list = try values.decodeIfPresent([[J_flight_list]].self, forKey: .j_flight_list)
        journey_id = try values.decodeIfPresent(Int.self, forKey: .journey_id)
        traceId = try values.decodeIfPresent(String.self, forKey: .traceId)
    }

}
