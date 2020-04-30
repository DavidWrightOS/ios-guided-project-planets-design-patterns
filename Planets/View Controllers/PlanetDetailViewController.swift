//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 9/20/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let planet = planet, isViewLoaded else {
            imageView?.image = nil
            label?.text = nil
            return
        }
        
        imageView.image = planet.image
        label.text = planet.name
    }
    
    // MARK: - Make the ViewController's state Restorable
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        guard let existingPlanet = planet else { return }
        
        do {
            let existingPlanetData = try PropertyListEncoder().encode(existingPlanet)
            coder.encode(existingPlanetData, forKey: "existingPlanetKey")
        } catch {
            print(error)
        }
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        guard let existingPlanetData = coder.decodeObject(forKey: "existingPlanetKey") as? Data else {
            
            return
        }
        
        do {
            let existingPlanet = try PropertyListDecoder().decode(Planet.self, from: existingPlanetData)
            planet = existingPlanet
        } catch {
            print(error)
        }
    }
}
