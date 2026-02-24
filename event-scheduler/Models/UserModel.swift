//
//  UserModel.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

struct UserModel: Codable, Identifiable  {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
}
