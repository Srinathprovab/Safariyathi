//
//  FlightClass.swift
//  Safariyati
//
//  Created by Admin on 11/09/24.
//

import Foundation

struct FlightClass : Codable {
    let name : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
