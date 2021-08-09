//
//  BusinessSection.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/9/21.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section (header: BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
                
                BusinessRow(business: business)
                
            }
        }
    }
}

