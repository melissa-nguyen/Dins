//
//  CardView.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/12/21.
//

import SwiftUI

struct CardView: View {

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
    @State private var translation: CGSize = .zero
    
    @State private var swipeStatus: LikeDislike = .none
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
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
                
                ZStack (alignment: self.swipeStatus == .like ? .topLeading : .topTrailing) {
                    Image(self.biz.imageName)
    //                Image(self.user.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
    //                    .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                        .clipped()
                    
                    if self.swipeStatus == .like {
                        Text("LIKE")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.green)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.green, lineWidth: 3.0)
                            ).padding(24)
                            .rotationEffect(Angle.degrees(-45))
                    } else if self.swipeStatus == .dislike {
                        Text("DISLIKE")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.red)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: 3.0)
                            ).padding(.top, 45)
                            .rotationEffect(Angle.degrees(45))
                    }
                }
                
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
                        
                        if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                            self.swipeStatus = .like
                        } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                            self.swipeStatus = .dislike
                        } else {
                            self.swipeStatus = .none
                        }
                    }.onEnded { value in
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            if self.swipeStatus == .like {
                                // session.likeResttaurant(name: self.name)
                                print("liked \(biz.name)")
                            }
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
