//
//  SideMenuNavigationController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/15/21.
//

import UIKit
import SideMenu

class SideNavigationController:UINavigationController {
    weak var menu : SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSideMenu()
        //self.setNavigationBarHidden(true, animated: false)
    }
    
    func initSideMenu(){
        /// Define the menus
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: SideMenuViewController())
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
        SideMenuManager.default.rightMenuNavigationController = nil

        ///force menu to open left (default is right)
        leftMenuNavigationController.leftSide = true
        /// (Optional) Prevent status bar area from turning black when menu appears:
        leftMenuNavigationController.statusBarEndAlpha = 0
        leftMenuNavigationController.presentingViewControllerUseSnapshot = true
        let presentationStyle = SideMenuPresentationStyle.viewSlideOut
        
        
        
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
 
        leftMenuNavigationController.settings = settings
        
        /// Copy all settings to the other menu
        self.menu = leftMenuNavigationController
    }
    
    /// presents menu (opens it)
    func presentMenu(){
        ///get menu as a non optional
        guard let menu = self.menu else {
            return ///if not found return
        }
        ///present
        present(menu, animated: true, completion: nil)
    }
    
    func setNavigationStackAnimated(viewController: UIViewController, completion: @escaping () -> Void = { }){
        self.setNavigationBarHidden(true, animated: false)
        UIView.transition(with: self.view!, duration: 0.34, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
         
            self.setViewControllers([viewController], animated: true)
        }, completion: { (isFinished) in
            completion()
        })

    }
    
}


extension UIViewController{
    
    /// creates left menu button for view controllers to use
    func setLeftMenuButton(){
        ///generate container view
        let containerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 35, height: 35))
        ///generate button's image
        let addRegistryImage = UIImage(named: "icMenu")
        ///generate button
        let addRegistryButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        
        ///set button style configuration
        addRegistryButton.setImage(addRegistryImage, for: .normal)
        addRegistryButton.contentVerticalAlignment = .fill
        addRegistryButton.contentHorizontalAlignment = .fill
        addRegistryButton.addTarget(self, action: #selector(UIViewController.openLeftMenu), for: .touchUpInside)
        
        ///add button to container
        containerView.addSubview(addRegistryButton)
        
        ///set left button items as a menu button
        self.navigationItem.leftBarButtonItems  =  [UIBarButtonItem.init(customView: containerView)]
        
    }
    
    
    
    
    /// opens left menu
    @objc func openLeftMenu(){
        ///get navigation controller
        guard let navigationVC = self.navigationController as? SideNavigationController else{
            return
        }
        ///present left menu (opens it)
        navigationVC.presentMenu()
    }
}


extension SideNavigationController {
    func openMainMenu(completion: @escaping () -> Void = { }){
        let mainViewController = MainScreenViewController()
        self.setNavigationStackAnimated(viewController: mainViewController){ [weak self] in
            self?.menu?.dismiss(animated: true, completion: nil)
        }
    }
}
