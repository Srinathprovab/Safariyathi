//
//  CountryListVM.swift
//  Safariyati
//
//  Created by Admin on 19/09/24.
//

import Foundation

protocol CountryListVMDelegate : BaseViewModelProtocol {
    func countrylistResponse(response : CountryListModel)
    
}

class CountryListVM {
    
    var view: CountryListVMDelegate!
    init(_ view: CountryListVMDelegate) {
        self.view = view
    }
    
    
    func CALL_GET_COUNTRY_LIST_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.general_getCountryList_bysearch,urlParams: parms as? Dictionary<String, String>, parameters: parms, resultType: CountryListModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.countrylistResponse(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
}
