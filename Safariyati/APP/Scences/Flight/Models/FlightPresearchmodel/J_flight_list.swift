
import Foundation
struct J_flight_list : Codable {
    //   let connections : String?
    //  let totalPrice : Double?
    //    let travelTime : String?
    //    let platingCarrier : String?
    //    let flight_number_fare : [String]?
    let token_key : String?
    let booking_source : String?
    let access_key : String?
    //    let adults_Base_Price : Int?
    //    //    let segments : [Segments]?
    //    let totalFlightDuration : [String]?
    //    let basePrice_Breakdown : String?
    //    let adults_Tax_Price : Double?
    //    let baggageAllowance : [String]?
    //    let agent_markup_amount : Int?
    let booking_source_key : String?
    //    let amadeus_api_token : String?
    //    let app_currency : String?
    let refundable : Bool?
    //    let fareType : String?
    //    let basePrice : Int?
    //    let airSegment_Key : String?
    //    let aMarkup_cal : Int?
    //    let myMarkup_cal : Int?
    let price : Price?
    //    let sITECurrencyType : String?
    //    let airPricingSolution_Key : String?
    //    let admin_markup_amount : Int?
    //    let farerulesref_content : [String]?
    //    let all_Passenger : String?
    //    let conversionrate : String?
    let flight_details : Flight_details?
    //    let completeItinerary : String?
    //    let adults : Int?
    //    let aMarkup : Int?
    //    let taxes : Double?
    //    let myMarkup : Int?
    //    let taxPrice_Breakdown : String?
    //  let adults_pen : [Adults_pen]?
    let token : String?
    //  let totalPrice_API : String?
    //  let farerulesref_Provider : [String]?
    //  let fare : [Fare]?
    let selectedResult : String?
    //    let aPICurrencyType : String?
    
    enum CodingKeys: String, CodingKey {
        
