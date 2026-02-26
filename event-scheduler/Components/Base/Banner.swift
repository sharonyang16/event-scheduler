//
//  Banner.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/25/26.
//

import SwiftUI

struct Banner : View {
    @State var message: String
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.circle")
            Text(message)
        }
        .padding(10)
        .background(Color(.red).opacity(0.3))
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}
