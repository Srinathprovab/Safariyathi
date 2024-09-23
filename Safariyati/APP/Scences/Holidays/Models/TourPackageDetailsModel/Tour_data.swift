

import Foundation
struct Tour_data : Codable {
	let id : String?
	let package_id : String?
	let package_name : String?
	let package_name_ar : String?
	let package_description_ar : String?
	let package_description : String?
	let expire_date : String?
	let destination : String?
	let tour_type : String?
	let theme : String?
	let tours_continent : String?
	let tours_country : String?
	let tours_city : String?
	let duration : String?
	let adult_twin_sharing : String?
	let adult_tripple_sharing : String?
	let child_with_bed : String?
	let child_without_bed : String?
	let joining_directly : String?
	let single_suppliment : String?
	let service_tax : String?
	let tcs : String?
	let highlights : String?
	let highlights_ar : String?
	let inclusions : String?
	let inclusions_ar : String?
	let exclusions_ar : String?
	let terms_ar : String?
	let canc_policy_ar : String?
	let trip_notes_ar : String?
	let exclusions : String?
	let terms : String?
	let canc_policy : String?
	let banner_image : String?
	let gallery : [String]?
	let image_description : String?
	let inclusions_checks : [String]?
	let date : String?
	let perfect_holidays : String?
	let agent_id : String?
	let admin_approve_status : String?
	let agent_request_status : String?
	let added_by : String?
	let supplier_name : String?
	let email : String?
	let trip_notes : String?
	let status : String?
	let status_delete : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case package_id = "package_id"
		case package_name = "package_name"
		case package_name_ar = "package_name_ar"
		case package_description_ar = "package_description_ar"
		case package_description = "package_description"
		case expire_date = "expire_date"
		case destination = "destination"
		case tour_type = "tour_type"
		case theme = "theme"
		case tours_continent = "tours_continent"
		case tours_country = "tours_country"
		case tours_city = "tours_city"
		case duration = "duration"
		case adult_twin_sharing = "adult_twin_sharing"
		case adult_tripple_sharing = "adult_tripple_sharing"
		case child_with_bed = "child_with_bed"
		case child_without_bed = "child_without_bed"
		case joining_directly = "joining_directly"
		case single_suppliment = "single_suppliment"
		case service_tax = "service_tax"
		case tcs = "tcs"
		case highlights = "highlights"
		case highlights_ar = "highlights_ar"
		case inclusions = "inclusions"
		case inclusions_ar = "inclusions_ar"
		case exclusions_ar = "exclusions_ar"
		case terms_ar = "terms_ar"
		case canc_policy_ar = "canc_policy_ar"
		case trip_notes_ar = "trip_notes_ar"
		case exclusions = "exclusions"
		case terms = "terms"
		case canc_policy = "canc_policy"
		case banner_image = "banner_image"
		case gallery = "gallery"
		case image_description = "image_description"
		case inclusions_checks = "inclusions_checks"
		case date = "date"
		case perfect_holidays = "perfect_holidays"
		case agent_id = "agent_id"
		case admin_approve_status = "admin_approve_status"
		case agent_request_status = "agent_request_status"
		case added_by = "added_by"
		case supplier_name = "supplier_name"
		case email = "email"
		case trip_notes = "trip_notes"
		case status = "status"
		case status_delete = "status_delete"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		package_id = try values.decodeIfPresent(String.self, forKey: .package_id)
		package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
		package_name_ar = try values.decodeIfPresent(String.self, forKey: .package_name_ar)
		package_description_ar = try values.decodeIfPresent(String.self, forKey: .package_description_ar)
		package_description = try values.decodeIfPresent(String.self, forKey: .package_description)
		expire_date = try values.decodeIfPresent(String.self, forKey: .expire_date)
		destination = try values.decodeIfPresent(String.self, forKey: .destination)
		tour_type = try values.decodeIfPresent(String.self, forKey: .tour_type)
		theme = try values.decodeIfPresent(String.self, forKey: .theme)
		tours_continent = try values.decodeIfPresent(String.self, forKey: .tours_continent)
		tours_country = try values.decodeIfPresent(String.self, forKey: .tours_country)
		tours_city = try values.decodeIfPresent(String.self, forKey: .tours_city)
		duration = try values.decodeIfPresent(String.self, forKey: .duration)
		adult_twin_sharing = try values.decodeIfPresent(String.self, forKey: .adult_twin_sharing)
		adult_tripple_sharing = try values.decodeIfPresent(String.self, forKey: .adult_tripple_sharing)
		child_with_bed = try values.decodeIfPresent(String.self, forKey: .child_with_bed)
		child_without_bed = try values.decodeIfPresent(String.self, forKey: .child_without_bed)
		joining_directly = try values.decodeIfPresent(String.self, forKey: .joining_directly)
		single_suppliment = try values.decodeIfPresent(String.self, forKey: .single_suppliment)
		service_tax = try values.decodeIfPresent(String.self, forKey: .service_tax)
		tcs = try values.decodeIfPresent(String.self, forKey: .tcs)
		highlights = try values.decodeIfPresent(String.self, forKey: .highlights)
		highlights_ar = try values.decodeIfPresent(String.self, forKey: .highlights_ar)
		inclusions = try values.decodeIfPresent(String.self, forKey: .inclusions)
		inclusions_ar = try values.decodeIfPresent(String.self, forKey: .inclusions_ar)
		exclusions_ar = try values.decodeIfPresent(String.self, forKey: .exclusions_ar)
		terms_ar = try values.decodeIfPresent(String.self, forKey: .terms_ar)
		canc_policy_ar = try values.decodeIfPresent(String.self, forKey: .canc_policy_ar)
		trip_notes_ar = try values.decodeIfPresent(String.self, forKey: .trip_notes_ar)
		exclusions = try values.decodeIfPresent(String.self, forKey: .exclusions)
		terms = try values.decodeIfPresent(String.self, forKey: .terms)
		canc_policy = try values.decodeIfPresent(String.self, forKey: .canc_policy)
		banner_image = try values.decodeIfPresent(String.self, forKey: .banner_image)
		gallery = try values.decodeIfPresent([String].self, forKey: .gallery)
		image_description = try values.decodeIfPresent(String.self, forKey: .image_description)
		inclusions_checks = try values.decodeIfPresent([String].self, forKey: .inclusions_checks)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		perfect_holidays = try values.decodeIfPresent(String.self, forKey: .perfect_holidays)
		agent_id = try values.decodeIfPresent(String.self, forKey: .agent_id)
		admin_approve_status = try values.decodeIfPresent(String.self, forKey: .admin_approve_status)
		agent_request_status = try values.decodeIfPresent(String.self, forKey: .agent_request_status)
		added_by = try values.decodeIfPresent(String.self, forKey: .added_by)
		supplier_name = try values.decodeIfPresent(String.self, forKey: .supplier_name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		trip_notes = try values.decodeIfPresent(String.self, forKey: .trip_notes)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		status_delete = try values.decodeIfPresent(String.self, forKey: .status_delete)
	}

}
