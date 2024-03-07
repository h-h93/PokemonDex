//
//  ViewController.swift
//  PokemonDex
//
//  Created by hanif hussain on 05/03/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        Task {
           try await print(NetworkManager.shared.getPokemon())
            
        }
    }


}

