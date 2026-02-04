//
//  event_schedulerApp.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/3/26.
//

import SwiftUI

@main
struct event_schedulerApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: event_schedulerDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
