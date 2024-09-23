//
//  TourSearchListModel.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import Foundation



struct TourSearchListModel : Codable {
    
    let data : [TourSearchListData]?
    let status : Bool?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([TourSearchListData].self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
    }

}


struct TourSearchListData : Codable {
    let package_id : String?
    let duration : String?
    let package_name : String?
    let package_description : String?
    let inclusions_checks : [String]?
    let banner_image : String?
    let id : String?
    let price : Int?
    let currency : String?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case duration = "duration"
        case package_name = "package_name"
        case package_description = "package_description"
        case inclusions_checks = "inclusions_checks"
        case banner_image = "banner_image"
        case id = "id"
        case price = "price"
        case currency = "currency"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(String.self, forKey: .package_id)
        duration = try values.decodeIfPresent(String.self, forKey: .duration)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        package_description = try values.decodeIfPresent(String.self, forKey: .package_description)
        inclusions_checks = try values.decodeIfPresent([String].self, forKey: .inclusions_checks)
        banner_image = try values.decodeIfPresent(String.self, forKey: .banner_image)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
    }

}


