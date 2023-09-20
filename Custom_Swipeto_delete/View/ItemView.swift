//
//  ItemView.swift
//  Custom_Swipeto_delete
//
//  Created by vignesh kumar c on 20/09/23.
//

import SwiftUI

struct ItemView: View {
    @Binding var item: Item
    @Binding var items: [Item]
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: .init(colors: [Color("blue"), Color("orange")]),
                           startPoint: .leading,
                           endPoint: .trailing)
            
            HStack {
                Spacer()
                HStack {
                    Button {
                        withAnimation(.easeIn) {
                            deleteItem()
                        }
                    } label: {
                        Image(systemName: "trash")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 90, height: 50)
                    }
                    
                    Button {
                        withAnimation(.easeIn) {
                            deleteItem()
                        }
                       
                    } label: {
                        Image(systemName: "trash")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 90, height: 50)
                    }
                }

            }
            
            HStack(spacing: 15) {
                
                Image(item.image)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 130, height: 130)
//                    .cornerRadius(15)
                    .border(Color.yellow, width: 2)
                    .background(Color.purple)
                    .cornerRadius(4)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.name)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Text(item.details)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 15) {
                        
                        Text(getPrice(value: item.price))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        
                        Button {
                            if item.quantity > 1 { item.quantity -= 1}
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: 12, weight: .heavy))
                                .foregroundColor(.black)
                        }
                        
                        Text("\(item.quantity)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(Color.black.opacity(0.06))
                        
                        Button {
                            if item.quantity > 0 { item.quantity += 1 }
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 12, weight: .heavy))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding()
            .background(Color.white)
            .contentShape(Rectangle())
            .offset(x: item.offSet)
            .gesture(DragGesture().onChanged(onChnage(value:)).onEnded(onEnd(value:)))
        }
    }
    
    func onChnage(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if item.isSwipe {
                item.offSet = value.translation.width - 180
            } else {
                item.offSet = value.translation.width
            }
        }
        //
        withAnimation {
            items.enumerated().forEach { (i, item) in
                if item.id != self.item.id {
                    self.items[i].isSwipe = false
                    self.items[i].offSet = 0
                }
            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation {
            if value.translation.width < 0 {
                
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    
                    item.offSet = -100
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        deleteItem()
                    }
                } else if -item.offSet > 50 {
                    item.isSwipe = true
                    item.offSet = -180
                } else {
                    item.isSwipe = false
                    item.offSet = 0
                }
            } else {
                item.isSwipe = false
                item.offSet = 0
            }
        }
    }
    
    func deleteItem() {
        items.removeAll { item -> Bool in
            return self.item.id == item.id
        }
    }
}

func getPrice(value: Double) -> String {
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    
    return formatter.string(from: NSNumber(value: value)) ?? ""
}

