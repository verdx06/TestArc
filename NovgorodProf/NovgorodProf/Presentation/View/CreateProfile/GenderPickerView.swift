//
//  GenderPickerView.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import SwiftUI

struct GenderPickerView: View {
    // Данные формы
    @State private var birthDate = Date()
    @State private var selectedGender: String? = nil
    @State private var telegramUsername = ""
    
    var body: some View {
        Form {
            // 1. Поле "Дата рождения" (DatePicker)
            Section(header: Text("Дата рождения")) {
                DatePicker(
                    "Выберите дату",
                    selection: $birthDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical) // или .compact, .wheel
            }
            
            // 2. Поле "Пол" (выбор из Menu)
            Section(header: Text("Пол")) {
                Menu {
                    Button("Мужской") { selectedGender = "Мужской" }
                    Button("Женский") { selectedGender = "Женский" }
                } label: {
                    HStack {
                        Text(selectedGender ?? "Выберите пол")
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                }
            }
            
            // 3. Поле "Telegram" (TextField)
            Section(header: Text("Telegram")) {
                TextField("@username", text: $telegramUsername)
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
        }
        .navigationTitle("Анкета")
    }
}

#Preview {
    GenderPickerView()
}
