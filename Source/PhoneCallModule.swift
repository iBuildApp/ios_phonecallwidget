//
//  PhoneCallModule.swift
//  PhoneCallModule
//
//  Created by Anton Boyarkin on 22/04/2019.
//  Copyright © 2019 iBuildApp. All rights reserved.
//

import UIKit
import IBACore
import IBACoreUI

import XMLMapper

public class PhoneCallModule: BaseModule, ModuleType {
    public var moduleRouter: AnyRouter { return router }
    
    private var router: PhoneCallModuleRouter!
    internal var config: WidgetModel?
    internal var data: DataModel?
    
    public override class func canHandle(config: WidgetModel) -> Bool {
        return config.type == "taptocall"
    }
    
    public required init() {
        print("\(type(of: self)).\(#function)")
        super.init()
        router = PhoneCallModuleRouter(with: self)
    }
    
    public func setConfig(_ model: WidgetModel) {
        self.config = model
        if let data = model.data, let dataModel = DataModel(map: data) {
            self.data = dataModel
        } else {
            print("Error parsing!")
        }
    }
}
