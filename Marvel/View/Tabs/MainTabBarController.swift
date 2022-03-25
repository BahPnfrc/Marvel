//
//  MainTabBarController.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 25/03/2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    let tabBarDataSource: [(
        title: String,
        image: SystemImage.Name,
        view: UIViewController)] = [
            ("Comics", .firstTab, UIViewController()),
            ("Favoris", .secondTab, UIViewController()),
            ("À propos", .thirdTab, UIViewController())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populate()
        paint()
    }
    
    private func populate() {
        var views = [UIViewController]()
        for (_, tabBarData) in tabBarDataSource.enumerated() {
            let view = tabBarData.view
            view.title = tabBarData.title
            view.view.backgroundColor = .white
            view.tabBarItem.title = view.title
            view.tabBarItem.image = SystemImage.painted(tabBarData.image, .tabBarIcon)
            views.append(view)
        }
        viewControllers = views.map {
            UINavigationController(rootViewController: $0)
        }
    }
    
    private func paint(){
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
    }
    
}
