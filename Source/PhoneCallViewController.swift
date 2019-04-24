//
//  PhoneCallViewController.swift
//  PhoneCallModule
//
//  Created by Anton Boyarkin on 22/04/2019.
//

import Foundation
import AppBuilderCore
import AppBuilderCoreUI

class PhoneCallViewController: UIAlertController, BaseViewControllerType {
    var options: TransitionOptions?
    
    // MARK: - Private properties
    /// Widget type indentifier
    private var type: String?
    
    /// Widger config data
    private var data: DataModel?
    
    // MARK: - Controller life cycle methods
    public convenience init(type: String?, data: DataModel?) {
        self.init()
        self.type = type
        self.data = data
    }
    
    override var preferredStyle: UIAlertController.Style {
        return .alert
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let phone = self.data?.phone, let url = URL(string: "tel:\(phone)") else {
            self.title = NSLocalizedString("Core.Message.InvalidPhoneNumber.Title", comment: "Invalid phone number")
            self.message = NSLocalizedString("Core.Message.InvalidPhoneNumber.Body", comment: "Invalid phone number")
            self.addAction(UIAlertAction(title: NSLocalizedString("Common.Text.Ok", comment: "OK"), style: .default))
            return
        }
        
        self.message = phone
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Common.Text.Cancel", comment: "Cancel"), style: .default, handler: nil)
        
        self.addAction(cancelAction)
        
        let callAction = UIAlertAction(title: NSLocalizedString("Common.Text.Call", comment: "Call"), style: .default) { _ in
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
        self.addAction(callAction)
    }
}
