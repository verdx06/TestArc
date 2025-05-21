//
//  ProfileView.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import SwiftUI

struct ProfileView: View {
    
    let user: UserModel
    
    var body: some View {
        VStack {
            Text(user.email)
                .font(.title)
            Text(user.name ?? "No name")
                .font(.headline)
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView(user: UserModel(email: "email", name: "Jhon", telegram: ""))
}
