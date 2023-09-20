//
//  CardItem.swift
//  Custom_Swipeto_delete
//
//  Created by vignesh kumar c on 20/09/23.
//

import SwiftUI

struct Item: Identifiable {
        
    var id = UUID()
    var name: String
    var details: String
    var image: String
    var price: Double
    var quantity: Int
    var offSet: CGFloat
    var isSwipe: Bool
    
}

