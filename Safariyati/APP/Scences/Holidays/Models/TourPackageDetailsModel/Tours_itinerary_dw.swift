

import Foundation
struct Tours_itinerary_dw : Codable {
	let id : String?
	let tour_id : String?
	let tour_code : String?
	let dep_date : String?
	let visited_city : String?
	let program_title : String?
	let program_des : String?
	let program_title_ar : String?
	let program_des_ar : String?
	let hotel_name : String?
	let rating : String?
	let accomodation : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case tour_id = "tour_id"
		case tour_code = "tour_code"
		case dep_date = "dep_date"
		case visited_city = "visited_city"
		case program_title = "program_title"
		case program_des = "program_des"
		case program_title_ar = "program_title_ar"
		case program_des_ar = "program_des_ar"
		case hotel_name = "hotel_name"
		case rating = "rating"
		case accomodation = "accomodation"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		tour_id = try values.decodeIfPresent(String.self, forKey: .tour_id)
		tour_code = try values.decodeIfPresent(String.self, forKey: .tour_code)
		dep_date = try values.decodeIfPresent(String.self, forKey: .dep_date)
		visited_city = try values.decodeIfPresent(String.self, forKey: .visited_city)
		program_title = try values.decodeIfPresent(String.self, forKey: .program_title)
		program_des = try values.decodeIfPresent(String.self, forKey: .program_des)
		program_title_ar = try values.decodeIfPresent(String.self, forKey: .program_title_ar)
		program_des_ar = try values.decodeIfPresent(String.self, forKey: .program_des_ar)
		hotel_name = try values.decodeIfPresent(String.self, forKey: .hotel_name)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		accomodation = try values.decodeIfPresent([String].self, forKey: .accomodation)
	}

}
