//
//  BusinessSectionHeader.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/9/21.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
        }
        

    }
}

struct BusinessSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Restaurants")
    }
}
