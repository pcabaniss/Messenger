//
//  ProfileViewModel.swift
//  Messenger
//
//  Created by Phillip Cabaniss on 7/3/20.
//  Copyright © 2020 Phillip Cabaniss. All rights reserved.
//

import Foundation

enum ProfileViewModelType {
    case info, logout
}

struct ProfileViewModel {
    let viewModelType: ProfileViewModelType
    let title: String
    let handler: (() -> Void)?
}
