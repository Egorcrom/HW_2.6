//
//  HomeScreenViewController.swift
//  HW_2.6
//
//  Created by Егор Кромин on 05.11.2021.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colors = getRGBA()
    }
}
extension HomeScreenViewController {
    private func getRGBA () -> (CGFloat, CGFloat, CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        view.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue)
    }
}
