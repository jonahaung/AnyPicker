//
//  Protocol.swift
//  MyBike
//
//  Created by Aung Ko Min on 17/1/22.
//

import SwiftUI

public struct AnyPickableElements {
    public let title: String
    public let subTitles: String?
    public let iconName: String?
    public let color: Color?
}

public protocol AnyPickable: Identifiable {
    var elements: AnyPickableElements { get }
}
