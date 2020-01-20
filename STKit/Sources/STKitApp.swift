//
//  STKitApp.swift
//  STKit
//
//  Created by Insu Byeon on 2020/01/18.
//  Copyright © 2020 Insu Byeon. All rights reserved.
//

import UIKit
import Foundation

public class STView: UIView {
    var size: CGFloat = 40
    var maxY: CGFloat = 0
    var isAnimate: Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.maxY = self.frame.maxY
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func animate(duration: TimeInterval, delay: TimeInterval = 2.0, hideDuration: TimeInterval) {
        if self.isAnimate {
            return
        }
        UIView.animate(withDuration: duration, animations: {
            self.isAnimate = true
            self.frame = CGRect(x: 0, y: self.maxY - self.size, width: self.frame.maxX, height: self.size)
        }) { _ in
            UIView.animate(withDuration: hideDuration, delay: delay, options: .curveLinear, animations: {
                self.frame = CGRect(x: 0, y: self.maxY, width: self.frame.maxX, height: self.size)
            }, completion: { _ in self.isAnimate = false })
        }
    }
}

public class STKit {
    
    public private(set) var tooltipSize: CGFloat = 40
    
    fileprivate lazy var rect = CGRect(x: 0, y: self.view.frame.maxY, width: self.view.frame.maxX, height: 0)
    fileprivate lazy var customView = STView(frame: rect)

    fileprivate var view: UIView
    
    public init(view: UIView) {
        self.view = view
        print(self.view.frame.maxY, self.view.frame.maxX)
    }
    
    public func createTooltip(textString: String) -> STView {
        let customLabel = UILabel()
        self.customView.backgroundColor = .red
        self.customView.size = self.tooltipSize
        self.customView.addSubview(customLabel)
        customLabel.text = textString
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.textColor = .white
        
        customLabel.centerXAnchor.constraint(equalTo: self.customView.centerXAnchor).isActive = true
        customLabel.centerYAnchor.constraint(equalTo: self.customView.centerYAnchor).isActive = true
        self.view.addSubview(self.customView)
        return self.customView
    }
    
}


extension STKit {
    public func setTooltipSize(size: CGFloat) {
        self.tooltipSize = size
    }
}
