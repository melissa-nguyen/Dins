//
//  BusinessTitle.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/11/21.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            // Business Name
            Text(business.name!)
                .font(.largeTitle)
               
            
            // Loop through display address
            if business.location?.displayAddress != nil {
                
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
        
        
    }
}

