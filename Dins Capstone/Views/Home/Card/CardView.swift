//
//  CardView.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/12/21.
//

import SwiftUI

struct CardView: View {

    
    @State private var translation: CGSize = .zero
    
    // MARK: - user
//    private var user: User
//    private var onRemove: (_ user: User) -> Void
//
//    private var thresholdPercentage: CGFloat = 0.5
//
//    init(user: User, onRemove: @escaping(_ user: User) -> Void) {
//        self.user = user
//        self.onRemove = onRemove
//    }
    
    // MARK: - bizzes [Biz]
    private var biz: Biz
    private var onRemove: (_ biz: Biz) -> Void

    private var thresholdPercentage: CGFloat = 0.5

    init(biz: Biz, onRemove: @escaping(_ biz: Biz) -> Void) {
        self.biz = biz
        self.onRemove = onRemove
    }
    
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        
        
        GeometryReader { geometry in
            
            VStack (alignment: .leading) {
                Image(self.biz.imageName)
//                Image(self.user.imageName)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                
                HStack {
                    VStack (alignment: .leading, spacing: 6) {
                        Text("\(biz.name)")
//                        Text("\(self.user.firstName) \(self.user.lastName), \(self.user.age)")
                            .font(.title)
                            .bold()
                        Text("\(biz.address)")
//                        Text(verbatim: self.user.occupation)
                            .font(.subheadline)
                            .bold()
                        Text("\(biz.phone)")
//                        Text("\(self.user.mutualFriends) Mutual Friends")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Image("regular_\(biz.review)")
                        Text("Reviews: \(biz.reviewCount)")
                            .font(.footnote)
                    }
                    Spacer()
                    Spacer()
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                  
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { value in
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.biz)
                        } else {
                            self.translation = .zero
                        }
                     
                    }
            )
        }
        .frame(height: 500).padding()
    }
    
}
