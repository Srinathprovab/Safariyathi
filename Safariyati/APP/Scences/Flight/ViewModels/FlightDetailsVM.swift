//
//  FlightDetailsVM.swift
//  Safariyati
//
//  Created by Admin on 13/09/24.
//

import Foundation


protocol FlightDetailsVMDelegate : BaseViewModelProtocol {
    func flightDetailsRespons(response : FlightDetailsModel)
    
}

class FlightDetailsVM {
    
    var view: FlightDetailsVMDelegate!
    init(_ view: FlightDetailsVMDelegate) {
        self.view = view
    }
    
    
    func CALL_GET_FLIGHT_DETAILS_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.flight_getFlightDetails, parameters: parms, resultType: FlightDetailsModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                  self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.flightDetailsRespons(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    
    
}
