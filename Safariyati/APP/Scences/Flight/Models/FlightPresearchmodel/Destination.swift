

import Foundation
struct Destination : Codable {
	let loc : String?
	let city : String?
	let city_name : String?
	let date : String?
	let datetime : String?
	let time : String?
	//let fdtv : Int?
	let terminal : String?
	let airport_name : String?

	enum CodingKeys: String, CodingKey {

		case loc = "loc"
		case city = "city"
		case city_name = "city_name"
		case date = "date"
		case datetime = "datetime"
		case time = "time"
	//	case fdtv = "fdtv"
		case terminal = "terminal"
		case airport_name = "airport_name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		loc = try values.decodeIfPresent(String.self, forKey: .loc)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		datetime = try values.decodeIfPresent(String.self, forKey: .datetime)
		time = try values.decodeIfPresent(String.self, forKey: .time)
	//	fdtv = try values.decodeIfPresent(Int.self, forKey: .fdtv)
		terminal = try values.decodeIfPresent(String.self, forKey: .terminal)
		airport_name = try values.decodeIfPresent(String.self, forKey: .airport_name)
	}

}
