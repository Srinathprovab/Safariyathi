

import Foundation
struct CH : Codable {
	let free : [String]?
	let chargeable : [String]?

	enum CodingKeys: String, CodingKey {

		case free = "free"
		case chargeable = "chargeable"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		free = try values.decodeIfPresent([String].self, forKey: .free)
		chargeable = try values.decodeIfPresent([String].self, forKey: .chargeable)
	}

}
