

import Foundation
struct Summary : Codable {
	let origin : Origin?
	let destination : Destination?
	let operator_code : String?
	let marketing_operator_code : String?
	let operatingCarrier : String?
	let operated_by : String?
	let display_operator_code : String?
	let operator_name : String?
	let cabin_class : String?
	let flightclass : FlightClass?
	let flight_number : String?
	let no_of_stops : Int?
	let duration_seconds : Int?
	let duration : String?
	let meal : String?
	let meal_description : String?
	let equipment : String?
	let seatsRemaining : String?
	let weight_Allowance : String?
    let operator_image : String?
    
    

	enum CodingKeys: String, CodingKey {

		case origin = "origin"
		case destination = "destination"
		case operator_code = "operator_code"
		case marketing_operator_code = "marketing_operator_code"
		case operatingCarrier = "OperatingCarrier"
		case operated_by = "operated_by"
		case display_operator_code = "display_operator_code"
		case operator_name = "operator_name"
		case cabin_class = "cabin_class"
		case flightclass = "class"
		case flight_number = "flight_number"
		case no_of_stops = "no_of_stops"
		case duration_seconds = "duration_seconds"
		case duration = "duration"
		case meal = "Meal"
		case meal_description = "Meal_description"
		case equipment = "Equipment"
		case seatsRemaining = "SeatsRemaining"
		case weight_Allowance = "Weight_Allowance"
        case operator_image = "operator_image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		origin = try values.decodeIfPresent(Origin.self, forKey: .origin)
		destination = try values.decodeIfPresent(Destination.self, forKey: .destination)
		operator_code = try values.decodeIfPresent(String.self, forKey: .operator_code)
		marketing_operator_code = try values.decodeIfPresent(String.self, forKey: .marketing_operator_code)
		operatingCarrier = try values.decodeIfPresent(String.self, forKey: .operatingCarrier)
		operated_by = try values.decodeIfPresent(String.self, forKey: .operated_by)
		display_operator_code = try values.decodeIfPresent(String.self, forKey: .display_operator_code)
		operator_name = try values.decodeIfPresent(String.self, forKey: .operator_name)
		cabin_class = try values.decodeIfPresent(String.self, forKey: .cabin_class)
        flightclass = try values.decodeIfPresent(FlightClass.self, forKey: .flightclass)
		flight_number = try values.decodeIfPresent(String.self, forKey: .flight_number)
		no_of_stops = try values.decodeIfPresent(Int.self, forKey: .no_of_stops)
		duration_seconds = try values.decodeIfPresent(Int.self, forKey: .duration_seconds)
		duration = try values.decodeIfPresent(String.self, forKey: .duration)
		meal = try values.decodeIfPresent(String.self, forKey: .meal)
		meal_description = try values.decodeIfPresent(String.self, forKey: .meal_description)
		equipment = try values.decodeIfPresent(String.self, forKey: .equipment)
		seatsRemaining = try values.decodeIfPresent(String.self, forKey: .seatsRemaining)
		weight_Allowance = try values.decodeIfPresent(String.self, forKey: .weight_Allowance)
        operator_image = try values.decodeIfPresent(String.self, forKey: .operator_image)
	}

}
