//
//  TrackParameters.swift
//  LabUI
//
//  Created by Erik Flores on 11/10/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import Foundation

class TrackParameters {

    var viewed: String {
        return ""
    }

    func getValues() -> [String: Any] {
        return ["cellViewed": viewed]
    }
}
