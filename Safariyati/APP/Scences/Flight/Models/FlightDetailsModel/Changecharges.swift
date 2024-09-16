

import Foundation
struct Changecharges : Codable {
	let aDT : String?
	let cNN : String?
	let iNF : String?

	enum CodingKeys: String, CodingKey {

		case aDT = "ADT"
		case cNN = "CNN"
		case iNF = "INF"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		aDT = try values.decodeIfPresent(String.self, forKey: .aDT)
		cNN = try values.decodeIfPresent(String.self, forKey: .cNN)
		iNF = try values.decodeIfPresent(String.self, forKey: .iNF)
	}

}
