//
//  IndexVM.swift
//  Safariyati
//
//  Created by Admin on 20/09/24.
//

import Foundation

protocol IndexVMDelegate : BaseViewModelProtocol {
    func indexPageResponse(response : IndexModel)
    
}

class IndexVM {
    
    var view: IndexVMDelegate!
    init(_ view: IndexVMDelegate) {
        self.view = view
    }
    
    
    func CALL_INDEX_PAGE_API(dictParam: [String: Any]){
        let parms = NSDictionary(dictionary:dictParam)
        print("Parameters = \(parms)")
        
        self.view?.showLoader()
        
        ServiceManager.postOrPutApiCall(endPoint: ApiEndpoints.general_home, parameters: parms, resultType: IndexModel.self, p:dictParam) { sucess, result, errorMessage in
            
            DispatchQueue.main.async {
                self.view?.hideLoader()
                if sucess {
                    guard let response = result else {return}
                    self.view.indexPageResponse(response: response)
                } else {
                    self.view?.hideLoader()
                    self.view.showToast(message: errorMessage ?? "")
                }
            }
        }
    }
    
    
    
    
    
}
