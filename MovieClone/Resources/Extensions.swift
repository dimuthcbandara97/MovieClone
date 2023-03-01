//
//  Extensions.swift
//  MovieClone
//
//  Created by Dimuth Bandara on 2023-03-01.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
