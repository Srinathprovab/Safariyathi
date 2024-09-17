

import Foundation
struct Bag_data : Codable {
	let cNN_BAG : String?
	let destination : String?
	let aDT_BAG : String?
	let origin : String?
	let iNF_BAG : String?

	enum CodingKeys: String, CodingKey {

		case cNN_BAG = "CNN_BAG"
		case destination = "destination"
		case aDT_BAG = "ADT_BAG"
		case origin = "origin"
		case iNF_BAG = "INF_BAG"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cNN_BAG = try values.decodeIfPresent(String.self, forKey: .cNN_BAG)
		destination = try values.decodeIfPresent(String.self, forKey: .destination)
		aDT_BAG = try values.decodeIfPresent(String.self, forKey: .aDT_BAG)
		origin = try values.decodeIfPresent(String.self, forKey: .origin)
		iNF_BAG = try values.decodeIfPresent(String.self, forKey: .iNF_BAG)
	}

}
