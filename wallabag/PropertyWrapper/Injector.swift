//
//  Injector.swift
//  wallabag
//
//  Created by Marinel Maxime on 09/10/2019.
//

import Swinject
import UIKit

@propertyWrapper
struct Injector<Service> {
    var service: Service?
    var container: Resolver?

    var wrappedValue: Service {
        mutating get {
            if service == nil {
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
                service = appDelegate.container.resolve(Service.self)
            }

            return service!
        }
    }
}
