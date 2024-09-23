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
}


class AirportCodeListVM {
    
    var view: AirportCodeListVMDelegate!
    init(_ view: AirportCodeListVMDelegate) {
        self.view = view
    }
    
    
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
    
    
}
