//
//  Observable.swift
//  WalmartApp
//
//  Created by Luis R on 08/09/23.
//
import UIKit

class Observable<T> {
    
    public var value: T {
        didSet {
            valueChanged()
        }
    }
    
    public var observer: ((_ value: T) -> Void)?
    var queue: DispatchQueue = DispatchQueue.main
    
    public init(initialValue: T) {
        self.value = initialValue
    }
    
    public func observe(_ observer: @escaping (_ value: T) -> Void) {
        self.observer = observer
    }
    
    fileprivate func valueChanged() {
        guard !Thread.isMainThread else { self.observer?(value); return }
        queue.async { [weak self] in
            if let v = self?.value {
                self?.observer?(v)
            }
        }
    }
}
