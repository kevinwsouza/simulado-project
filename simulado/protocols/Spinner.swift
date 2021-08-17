//
//  Spinner.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 17/08/21.
//

import Foundation
import UIKit

open class Spinner {
    
    internal static var spinner: UIActivityIndicatorView?
    public static var style: UIActivityIndicatorView.Style = .large
    public static var baseBackColor = UIColor(white: 0, alpha: 0.5)
    public static var baseColor = UIColor.gray
    
    public static func start(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor) {
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner?.backgroundColor = backColor
            spinner?.color = baseColor
            window.addSubview(spinner!)
            spinner?.startAnimating()
        }
    }
    
    public static func stop() {
        if spinner != nil {
            spinner?.stopAnimating()
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
}
