//
//  ContentView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/3/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: event_schedulerDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(event_schedulerDocument()))
}