        //   case connections = "Connections"
        //   case totalPrice = "TotalPrice"
        //        case travelTime = "TravelTime"
        //        case platingCarrier = "PlatingCarrier"
        //        case flight_number_fare = "flight_number_fare"
        case token_key = "token_key"
        case booking_source = "booking_source"
        case access_key = "access_key"
        //  case adults_Base_Price = "Adults_Base_Price"
        //    case segments = "segments"
        //        case totalFlightDuration = "TotalFlightDuration"
        //        case basePrice_Breakdown = "BasePrice_Breakdown"
        //        case adults_Tax_Price = "Adults_Tax_Price"
        //        case baggageAllowance = "BaggageAllowance"
        //        case agent_markup_amount = "agent_markup_amount"
        case booking_source_key = "booking_source_key"
        //        case amadeus_api_token = "amadeus_api_token"
        //        case app_currency = "app_currency"
        case refundable = "Refundable"
        //        case fareType = "FareType"
        //        case basePrice = "BasePrice"
        //        case airSegment_Key = "AirSegment_Key"
        //        case aMarkup_cal = "aMarkup_cal"
        //        case myMarkup_cal = "myMarkup_cal"
        case price = "price"
        //        case sITECurrencyType = "SITECurrencyType"
        //        case airPricingSolution_Key = "AirPricingSolution_Key"
        //        case admin_markup_amount = "admin_markup_amount"
        //        case farerulesref_content = "Farerulesref_content"
        //        case all_Passenger = "All_Passenger"
        //        case conversionrate = "conversionrate"
        case flight_details = "flight_details"
        //        case completeItinerary = "CompleteItinerary"
        //        case adults = "Adults"
        //        case aMarkup = "aMarkup"
        //        case taxes = "Taxes"
        //        case myMarkup = "MyMarkup"
        //        case taxPrice_Breakdown = "TaxPrice_Breakdown"
        //   case adults_pen = "Adults_pen"
        case token = "token"
        //   case totalPrice_API = "TotalPrice_API"
        //  case farerulesref_Provider = "Farerulesref_Provider"
        //   case fare = "fare"
        case selectedResult = "selectedResult"
        //        case aPICurrencyType = "APICurrencyType"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //    connections = try values.decodeIfPresent(String.self, forKey: .connections)
        //   totalPrice = try values.decodeIfPresent(Double.self, forKey: .totalPrice)
        //        travelTime = try values.decodeIfPresent(String.self, forKey: .travelTime)
        //        platingCarrier = try values.decodeIfPresent(String.self, forKey: .platingCarrier)
        //        flight_number_fare = try values.decodeIfPresent([String].self, forKey: .flight_number_fare)
        token_key = try values.decodeIfPresent(String.self, forKey: .token_key)
        booking_source = try values.decodeIfPresent(String.self, forKey: .booking_source)
        access_key = try values.decodeIfPresent(String.self, forKey: .access_key)
        //    adults_Base_Price = try values.decodeIfPresent(Int.self, forKey: .adults_Base_Price)
        //    segments = try values.decodeIfPresent([Segments].self, forKey: .segments)
        //        totalFlightDuration = try values.decodeIfPresent([String].self, forKey: .totalFlightDuration)
        //        basePrice_Breakdown = try values.decodeIfPresent(String.self, forKey: .basePrice_Breakdown)
        //        adults_Tax_Price = try values.decodeIfPresent(Double.self, forKey: .adults_Tax_Price)
        //        baggageAllowance = try values.decodeIfPresent([String].self, forKey: .baggageAllowance)
        //        agent_markup_amount = try values.decodeIfPresent(Int.self, forKey: .agent_markup_amount)
        booking_source_key = try values.decodeIfPresent(String.self, forKey: .booking_source_key)
        //        amadeus_api_token = try values.decodeIfPresent(String.self, forKey: .amadeus_api_token)
        //        app_currency = try values.decodeIfPresent(String.self, forKey: .app_currency)
        refundable = try values.decodeIfPresent(Bool.self, forKey: .refundable)
        //        fareType = try values.decodeIfPresent(String.self, forKey: .fareType)
        //        basePrice = try values.decodeIfPresent(Int.self, forKey: .basePrice)
        //        airSegment_Key = try values.decodeIfPresent(String.self, forKey: .airSegment_Key)
        //        aMarkup_cal = try values.decodeIfPresent(Int.self, forKey: .aMarkup_cal)
        //        myMarkup_cal = try values.decodeIfPresent(Int.self, forKey: .myMarkup_cal)
        price = try values.decodeIfPresent(Price.self, forKey: .price)
        //        sITECurrencyType = try values.decodeIfPresent(String.self, forKey: .sITECurrencyType)
        //        airPricingSolution_Key = try values.decodeIfPresent(String.self, forKey: .airPricingSolution_Key)
        //        admin_markup_amount = try values.decodeIfPresent(Int.self, forKey: .admin_markup_amount)
        //        farerulesref_content = try values.decodeIfPresent([String].self, forKey: .farerulesref_content)
        //        all_Passenger = try values.decodeIfPresent(String.self, forKey: .all_Passenger)
        //        conversionrate = try values.decodeIfPresent(String.self, forKey: .conversionrate)
        flight_details = try values.decodeIfPresent(Flight_details.self, forKey: .flight_details)
        //        completeItinerary = try values.decodeIfPresent(String.self, forKey: .completeItinerary)
        //        adults = try values.decodeIfPresent(Int.self, forKey: .adults)
        //        aMarkup = try values.decodeIfPresent(Int.self, forKey: .aMarkup)
        //        taxes = try values.decodeIfPresent(Double.self, forKey: .taxes)
        //        myMarkup = try values.decodeIfPresent(Int.self, forKey: .myMarkup)
        //        taxPrice_Breakdown = try values.decodeIfPresent(String.self, forKey: .taxPrice_Breakdown)
        //    adults_pen = try values.decodeIfPresent([Adults_pen].self, forKey: .adults_pen)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        //    totalPrice_API = try values.decodeIfPresent(String.self, forKey: .totalPrice_API)
        //   farerulesref_Provider = try values.decodeIfPresent([String].self, forKey: .farerulesref_Provider)
        //    fare = try values.decodeIfPresent([Fare].self, forKey: .fare)
        selectedResult = try values.decodeIfPresent(String.self, forKey: .selectedResult)
        //        aPICurrencyType = try values.decodeIfPresent(String.self, forKey: .aPICurrencyType)
    }
    
}



