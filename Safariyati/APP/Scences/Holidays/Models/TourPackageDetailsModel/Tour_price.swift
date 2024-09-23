

import Foundation
struct Tour_price : Codable {
	let pricing : String?
	let airliner_price : String?
	let child_pricing : String?
	let occ : String?
	let value_type : String?
	let markup : String?
	let calculated_markup : String?
	let calculated_child_markup : String?
	let tour_id : String?
	let from_date : String?
	let to_date : String?
	let occupancy_name : String?

	enum CodingKeys: String, CodingKey {

		case pricing = "pricing"
		case airliner_price = "airliner_price"
		case child_pricing = "child_pricing"
		case occ = "occ"
		case value_type = "value_type"
		case markup = "markup"
		case calculated_markup = "calculated_markup"
		case calculated_child_markup = "calculated_child_markup"
		case tour_id = "tour_id"
		case from_date = "from_date"
		case to_date = "to_date"
		case occupancy_name = "occupancy_name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pricing = try values.decodeIfPresent(String.self, forKey: .pricing)
		airliner_price = try values.decodeIfPresent(String.self, forKey: .airliner_price)
		child_pricing = try values.decodeIfPresent(String.self, forKey: .child_pricing)
		occ = try values.decodeIfPresent(String.self, forKey: .occ)
		value_type = try values.decodeIfPresent(String.self, forKey: .value_type)
		markup = try values.decodeIfPresent(String.self, forKey: .markup)
		calculated_markup = try values.decodeIfPresent(String.self, forKey: .calculated_markup)
		calculated_child_markup = try values.decodeIfPresent(String.self, forKey: .calculated_child_markup)
		tour_id = try values.decodeIfPresent(String.self, forKey: .tour_id)
		from_date = try values.decodeIfPresent(String.self, forKey: .from_date)
		to_date = try values.decodeIfPresent(String.self, forKey: .to_date)
		occupancy_name = try values.decodeIfPresent(String.self, forKey: .occupancy_name)
	}

}
