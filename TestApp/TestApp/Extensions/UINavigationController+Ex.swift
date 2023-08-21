//
//  UINavigationController+Ex.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 18/08/2023.
//

import UIKit

extension UINavigationController {
    func setupNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = UIColor(red: 0.0157, green: 0.0471, blue: 0.1176, alpha: 1.0)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        
        UIBarButtonItem.appearance().tintColor = .white
    }
}
