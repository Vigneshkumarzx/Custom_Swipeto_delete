//
//  CartView.swift
//  Custom_Swipeto_delete
//
//  Created by vignesh kumar c on 20/09/23.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var cartData = CartViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color.black)
                }
                
                Text("Mycart")
                    .foregroundColor(Color.black)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
                
            }
            .padding()
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    
                    ForEach(cartData.item) { item in
                        
                        ItemView(item: $cartData.item[getIndex(item: item)], items: $cartData.item)
                        
                    }
                }
            }
            
            VStack {
                HStack {
                    
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(getTtlPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .padding([.top, .horizontal])
                
                Button {
                    
                } label: {
                    Text("Checkout")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(
                            LinearGradient(gradient: .init(colors: [Color("blue"), Color("orange")]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                }

            }
            .background(Color.white)
        }
        .background(Color.white)
    }
    
    func getIndex(item: Item) -> Int {
        
        return cartData.item.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func getTtlPrice() -> String {
        var price: Double = 0
        
        cartData.item.forEach { item in
            price += Double(item.quantity) * item.price
        }
        return getPrice(value: price)
    }
}

