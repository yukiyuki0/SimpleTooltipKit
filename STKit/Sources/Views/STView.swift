//
//  STView.swift
//  STKit
//
//  Created by Insu Byeon on 2020/01/21.
//  Copyright © 2020 Insu Byeon. All rights reserved.
//

import UIKit

public class STView: UIView {
    public var size: CGFloat = 40
    private var maxY: CGFloat = 0
    fileprivate var isAnimate: Bool = false
    
    public var textString: String = "" {
        didSet {
            self.label.text = textString
        }
    }
    public var textColor: UIColor = .white {
        didSet {
            self.label.textColor = textColor
        }
    }
    public var textSize: CGFloat = 20 {
        didSet {
            self.label.font = self.label.font.withSize(textSize)
        }
    }
    
    public lazy var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.maxY = self.frame.maxY
        self.setupLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension STView {
    public func animate(duration: TimeInterval, delay: TimeInterval = 2.0, hideDuration: TimeInterval) {
        self.label.isHidden = false
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
    
    private func setupLabel() {
        self.addSubview(self.label)
        self.label.isHidden = true
        self.label.text = self.textString
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.textColor = self.textColor
        
        self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
