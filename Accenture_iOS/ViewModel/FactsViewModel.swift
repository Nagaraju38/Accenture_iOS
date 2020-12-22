//
//  Facts.swift
//  Accenture_iOS
//
//  Created by XTGlobal on 21/12/20.
//  Copyright © 2020 Goutham. All rights reserved.
//

import Foundation



class FactsViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var empData : UserModel! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetFactsData { (empData) in
            self.empData = empData
        }
    }
}

