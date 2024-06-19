//
//  Constants.swift
//  DoorcastRebase
//
//  Created by U Dinesh Kumar Reddy on 04/05/22.
//

import Foundation
import UIKit
import CoreData


/*SETTING USER DEFAULTS*/
let defaults = UserDefaults.standard

let loginResponseDefaultKey = "LoginResponse"
let KPlatform = "Platform"
let KPlatformValue = "iOS"
let KContentType = "Content-Type"
let KContentTypeValue = "application/x-www-form-urlencoded"
let KAccept = "Accept"
let KAcceptValue = "application/json"
let KAuthorization = "Authorization"
//let KDEVICE_ID = "DEVICE_ID"
let KAccesstoken = "Accesstoken"
let KAccesstokenValue = ""
var key = ""
let screenHeight = UIScreen.main.bounds.size.height
//var data : Data?
var loderBool = false
var basicloderBool = false
var keyStr = String()
var dateSelectKey = ""


var BASE_URL = "https://provab.net/travgate/pro_new/mobile/index.php/"
var BASE_URL1 = "https://provab.net/travgate/pro_new/mobile/index.php/"
var accessToken = "e3VzZXJuYW1lOmFudWpob29kYSxwYXNzd29yZDp0cmF2Z2F0ZUBtb2JpbGVhcHAsYXV0aHR5cGU6dGVzdH0="
var flightscount = 1
var regnowloginBtntap = "reg"
var callapibool = false

/* URL endpoints */
struct ApiEndpoints {
    
    static let indexpage = "general/getTopFlightHotelDestination"
    static let get_airport_code_list = "ajax/get_airport_code_list"
    static let general_searchdata = "general/searchdata"
    static let general_removeRecentSearch = "general/removeRecentSearch"
    static let general_mobile_pre_flight_search = "general/mobile_pre_flight_search"
    static let flight_getFlightDetails = "flight/getFlightDetails"
    static let flight_mobile_pre_process_booking = "flight/mobile_pre_process_booking"
    static let flight_mobile_pre_booking = "flight/mobile_pre_booking"
    static let mobileprocesspassengerdetail = "mobile_process_passenger_detail"
    static let getCountryList = "getCountryList"
    static let general_mobile_pre_flight_search_loader = "general/mobile_pre_flight_search_loader"
    static let general_mobile_pre_hotel_search_loader = "general/mobile_pre_hotel_search_loader"
    static let general_get_airlines_list = "general/get_airlines_list"
    static let mobilepreprocessbooking = "mobile_pre_process_booking"
    static let general_getMobileCurrency = "general/getMobileCurrency"
    static let general_mobile_contact_us = "general/mobile_contact_us"
    static let ajax_mobile_get_fare_rules = "ajax/mobile_get_fare_rules"
    
    //LOGIN
    static let auth_mobile_login = "auth/mobile_login"
    static let auth_mobile_logout = "auth/mobile_logout"
    static let auth_deleteuser = "auth/deleteuser"
    static let auth_mobile_forgot_password = "auth/mobile_forgot_password"
    static let auth_mobile_register_on_light_box = "auth/mobile_register_on_light_box"
    static let user_mobile_profile = "user/mobile_profile"
    static let gethotelcitylist = "get_hotel_city_list"
    static let getAirlineList = "general/getAirlineList"
    
    
    //Hotels
    static let general_getActiveBookingSource = "general/getActiveBookingSource"
    static let ajaxHotelSearch_pagination = "ajaxHotelSearch_pagination"
    static let mobileprehotelsearch = "mobile_pre_hotel_search"
    static let general_mobileHotelSearch = "general/mobileHotelSearch"
    static let hotelmobiledetails = "mobile_details"
    static let hotel_mobile_booking = "hotel/mobile_booking"
    static let hotel_mobile_hotel_pre_booking = "hotel/mobile_hotel_pre_booking"
    
    
    
    //VISA
    static let visa_enquiry_form = "visa/visa_enquiry_form"
    static let cruise_get_cruise_list = "cruise/get_cruise_list"
    static let cruise_get_more_info = "cruise/get_more_info/"
    static let cruise_cruise_enquiry_form = "cruise/cruise_enquiry_form"
    
    
}

/*App messages*/
struct Message {
    static let internetConnectionError = "Please check your connection and try reconnecting to internet"
    static let sessionExpired = "Your session has been expired, please login again"
}


/*USER ENTERED DETAILS DEFAULTS*/

struct UserDefaultsKeys {
    
