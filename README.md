[![Build Status](https://travis-ci.org/yukiyuki0/SimpleTooltipKit.svg?branch=master)](https://travis-ci.org/yukiyuki0/SimpleTooltipKit)
# SimpleTooltipKit
A simple ui framework. Written in Swift

## Example
```swift
import UIKit
import STKit

final class ViewController: UIViewController {

    var tooltip: STView = STView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let stkit = STKit(view: self.view)
        self.tooltip = stkit.createTooltip() // Create a instance of tooltip
        self.tooltip.size = 40 // Set height of tooltip
        self.tooltip.textColor = UIColor.black // Set text color of label
        self.tooltip.backgroundColor = UIColor.red // Set background color of tooltip
        self.tooltip.textSize = 40 // Set text size of label
        self.tooltip.textString = "Hello, World" // Set text string of label
        self.view.addSubview(self.tooltip) // Add tooltip into subview
    }

    @IBAction func animateButtonDidTap(_ sender: Any) {
        self.tooltip.animate(duration: 2.0, delay: 1.0, hideDuration: 1.0)
    }
}
```

or You want to customize of tooltip, You can write like this.

```swift
import UIKit
import STKit

final class ViewController: UIViewController {

    var tooltip: STView = STView()
    
    let subView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelIntoCustomView = UILabel()
        labelIntoCustomView.translatesAutoresizingMaskIntoConstraints = false
        labelIntoCustomView.text = "CustomView"
        labelIntoCustomView.textColor = .white

        self.subView.addSubview(labelIntoCustomView)
        self.subView.backgroundColor = .black
        self.subView.frame = CGRect(x: 0, y: 0, width: self.view.frame.maxX, height: 40)
        let stkit = STKit(view: self.view)
        
        self.tooltip = stkit.createTooltip() // Create a instance of tooltip
        self.tooltip.size = 40
        self.tooltip.isCustomized = true
        self.tooltip.addSubview(self.subView)
        
        labelIntoCustomView.topAnchor.constraint(equalTo: self.subView.topAnchor, constant: 8.0).isActive = true
        labelIntoCustomView.leftAnchor.constraint(equalTo: self.subView.leftAnchor, constant: 8.0).isActive = true
        
        self.view.addSubview(self.tooltip) // Add tooltip into subview
    }

    @IBAction func animateButtonDidTap(_ sender: Any) {
        self.tooltip.animate(duration: 1.0, delay: 3.0, hideDuration: 1.0)
    }
    
}
```

## Demo
![Jan-19-2020 19-03-48](https://user-images.githubusercontent.com/11539551/72679090-2fb1d600-3aef-11ea-839a-b16695240a70.gif)
