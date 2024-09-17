

import Foundation
struct Brand_feature : Codable {
    let aDT : [ADT]?
    let cH : [CH]?
    let iN : [IN]?

    enum CodingKeys: String, CodingKey {

        case aDT = "ADT"
        case cH = "CH"
        case iN = "IN"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        aDT = try values.decodeIfPresent([ADT].self, forKey: .aDT)
        cH = try values.decodeIfPresent([CH].self, forKey: .cH)
        iN = try values.decodeIfPresent([IN].self, forKey: .iN)
    }

}
