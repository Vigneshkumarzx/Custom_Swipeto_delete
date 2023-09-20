//
//  CartViewModel.swift
//  Custom_Swipeto_delete
//
//  Created by vignesh kumar c on 20/09/23.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
 @Published var item = [
    Item(name: "milk", details: "one litre", image: "p1", price: 40.0, quantity: 1, offSet: 0, isSwipe: false),
    Item(name: "milk", details: "one litre", image: "p2", price: 40.0, quantity: 1, offSet: 0, isSwipe: false),
    Item(name: "milk", details: "one litre", image: "p3", price: 40.0, quantity: 1, offSet: 0, isSwipe: false),
    Item(name: "milk", details: "one litre", image: "p4", price: 40.0, quantity: 1, offSet: 0, isSwipe: false),
    Item(name: "milk", details: "one litre", image: "p5", price: 40.0, quantity: 1, offSet: 0, isSwipe: false)
    
  ]
}


