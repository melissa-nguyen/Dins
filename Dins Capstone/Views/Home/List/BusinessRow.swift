//
//  BusinessRow.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/9/21.
//

import SwiftUI

struct BusinessRow: View {
    
    var business: Business
    
    var body: some View {
       
        VStack (alignment: .leading) {
            
            HStack {
                // Image
                
                // Name and distance
                VStack (alignment: .leading) {
                    Text(business.name ?? "")
                    Text(String(business.distance ?? 0.0))
                    
                }
                
                Spacer()
                
                // Star rating and number of reviews
                VStack (alignment: .leading) {
                    Image("regular_\(business.rating ?? 0)")
                    Text("\(business.reviewCount ?? 0) Reviews")
                        .font(.caption)
                    
                }
            }
            Divider()
        }
        
    }
}

