//
//  AirportCodeListVM.swift
//  Safariyati
//
//  Created by Admin on 11/09/24.
//

import Foundation

protocol AirportCodeListVMDelegate : BaseViewModelProtocol {
    func ShowCityList(response : [AirportCodeListModel])
    func tourListResponse(response :TourListModel)
    func hotelcitylist(response :[HotelCityListModel])
}


class AirportCodeListVM {
    
    var view: AirportCodeListVMDelegate!
    init(_ view: AirportCodeListVMDelegate) {
        self.view = view
    }
    
    
    //MARK: - CallShowCityListAPI
    func CallShowCityListAPI(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        // self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.ajax_get_airport_code_list , urlParams: parms as? Dictionary<String, String>, parameters: parms, resultType: [AirportCodeListModel].self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                //   self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.ShowCityList(response: response)
                } else {
                    // Show alert
                    //  print("error === \(errorMessage ?? "")")
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    //MARK: - CALL_GET_TOUR_LIST_API
    func CALL_GET_TOUR_LIST_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        // self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.tours_get_tour_city_package_list , urlParams: parms as? Dictionary<String, String>, parameters: parms, resultType: TourListModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                //   self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.tourListResponse(response: response)
                } else {
                    // Show alert
                    //  print("error === \(errorMessage ?? "")")
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    //MARK: - CALL_GET_CITY_OR_HOTEL_LIST_API
    func CALL_GET_CITY_OR_HOTEL_LIST_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
       // self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.ajax_get_hotel_city_list, urlParams: (parms as! Dictionary<String, String>),parameters: parms, resultType: [HotelCityListModel].self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
              //  self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.hotelcitylist(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
}
