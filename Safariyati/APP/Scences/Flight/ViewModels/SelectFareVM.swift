//
//  SelectFareVM.swift
//  Safariyati
//
//  Created by Admin on 17/09/24.
//

import Foundation


protocol SelectFareVMDelegate : BaseViewModelProtocol {
    func selectedFareDetails(response : SelectFareModel)
    
}

class SelectFareVM {
    
    var view: SelectFareVMDelegate!
    init(_ view: SelectFareVMDelegate) {
        self.view = view
    }
    
    
    func CALL_SELECTED_FARE_DETAILS_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.flight_get_fare_family, parameters: parms, resultType: SelectFareModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.selectedFareDetails(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    
    
}
