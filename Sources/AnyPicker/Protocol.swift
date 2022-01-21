//
//  Protocol.swift
//  MyBike
//
//  Created by Aung Ko Min on 17/1/22.
//

import SwiftUI

public struct AnyPickableElements {
    public let title: String
    public let subTitle: String?
    public let iconName: String?
    public let color: Color?
    
    public init(title: String, subTitle: String?, iconName: String?, color: Color?) {
        self.title = title
        self.subTitle = subTitle
        self.iconName = iconName
        self.color = color
    }
}

public protocol AnyPickable: Identifiable {
    var elements: AnyPickableElements { get }
}
