//
//  CardView.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/12/21.
//

import SwiftUI

struct CardView: View {
    
    var business: Business
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack (alignment: .leading) {
                // Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75) // 3
                    .clipped()
                
                // HStack with Business Name, Address, Reviews & Phone
                HStack {
                    VStack (alignment: .leading) {
                        // Name, Address & Rating
                        BusinessTitle(business: business)
                        
                        // Reviews 
                        Text("\(business.reviewCount ?? 0) Reviews")
                        
                    }
                }
            }
        
        }
        
    }
}




//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
