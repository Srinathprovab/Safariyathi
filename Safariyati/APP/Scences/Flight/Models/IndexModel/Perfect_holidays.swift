

import Foundation
struct Perfect_holidays : Codable {
	let id : String?
	let title : String?
	let holiday_id : String?
	let country_code : String?
	let country_name : String?
	let image : String?
	let status : String?
	let created_at : String?
	let updated_at : String?
	let package_name : String?
	let banner_image : String?
	let tours_continent : String?
	let tours_country : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case holiday_id = "holiday_id"
		case country_code = "country_code"
		case country_name = "country_name"
		case image = "image"
		case status = "status"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case package_name = "package_name"
		case banner_image = "banner_image"
		case tours_continent = "tours_continent"
		case tours_country = "tours_country"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		holiday_id = try values.decodeIfPresent(String.self, forKey: .holiday_id)
		country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
		country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
		banner_image = try values.decodeIfPresent(String.self, forKey: .banner_image)
		tours_continent = try values.decodeIfPresent(String.self, forKey: .tours_continent)
		tours_country = try values.decodeIfPresent(String.self, forKey: .tours_country)
	}

}
