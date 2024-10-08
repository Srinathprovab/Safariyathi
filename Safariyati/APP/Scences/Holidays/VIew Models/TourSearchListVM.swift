//
//  TourSearchListVM.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import Foundation


protocol TourSearchListVMDelegate : BaseViewModelProtocol {
    func tourListResults(response : TourSearchListModel)
    
}

class TourSearchListVM {
    
    var view: TourSearchListVMDelegate!
    init(_ view: TourSearchListVMDelegate) {
        self.view = view
    }
    
    
    func CALL_GET_ALL_HOLIDAYS_TOUR_PACKEGES_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.tours_search, parameters: parms, resultType: TourSearchListModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.tourListResults(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    
    
}
