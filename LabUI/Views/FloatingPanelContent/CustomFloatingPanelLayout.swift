//
//  CustomFloatingPanelLayout.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit
import FloatingPanel

class CustomFloatingPanelLayout: FloatingPanelLayout {

    public var initialPosition: FloatingPanelPosition {
        return .tip
    }

    var supportedPositions: Set<FloatingPanelPosition> {
        return [.tip, .half]
    }

    public func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
            case .half: return 516.0
            case .tip: return 80.0
            default: return nil
        }
    }

    func backdropAlphaFor(position: FloatingPanelPosition) -> CGFloat {
        return position == .half ? 0.5 : 0.0
    }


}

