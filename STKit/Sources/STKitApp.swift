//
//  STKitApp.swift
//  STKit
//
//  Created by Insu Byeon on 2020/01/18.
//  Copyright © 2020 Insu Byeon. All rights reserved.
//

import UIKit
import Foundation

public class STKit {
    
    fileprivate lazy var rect = CGRect(x: 0, y: self.view.frame.maxY, width: self.view.frame.maxX, height: 0)
    fileprivate lazy var customView = STView(frame: rect)

    fileprivate var view: UIView
    
    public init(view: UIView) {
        self.view = view
    }
    
}

extension STKit {
    public func createTooltip() -> STView {
        return self.customView
    }
}