    static var mobilecountrycode = "mobilecountrycode"
    static var mobilecountryname = "mobilecountryname"
    static var tabselect = "tabselect"
    static var nationality = "nationality"
    static var airlinescode = "airlinescode"
    static var userLoggedIn = "userLoggedIn"
    static var loggedInStatus = "loggedInStatus"
    static var userid = "userid"
    static var username = "username"
    static var userimg = "userimg"
    static var useremail = "useremail"
    static var countryCode = "countryCode"
    static var regStatus = "regStatus"
    static var usermobile = "usermobile"
    static var usermobilecode = "usermobilecode"
    static var journeyType = "Journey_Type"
    static var itinerarySelectedIndex = "ItinerarySelectedIndex"
    static var selectedCurrency = "selectedCurrency"
    static var selectedCurrencyType = "selectedCurrencyType"
    static var totalTravellerCount = "totalTravellerCount"
    static var select_classIndex = "select_classIndex"
    static var rselect_classIndex = "rselect_classIndex"
    static var mselect_classIndex = "mselect_classIndex"
    static var journeyCitys = "journeyCitys"
    static var journeyDates = "journeyDates"
    static var cellTag = "cellTag"
    static var flightrefundtype = "flightrefundtype"
    static var mcountrycode = "mcountrycode"
    
    
    //ONE WAY
    static var fromCity = "fromCity"
    static var toCity = "toCity"
    static var calDepDate = "calDepDate"
    static var calRetDate = "calRetDate"
    static var hadultCount = "HAdult_Count"
    static var hchildCount = "HChild_Count"
    static var adultCount = "Adult_Count"
    static var childCount = "Child_Count"
    static var infantsCount = "Infants_Count"
    static var selectClass = "select_class"
    static var rselectClass = "rselect_class"
    static var fromlocid = "from_loc_id"
    static var tolocid = "to_loc_id"
    static var fromcityname = "fromcityname"
    static var tocityname = "tocityname"
    static var fcity = "fcity"
    static var tcity = "tcity"
    static var fcariername = "fcariername"
    static var fcariercode = "fcariercode"
    
    //ROUND TRIP
    //    static var rlocationcity = "rlocation_city"
    //    static var rfromCity = "rfromCity"
    //    static var rtoCity = "rtoCity"
    //    static var rcalDepDate = "rcalDepDate"
    //    static var rcalRetDate = "rcalRetDate"
    //    static var radultCount = "rAdult_Count"
    //    static var rchildCount = "rChild_Count"
    //    static var rhadultCount = "rHAdult_Count"
    //    static var rhchildCount = "rHChild_Count"
    //    static var rinfantsCount = "rInfants_Count"
    //    static var rselectClass = "rselect_class"
    //    static var rfromlocid = "rfrom_loc_id"
    //    static var rtolocid = "rto_loc_id"
    //    static var rfromcityname = "rfromcityname"
    //    static var rtocityname = "rtocityname"
    
    
    //MULTICITY TRIP
    static var mlocationcity = "mlocation_city"
    static var mfromCity = "mfromCity"
    static var mtoCity = "mtoCity"
    
    //    static var mcalDepDate = "mcalDepDate"
    //    static var mcalRetDate = "mcalRetDate"
    //    static var madultCount = "mAdult_Count"
    //    static var mchildCount = "mChild_Count"
    //    static var mhadultCount = "mHAdult_Count"
    //    static var mhchildCount = "mHChild_Count"
    //    static var minfantsCount = "mInfants_Count"
    //    static var mselectClass = "mselect_class"
    
    static var mfromlocid = "mfrom_loc_id"
    static var mtolocid = "mto_loc_id"
    static var mfromcityname = "mfromcityname"
    static var mtocityname = "mtocityname"
    
    
    //Hotel
    static var locationcity = "location_city"
    static var locationid = "location_id"
    static var hoteladultCount = "HotelAdult_Count"
    static var hotelchildCount = "HotelChild_Count"
    static var cityid = "cityid"
    static var htravellerDetails = "htraveller_Details"
    static var roomType = "Room_Type"
    static var refundtype = "refundtype"
    static var hnationality = "hnationality"
    static var hnationalitycode = "hnationalitycode"
    
    
    static var select = "select"
    static var checkin = "check_in"
    static var checkout = "check _out"
    static var addTarvellerDetails = "addTarvellerDetails"
    static var travellerDetails = "traveller_Details"
    // static var mtravellerDetails = "mtraveller_Details"
    static var roomcount = "room_count"
    static var hoteladultscount = "hotel_adults_count"
    static var hotelchildcount = "hotel_child_count"
    static var guestcount = "guestcount"
    static var selectPersons = "selectPersons"
    static var kwdprice = "kwdprice"
    
    
    //visa
    static var travelDate = "travelDate"
    static var visaadultCount = "visaadultCount"
    static var visachildCount = "visachildCount"
    static var visainfantsCount = "visainfantsCount"
    static var visatotalpassengercount = "visatotalpassengercount"
    
    
    //Cruise
    static var fromtravelDate = "fromtravelDate"
    static var totravelDate = "totravelDate"
    static var cruisadultCount = "cruisadultCount"
    static var cruischildCount = "cruischildCount"
    static var cruisinfantsCount = "cruisinfantsCount"
    static var cruistotalpassengercount = "cruistotalpassengercount"
}


struct sessionMgrDefaults {
    
    static var userLoggedIn = "username"
    static var loggedInStatus = "email"
    static var globalAT = "mobile_no"
    static var Base_url = "accesstoken"
}



/*LOCAL JSON FILES*/
struct LocalJsonFiles {
    
}
