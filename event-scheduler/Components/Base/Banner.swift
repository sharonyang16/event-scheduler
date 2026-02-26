//
//  Banner.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/25/26.
//

import SwiftUI

enum BannerType {
    case success, info, warning, error
    
    var color: Color {
        switch self {
            case .success:
                return .green
            case .info:
                return .blue
            case .warning:
                return .yellow
            case .error:
                return .red
        }
    }
    
    var icon: String {
        switch self {
        case .success:
            return "checkmark.circle"
        case .info:
            return "info.circle"
        case .warning:
            return "exclamationmark.circle"
        case .error:
            return "exclamationmark.circle"
        }
    }
}

struct Banner : View {
    @State var message: String = ""
    @State var type: BannerType = .success
    
    var body: some View {
        HStack {
            Image(systemName: type.icon)
            Text(message)
        }
        .padding(10)
        .background(Color(type.color).opacity(0.3))
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}
