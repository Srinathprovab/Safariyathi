//
//  FlightSearchVM.swift
//  Safariyati
//
//  Created by Admin on 11/09/24.
//

import Foundation

protocol FlightSearchVMDelegate : BaseViewModelProtocol {
    func bookingSourceList(response : ActiveBookingSourceModel)
    func flightPresearchResponse(response : FlightPresearchModel)
    func flightListResponse(response : FlightListModel)
}

class FlightSearchVM {
    
    var view: FlightSearchVMDelegate!
    init(_ view: FlightSearchVMDelegate) {
        self.view = view
    }
    
    
    func CALL_GET_ACTIVE_BOOKING_SOURCE_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.general_get_active_booking_source, parameters: parms, resultType: ActiveBookingSourceModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                //  self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.bookingSourceList(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    func CALL_PRE_FLIGHT_SEARCH_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        // self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.general_mobile_pre_flight_search,urlParams: parms as? Dictionary<String, String>, parameters: parms, resultType: FlightPresearchModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                // self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.flightPresearchResponse(response: response)
                } else {
                    // Show alert
                    //  print("error === \(errorMessage ?? "")")
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    
    func CALL_GET_FLIGHT_LIST_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        // self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.general_search_flight, parameters: parms, resultType: FlightListModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.flightListResponse(response: response)
                } else {
                    // Show alert
                    //  print("error === \(errorMessage ?? "")")
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
}
