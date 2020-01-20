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
        stkit.setTooltipSize(size: 40)
        self.tooltip = stkit.createTooltip(textString: "This is a simple tooltip example.")
    }

    @IBAction func animateButtonDidTap(_ sender: Any) {
        self.tooltip.animate(duration: 2.0, delay: 1.0, hideDuration: 1.0)
    }
}
```

## Demo
![Jan-19-2020 19-03-48](https://user-images.githubusercontent.com/11539551/72679090-2fb1d600-3aef-11ea-839a-b16695240a70.gif)
