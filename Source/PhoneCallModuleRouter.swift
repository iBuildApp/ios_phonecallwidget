//
//  PhoneCallModuleRouter.swift
//  PhoneCallModule
//
//  Created by Anton Boyarkin on 22/04/2019.
//

import Foundation
import IBACore
import IBACoreUI

public enum PhoneCallModuleRoute: Route {
    case root
}

public class PhoneCallModuleRouter: BaseRouter<PhoneCallModuleRoute> {
    var module: PhoneCallModule?
    init(with module: PhoneCallModule) {
        self.module = module
    }
    
    public override func generateRootViewController() -> BaseViewControllerType {
        return PhoneCallViewController(type: module?.config?.type, data: module?.data)
    }
    
    public override func prepareTransition(for route: PhoneCallModuleRoute) -> RouteTransition {
        var options = TransitionOptions(animated: true)
        options.type = .modal
        return RouteTransition(module: generateRootViewController(), options: options)
    }
    
    public override func rootTransition() -> RouteTransition {
        return self.prepareTransition(for: .root)
    }
}
