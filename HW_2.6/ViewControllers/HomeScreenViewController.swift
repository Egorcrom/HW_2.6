//
//  HomeScreenViewController.swift
//  HW_2.6
//
//  Created by Егор Кромин on 05.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func sendColors(for red: CGFloat, and green: CGFloat, and blue: CGFloat)
}

class HomeScreenViewController: UIViewController {
    
    var backgroundColors = (CGFloat(0.5), CGFloat(0.5), CGFloat(0.5))
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        view.backgroundColor = UIColor(red: backgroundColors.0, green: backgroundColors.1, blue: backgroundColors.2, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colors = getRGBA()
        settingsVC.delegate = self
    }
    private func getRGBA () -> (CGFloat, CGFloat, CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        view.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue)
    }
}
// MARK: - HomeScreenViewControllerDelegate

extension HomeScreenViewController: SettingsViewControllerDelegate {
    func sendColors(for red: CGFloat, and green: CGFloat, and blue: CGFloat) {
        backgroundColors.0 = red
        backgroundColors.1 = green
        backgroundColors.2 = blue
    }
}
