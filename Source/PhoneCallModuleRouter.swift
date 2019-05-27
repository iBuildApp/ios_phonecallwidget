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
        if #available(iOS 10.3, *) {
            guard let phone = module?.data?.phone, let url = URL(string: "tel:\(phone)") else {
                if let rootController = UIApplication.shared.keyWindow?.rootViewController {
                    rootController.showAlertController(title: Localization.Core.Message.InvalidPhoneNumber.title, message: Localization.Core.Message.InvalidPhoneNumber.body, buttonTitle: Localization.Common.Text.ok)
                }
                return RouteTransition()
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let rootController = UIApplication.shared.keyWindow?.rootViewController {
                    rootController.showAlertController(title: Localization.Core.Message.CantCall.title, message: Localization.Core.Message.CantCall.body, buttonTitle: Localization.Common.Text.ok)
                }
            }
            return RouteTransition()
        } else {
            return self.prepareTransition(for: .root)
        }
    }
}
