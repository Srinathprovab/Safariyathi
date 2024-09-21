//
//  CountryListModel.swift
//  Safariyati
//
//  Created by Admin on 19/09/24.
//

import Foundation

struct CountryListModel : Codable {
    let status : Bool?
    let all_country_code_list : [Country_list]?
    let msg : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case all_country_code_list = "all_country_code_list"
        case msg = "msg"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        all_country_code_list = try values.decodeIfPresent([Country_list].self, forKey: .all_country_code_list)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
    }

}
