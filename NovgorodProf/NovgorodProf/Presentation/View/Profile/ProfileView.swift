//
//  ProfileView.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import SwiftUI
import Kingfisher
import UIKitComponents

struct ProfileView: View {
    
    let user: UserModel
    @StateObject var pvm: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SearchFIeldView(text: $pvm.textSearch)
                .padding(.top, 24)
            Text("Акции и новости")
                .BenbowFont(size: 17, font: .semibold)
                .foregroundStyle(.hex939396)
                .padding(.top, 32)
                .padding(.bottom, 16)
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(pvm.images, id: \.self) { image in
                        KFImage(URL(string: image.url))
                            .resizable()
                            .frame(width: 270, height: 152)
                            .cornerRadius(12)
                            .padding(.trailing, 16)
                    }
                }
            }
            Text("Каталог описаний")
                .BenbowFont(size: 17, font: .semibold)
                .foregroundStyle(.hex939396)
                .padding(.top, 32)
                .padding(.bottom, 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(pvm.category, id: \.self) { category in
                        CatalogButtonView(title: category) {
                            //
                        }.padding(.trailing, 16)
                    }
                }
            }
            
            Spacer()
                
        }.navigationBarBackButtonHidden()
            .onAppear {
                pvm.loadPromo()
            }
            .padding(.horizontal, 20)
    }
}

#Preview {
    ProfileView(user: UserModel(email: "email", name: "Jhon", telegram: ""), pvm: ProfileViewModel(domain: ProfileAssembly.useCase()))
}
