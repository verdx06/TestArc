//
//  SwiftUIView.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 19.05.2025.
//

import SwiftUI

public struct CustomTextField: View {
    
    let title: String
    let example: String
    let security: Bool
    let picker: Bool
    let errorMessage: String
    @Binding var text: String
    @State var eye: Bool = false
    
    public init(title: String, example: String, security: Bool = false, picker: Bool = false, errorMessage: String = "", text: Binding<String>) {
        self.title = title
        self.example = example
        self.security = security
        self.picker = picker
        self.errorMessage = errorMessage
        self._text = text
    }
    
    public var body: some View {
        VStack(alignment: .leading){
            if !title.isEmpty {
                Text(title)
                    .BenbowFont(size: 14)
                    .foregroundStyle(Color("hex#7E7E9A", bundle: .module))
            }
            ZStack {
                if picker {
                    Menu {
                        Button("Male") { text = "Male" }
                        Button("Female") { text = "Female" }
                    } label: {
                        HStack {
                            Text(text.isEmpty ? "Пол" : text)
                                .foregroundStyle(!text.isEmpty ? Color.black : Color("hex#939396", bundle: .module))
                            Spacer()
                            Image("shevron", bundle: .module)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(!errorMessage.isEmpty ? "error#FD3535" : "hex#F5F5F9", bundle: .module))
                                    .opacity(!errorMessage.isEmpty ? 0.1 : 1)
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 1)
                                            .foregroundStyle(Color(!errorMessage.isEmpty ? "error#FD3535" : "hex#EBEBEB", bundle: .module))
                                    })
                            )
                    }

                } else {
                    if security && !eye {
                        SecureField("", text: $text)
                            .padding(.horizontal).frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(!errorMessage.isEmpty ? "error#FD3535" : "hex#F5F5F9", bundle: .module))
                                    .opacity(!errorMessage.isEmpty ? 0.1 : 1)
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 1)
                                            .foregroundStyle(Color(!errorMessage.isEmpty ? "error#FD3535" : "hex#EBEBEB", bundle: .module))
                                    })
                            )
                    }
                    else {
                        TextField("", text: $text)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(!errorMessage.isEmpty ? "error#FD3535" : "hex#F5F5F9", bundle: .module))
                                    .opacity(!errorMessage.isEmpty ? 0.1 : 1)
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 1)
                                            .foregroundStyle(Color(!errorMessage.isEmpty ? "error#FD3535" : "hex#EBEBEB", bundle: .module))
                                    })
                            )
                    }
                    
                    HStack {
                        if !security && text.isEmpty {
                            Text(example)
                                .foregroundStyle(title.isEmpty ? Color("hex#939396", bundle: .module) : Color("hex#B8C1CC", bundle: .module))
                        }
                        Spacer()
                        if security {
                            Button {
                                eye.toggle()
                            } label: {
                                Image(eye ? "EyeOpen" : "EyeClose", bundle: .module)
                            }
                            
                        }
                    }.padding(.horizontal)
                }
            }
            if !errorMessage.isEmpty {
                HStack {
                    Text(errorMessage)
                        .BenbowFont(size: 14)
                        .foregroundStyle(Color( "error#FD3535", bundle: .module))
                    Spacer()
                }.padding(.top, 8)
            }
        }
    }
}

#Preview {
    CustomTextField(title: "", example: "", picker: true, errorMessage: "gbplf!", text: .constant(""))
}
