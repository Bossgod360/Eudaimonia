//
//  Survey Questions.swift
//  Eudaimonia
//
//  Created by Aryan Khimani on 2023-10-09.
//

import SwiftUI
/*
struct Survey_Questions: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
struct RectangleButton: View {
    let option: Int
    @Binding var selectedOptions: [Int]
    let imageName: String
    let labelText: String

    var isSelected: Bool {
        return selectedOptions.contains(option)
    }

    var body: some View {
        Button(action: {
            if isSelected {
                    // Deselect the option if it's already selected
                    selectedOptions.removeAll { $0 == option }
            } else {
                // Clear all selections and select the current option
                selectedOptions = [option]
                        }
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                    .frame(width: 335, height: 62)
                    .cornerRadius(10)
                    .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                ZStack {
                    Image(imageName)
                }.padding(.trailing, 265)

                ZStack {
                    Text(labelText)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.regular)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 262, height: 45, alignment: .topLeading)
                }.padding(.leading, 73)
            }
        }
    }
}
    var body: some View {
        NavigationView{
            VStack{
                
                Button(action: {
                    if !selectedOptions.isEmpty {
                        isNextButtonEnabled = true}
                }) {
                    NavigationLink(destination: Survey_Questions_Second()) {
                        ZStack {
                            Image("Button_Forward")
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 328)
                    .padding(.trailing, 35)
                }
                .disabled(selectedOptions.isEmpty)
                
                ZStack{
                    Image("Meditation")
                        .renderingMode(.original)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("First Questions?")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.accessibility1/*@END_MENU_TOKEN@*/)
                    }.padding(.bottom,30)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 4,
                            selectedOptions: $selectedOptions,
                            imageName: "D_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        /*
                         Text("Selected Options: \(selectedOptions.map(String.init).joined(separator: ", "))")
                         .padding(.bottom, 50.0)
                         */
                        
                    }
                    
                }
            }
        }
        
        
        
        .navigationBarBackButtonHidden(true)
    }
    
    
}
struct Survey_Questions_Second: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
struct RectangleButton: View {
    let option: Int
    @Binding var selectedOptions: [Int]
    let imageName: String
    let labelText: String

    var isSelected: Bool {
        return selectedOptions.contains(option)
    }

    var body: some View {
        Button(action: {
            if isSelected {
                    // Deselect the option if it's already selected
                    selectedOptions.removeAll { $0 == option }
            } else {
                // Clear all selections and select the current option
                selectedOptions = [option]
                        }
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                    .frame(width: 335, height: 62)
                    .cornerRadius(10)
                    .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                ZStack {
                    Image(imageName)
                }.padding(.trailing, 265)

                ZStack {
                    Text(labelText)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.regular)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 262, height: 45, alignment: .topLeading)
                }.padding(.leading, 73)
            }
        }
    }
}
    var body: some View {
        NavigationView{
            VStack{
                
                Button(action: {
                    if !selectedOptions.isEmpty {
                        isNextButtonEnabled = true}
                }) {
                    NavigationLink(destination: Survey_Questions_Third()) {
                        ZStack {
                            Image("Button_Forward")
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 328)
                    .padding(.trailing, 35)
                }
                .disabled(selectedOptions.isEmpty)
                
                ZStack{
                    Image("Meditation")
                        .renderingMode(.original)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Second Questions?")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.accessibility1/*@END_MENU_TOKEN@*/)
                    }.padding(.bottom,30)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 4,
                            selectedOptions: $selectedOptions,
                            imageName: "D_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        /*
                         Text("Selected Options: \(selectedOptions.map(String.init).joined(separator: ", "))")
                         .padding(.bottom, 50.0)
                         */
                        
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Survey_Questions_Third: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
struct RectangleButton: View {
    let option: Int
    @Binding var selectedOptions: [Int]
    let imageName: String
    let labelText: String

    var isSelected: Bool {
        return selectedOptions.contains(option)
    }

    var body: some View {
        Button(action: {
            if isSelected {
                    // Deselect the option if it's already selected
                    selectedOptions.removeAll { $0 == option }
            } else {
                // Clear all selections and select the current option
                selectedOptions = [option]
                        }
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                    .frame(width: 335, height: 62)
                    .cornerRadius(10)
                    .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                ZStack {
                    Image(imageName)
                }.padding(.trailing, 265)

                ZStack {
                    Text(labelText)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.regular)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 262, height: 45, alignment: .topLeading)
                }.padding(.leading, 73)
            }
        }
    }
}
    var body: some View {
        NavigationView{
            VStack{
                
                Button(action: {
                    if !selectedOptions.isEmpty {
                        isNextButtonEnabled = true}
                }) {
                    NavigationLink(destination: Survey_Questions_Fourth()) {
                        ZStack {
                            Image("Button_Forward")
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 328)
                    .padding(.trailing, 35)
                }
                .disabled(selectedOptions.isEmpty)
                
                ZStack{
                    Image("Meditation")
                        .renderingMode(.original)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Third Questions?")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.accessibility1/*@END_MENU_TOKEN@*/)
                    }.padding(.bottom,30)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 4,
                            selectedOptions: $selectedOptions,
                            imageName: "D_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        /*
                         Text("Selected Options: \(selectedOptions.map(String.init).joined(separator: ", "))")
                         .padding(.bottom, 50.0)
                         */
                        
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Survey_Questions_Fourth: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
struct RectangleButton: View {
    let option: Int
    @Binding var selectedOptions: [Int]
    let imageName: String
    let labelText: String

    var isSelected: Bool {
        return selectedOptions.contains(option)
    }

    var body: some View {
        Button(action: {
            if isSelected {
                    // Deselect the option if it's already selected
                    selectedOptions.removeAll { $0 == option }
            } else {
                // Clear all selections and select the current option
                selectedOptions = [option]
                        }
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                    .frame(width: 335, height: 62)
                    .cornerRadius(10)
                    .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                ZStack {
                    Image(imageName)
                }.padding(.trailing, 265)

                ZStack {
                    Text(labelText)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.regular)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 262, height: 45, alignment: .topLeading)
                }.padding(.leading, 73)
            }
        }
    }
}
    var body: some View {
        NavigationView{
            VStack{
                
                Button(action: {
                    if !selectedOptions.isEmpty {
                        isNextButtonEnabled = true}
                }) {
                    NavigationLink(destination: Homepage()) {
                        ZStack {
                            Image("Button_Forward")
                                .renderingMode(.original)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 328)
                    .padding(.trailing, 35)
                }
                .disabled(selectedOptions.isEmpty)
                
                ZStack{
                    Image("Meditation")
                        .renderingMode(.original)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Fourth Questions?")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.accessibility1/*@END_MENU_TOKEN@*/)
                    }.padding(.bottom,30)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 4,
                            selectedOptions: $selectedOptions,
                            imageName: "D_Button",
                            labelText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                        ).padding(.bottom, 19)
                        /*
                         Text("Selected Options: \(selectedOptions.map(String.init).joined(separator: ", "))")
                         .padding(.bottom, 50.0)
                         */
                        
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
*/
#Preview {
    Survey_Questions()
}
