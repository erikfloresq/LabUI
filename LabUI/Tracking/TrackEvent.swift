//
//  TrackEvent.swift
//  LabUI
//
//  Created by Erik Flores on 11/10/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import Foundation

struct TrackEvent {
    var parameters: TrackParameters

    func track() {
        print(parameters)
    }
}
