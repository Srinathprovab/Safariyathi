//
//  TourPackageDetailsVM.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import Foundation


protocol TourPackageDetailsVMDelegate : BaseViewModelProtocol {
    func tourDetailsResponse(response : TourPackageDetailsModel)
}

class TourPackageDetailsVM {
    
    var view: TourPackageDetailsVMDelegate!
    init(_ view: TourPackageDetailsVMDelegate) {
        self.view = view
    }
    
    
    func CALL_HOLIDAYS_DETAILS_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.tours_details, parameters: parms, resultType: TourPackageDetailsModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.tourDetailsResponse(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    
    
}
