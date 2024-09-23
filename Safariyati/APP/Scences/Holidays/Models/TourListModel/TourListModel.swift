//
//  TourListModel.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import Foundation



struct TourListModel : Codable {
    let data : [TourListData]?
    let status : Bool?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([TourListData].self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
    }

}


struct TourListData : Codable {
    let name : String?
    let value : String?
    let id : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case value = "value"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }

}
