

import Foundation
struct Flight_data : Codable {
    //    let airPricingSolution_Key : String?
    //    let completeItinerary : String?
    //    let connections : String?
    //    let totalPrice : Double?
    //    let taxes : Double?
    //    let basePrice : Int?
    //    let totalPrice_API : String?
    //    let aPICurrencyType : String?
    //    let sITECurrencyType : String?
    //    let myMarkup : Int?
    //    let myMarkup_cal : Int?
    //    let aMarkup : Int?
    //    let aMarkup_cal : Int?
    //    let basePrice_Breakdown : String?
    //    let taxPrice_Breakdown : String?
    //    let agent_markup_amount : Int?
    //    let admin_markup_amount : Int?
    //    let refundable : Bool?
    //    let platingCarrier : String?
    //    let fareType : String?
    //    let all_Passenger : String?
    //    let adults : Int?
    //    let adults_Base_Price : Double?
    //    let adults_Tax_Price : Double?
    //	let adults_pen : [Adults_pen]?
    //    let travelTime : String?
    //    let airSegment_Key : String?
    //    let totalFlightDuration : [String]?
    //    let flight_number_fare : [String]?
    //	let segments : [Segments]?
    //    let baggageAllowance : [String]?
    //    let farerulesref_Provider : [String]?
    //    let farerulesref_content : [String]?
    let token : String?
    let token_key : String?
    let flight_details : Flight_details?
    let price : Price?
    //let fare : Fare?
    //    let amadeus_api_token : String?
    //    let app_currency : String?
    //    let conversionrate : String?
    
    enum CodingKeys: String, CodingKey {
        
        //        case airPricingSolution_Key = "AirPricingSolution_Key"
        //        case completeItinerary = "CompleteItinerary"
        //        case connections = "Connections"
        //        case totalPrice = "TotalPrice"
        //        case taxes = "Taxes"
        //        case basePrice = "BasePrice"
        //        case totalPrice_API = "TotalPrice_API"
        //        case aPICurrencyType = "APICurrencyType"
        //        case sITECurrencyType = "SITECurrencyType"
        //        case myMarkup = "MyMarkup"
        //        case myMarkup_cal = "myMarkup_cal"
        //        case aMarkup = "aMarkup"
        //        case aMarkup_cal = "aMarkup_cal"
        //        case basePrice_Breakdown = "BasePrice_Breakdown"
        //        case taxPrice_Breakdown = "TaxPrice_Breakdown"
        //        case agent_markup_amount = "agent_markup_amount"
        //        case admin_markup_amount = "admin_markup_amount"
        //        case refundable = "Refundable"
        //        case platingCarrier = "PlatingCarrier"
        //        case fareType = "FareType"
        //        case all_Passenger = "All_Passenger"
        //        case adults = "Adults"
        //        case adults_Base_Price = "Adults_Base_Price"
        //        case adults_Tax_Price = "Adults_Tax_Price"
        //	case adults_pen = "Adults_pen"
        //        case travelTime = "TravelTime"
        //        case airSegment_Key = "AirSegment_Key"
        //        case totalFlightDuration = "TotalFlightDuration"
        //        case flight_number_fare = "flight_number_fare"
        //	case segments = "segments"
        //        case baggageAllowance = "BaggageAllowance"
        //        case farerulesref_Provider = "Farerulesref_Provider"
        //        case farerulesref_content = "Farerulesref_content"
        case token = "token"
        case token_key = "token_key"
        case flight_details = "flight_details"
        case price = "price"
        //	case fare = "fare"
        //        case amadeus_api_token = "amadeus_api_token"
        //        case app_currency = "app_currency"
        //        case conversionrate = "conversionrate"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //        airPricingSolution_Key = try values.decodeIfPresent(String.self, forKey: .airPricingSolution_Key)
        //        completeItinerary = try values.decodeIfPresent(String.self, forKey: .completeItinerary)
        //        connections = try values.decodeIfPresent(String.self, forKey: .connections)
        //        totalPrice = try values.decodeIfPresent(Double.self, forKey: .totalPrice)
        //        taxes = try values.decodeIfPresent(Double.self, forKey: .taxes)
        //        basePrice = try values.decodeIfPresent(Int.self, forKey: .basePrice)
        //        totalPrice_API = try values.decodeIfPresent(String.self, forKey: .totalPrice_API)
        //        aPICurrencyType = try values.decodeIfPresent(String.self, forKey: .aPICurrencyType)
        //        sITECurrencyType = try values.decodeIfPresent(String.self, forKey: .sITECurrencyType)
        //        myMarkup = try values.decodeIfPresent(Int.self, forKey: .myMarkup)
        //        myMarkup_cal = try values.decodeIfPresent(Int.self, forKey: .myMarkup_cal)
        //        aMarkup = try values.decodeIfPresent(Int.self, forKey: .aMarkup)
        //        aMarkup_cal = try values.decodeIfPresent(Int.self, forKey: .aMarkup_cal)
        //        basePrice_Breakdown = try values.decodeIfPresent(String.self, forKey: .basePrice_Breakdown)
        //        taxPrice_Breakdown = try values.decodeIfPresent(String.self, forKey: .taxPrice_Breakdown)
        //        agent_markup_amount = try values.decodeIfPresent(Int.self, forKey: .agent_markup_amount)
        //        admin_markup_amount = try values.decodeIfPresent(Int.self, forKey: .admin_markup_amount)
        //        refundable = try values.decodeIfPresent(Bool.self, forKey: .refundable)
        //        platingCarrier = try values.decodeIfPresent(String.self, forKey: .platingCarrier)
        //        fareType = try values.decodeIfPresent(String.self, forKey: .fareType)
        //        all_Passenger = try values.decodeIfPresent(String.self, forKey: .all_Passenger)
        //        adults = try values.decodeIfPresent(Int.self, forKey: .adults)
        //        adults_Base_Price = try values.decodeIfPresent(Double.self, forKey: .adults_Base_Price)
        //        adults_Tax_Price = try values.decodeIfPresent(Double.self, forKey: .adults_Tax_Price)
        //	adults_pen = try values.decodeIfPresent([Adults_pen].self, forKey: .adults_pen)
        //        travelTime = try values.decodeIfPresent(String.self, forKey: .travelTime)
        //        airSegment_Key = try values.decodeIfPresent(String.self, forKey: .airSegment_Key)
        //        totalFlightDuration = try values.decodeIfPresent([String].self, forKey: .totalFlightDuration)
        //        flight_number_fare = try values.decodeIfPresent([String].self, forKey: .flight_number_fare)
        //	segments = try values.decodeIfPresent([Segments].self, forKey: .segments)
        //        baggageAllowance = try values.decodeIfPresent([String].self, forKey: .baggageAllowance)
        //        farerulesref_Provider = try values.decodeIfPresent([String].self, forKey: .farerulesref_Provider)
        //        farerulesref_content = try values.decodeIfPresent([String].self, forKey: .farerulesref_content)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        token_key = try values.decodeIfPresent(String.self, forKey: .token_key)
        flight_details = try values.decodeIfPresent(Flight_details.self, forKey: .flight_details)
        price = try values.decodeIfPresent(Price.self, forKey: .price)
        //	fare = try values.decodeIfPresent(Fare.self, forKey: .fare)
        //        amadeus_api_token = try values.decodeIfPresent(String.self, forKey: .amadeus_api_token)
        //        app_currency = try values.decodeIfPresent(String.self, forKey: .app_currency)
        //        conversionrate = try values.decodeIfPresent(String.self, forKey: .conversionrate)
    }
    
}
