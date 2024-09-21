//
//  BookingDetailsVM.swift
//  Safariyati
//
//  Created by Admin on 17/09/24.
//

import Foundation

protocol BookingDetailsVMDelegate : BaseViewModelProtocol {
    func preprocessBookingDetails(response : BookingDetailsModel)
    func mobileProcessPassengerDetailsResponse(response : ProcessPassengerDetailsModel)
    
}

class BookingDetailsVM {
    
    var view: BookingDetailsVMDelegate!
    init(_ view: BookingDetailsVMDelegate) {
        self.view = view
    }
    
    
    func CALL_MOBILE_PRE_PROCESS_BOOKING_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.flight_mobile_pre_process_booking, parameters: parms, resultType: BookingDetailsModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.preprocessBookingDetails(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    func CALL_MOBILE_PROCESS_PASSENGER_DETAILS_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.flight_mobile_process_passenger_detail, parameters: parms, resultType: ProcessPassengerDetailsModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.mobileProcessPassengerDetailsResponse(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    
    
}
