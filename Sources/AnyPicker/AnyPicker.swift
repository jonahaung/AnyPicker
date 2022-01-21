//
//  CustomPicker.swift
//  MyBike
//
//  Created by Aung Ko Min on 25/12/21.
//

import SwiftUI


public struct AnyPicker<T: AnyPickable>: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    private var data: [T]
    private var selectedData: Binding<T>
    
    private var displayData: [T] {
        if searchText.isEmpty {
            return data
        }
        return data.filter{ $0.elements.title.contains(searchText) }
    }
    
    @State private var searchText = ""
    
    public init(_ data: [T], _ selectedData: Binding<T>) {
        self.data = data
        self.selectedData = selectedData
    }
    
    public var body: some View {
        
        List(displayData) { item in
            HStack {
                if let icon = item.elements.iconName {
                    Image(systemName: icon)
                        .foregroundColor(item.elements.color)
                }
                Text(item.elements.title)
                Spacer()
                if let x = item.elements.subTitle {
                    Text(x)
                }
                if item.id == selectedData.wrappedValue.id {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.accentColor)
                }
            }
            .background(
                Button(action: {
                    selectedData.wrappedValue = item
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Color.clear
                })
            
            )
            
        }
        .navigationBarTitle(selectedData.wrappedValue.elements.title)
        .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search")
    }
}
