//
//  ContentView.swift
//  Eudaimonia
//
//  Created by Aryan Khimani on 2023-10-09.
//

import SwiftUI
class SharedData: ObservableObject {
    @Published var score: Int = 0
    @Published var balance: Int = 0
    @Published var workout: Int = 0
    @Published var relationship: Int = 0
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack {
                    Image("Hiking_1")
                }
                .padding(.bottom, 10.0)
                ZStack{
                    Text("Eudaimonia")
                        .fontWeight(.bold)
                        .dynamicTypeSize(/*@START_MENU_TOKEN@*/.accessibility3/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .shadow(color: .black.opacity(0.21), radius: 2, x: 7, y: 6)
                }.padding(.bottom,5)
                ZStack{
                    Text("Answer a Quick Survey")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 10.0)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 191, height: 41)
                        .background(.black)
                        .cornerRadius(6)
                        .shadow(color: .black.opacity(0.26), radius: 4.5, x: 4, y: 7)
                    NavigationLink(destination: Survey_Questions()) {
                        Text("Start Here")
                            .fontWeight(.heavy)
                            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
                            .kerning(1.092)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        .frame(width: 323, alignment: .top)}
                }
                .padding(.vertical, 30.0)
                
            }
        }
    }
}
struct Survey_Questions: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
    @State private var isSurveyQuestionsActive = false
    @EnvironmentObject var sharedData: SharedData
struct RectangleButton: View {
    let option: Int
    @Binding var selectedOptions: [Int]
    let imageName: String
    let labelText: String
    @EnvironmentObject var sharedData: SharedData
    let work_life: Int
    var isSelected: Bool {
        return selectedOptions.contains(option)
    }

    var body: some View {
        Button(action: {
            if isSelected {
                    // Deselect the option if it's already selected
                    sharedData.score -= option
                    sharedData.balance -= work_life
                    selectedOptions.removeAll { $0 == option }
            } else {
                // Clear all selections and select the current option
                sharedData.score += option
                sharedData.balance += work_life
                selectedOptions = [option]
                        }
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                    .frame(width: 365, height: 62)
                    .cornerRadius(10)
                    .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                ZStack {
                    Image(imageName)
                }.padding(.trailing, 295)

                ZStack {
                    Text(labelText)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.regular)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 282, height: 45, alignment: .topLeading)
                }.padding(.leading, 53)
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
                    Image("Q1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("How much time are you spending on HW?")
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            
                    }.padding(.bottom,30)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Minimal Effort: I don't prioritize homework and invest minimal time.", work_life:1
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Balanced Approach: I consider homework relatively important", work_life:2
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "Excessively Work: Homework is crucial to me, but I overexert myself", work_life:3
                        ).padding(.bottom, 19)
                        
                       
                         
                        
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
    @EnvironmentObject var sharedData: SharedData
struct RectangleButton: View {
        let option: Int
        @Binding var selectedOptions: [Int]
        let imageName: String
        let labelText: String
        @EnvironmentObject var sharedData: SharedData
        let work_life: Int
        let activity: Int
        var isSelected: Bool {
            return selectedOptions.contains(option)
        }

        var body: some View {
            Button(action: {
                if isSelected {
                        // Deselect the option if it's already selected
                        sharedData.score -= option
                        sharedData.balance -= work_life
                        sharedData.workout -= activity
                        selectedOptions.removeAll { $0 == option }
                } else {
                    // Clear all selections and select the current option
                    sharedData.score += option
                    sharedData.balance += work_life
                    sharedData.workout += activity
                    selectedOptions = [option]
                            }
            }) {
                ZStack {
                    Rectangle()
                        .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                        .frame(width: 365, height: 62)
                        .cornerRadius(10)
                        .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                    ZStack {
                        Image(imageName)
                    }.padding(.trailing, 295)

                    ZStack {
                        Text(labelText)
                            .multilineTextAlignment(.leading)
                            .fontWeight(.regular)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 282, height: 45, alignment: .topLeading)
                    }.padding(.leading, 53)
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
                    Image("Q2")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, -20.0)
                VStack{
                    ZStack{
                        Text("How much time are you spending on extracurriculars?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,20)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "No Extracurriculars: I don't do extracurriculars.", work_life: 1, activity:1)
                        .padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Balanced Life: I balance homework, extracurriculars & etc.",
                            work_life:2, activity:2
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "No Extracurriculars: I don't do extracurriculars, and it bothers me.", work_life:3, activity:3
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 4,
                            selectedOptions: $selectedOptions,
                            imageName: "D_Button",
                            labelText: "Stressful Commitment: Extracurriculars stress me out.", work_life:4, activity:4
                        ).padding(.bottom, 19)
                        /*
                         Text("Score: \(sharedData.score)")
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
    @EnvironmentObject var sharedData: SharedData
struct RectangleButton: View {
            let option: Int
            @Binding var selectedOptions: [Int]
            let imageName: String
            let labelText: String
            @EnvironmentObject var sharedData: SharedData
            let work_life: Int
            let activity: Int
            var isSelected: Bool {
                return selectedOptions.contains(option)
            }

            var body: some View {
                Button(action: {
                    if isSelected {
                            // Deselect the option if it's already selected
                            sharedData.score -= option
                            sharedData.balance -= work_life
                            sharedData.workout -= activity
                            selectedOptions.removeAll { $0 == option }
                    } else {
                        // Clear all selections and select the current option
                        sharedData.score += option
                        sharedData.balance += work_life
                        sharedData.workout += activity
                        selectedOptions = [option]
                                }
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                            .frame(width: 365, height: 62)
                            .cornerRadius(10)
                            .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                        ZStack {
                            Image(imageName)
                        }.padding(.trailing, 295)

                        ZStack {
                            Text(labelText)
                                .multilineTextAlignment(.leading)
                                .fontWeight(.regular)
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 282, height: 45, alignment: .topLeading)
                        }.padding(.leading, 53)
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
                    Image("Q3")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("How much leisure time do you have?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "I have the right amount of time in which I feel happy and relaxed.", work_life: 1, activity:1
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "I have the right amount of time in which I feel happy and relaxed", work_life: 2, activity:2
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "I get either very limited or no leisure time.", work_life: 3, activity:3
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
    @EnvironmentObject var sharedData: SharedData
struct RectangleButton: View {
        let option: Int
        @Binding var selectedOptions: [Int]
        let imageName: String
        let labelText: String
        @EnvironmentObject var sharedData: SharedData

        var isSelected: Bool {
            return selectedOptions.contains(option)
        }

        var body: some View {
            Button(action: {
                if isSelected {
                        // Deselect the option if it's already selected
                        sharedData.score -= option
                        selectedOptions.removeAll { $0 == option }
                } else {
                    // Clear all selections and select the current option
                    sharedData.score += option
                    selectedOptions = [option]
                            }
            }) {
                ZStack {
                    Rectangle()
                        .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                        .frame(width: 365, height: 62)
                        .cornerRadius(10)
                        .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                    ZStack {
                        Image(imageName)
                    }.padding(.trailing, 295)

                    ZStack {
                        Text(labelText)
                            .multilineTextAlignment(.leading)
                            .fontWeight(.regular)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 282, height: 45, alignment: .topLeading)
                    }
                    .padding(.leading, 53)
                    .padding(.top, 23)
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
                    NavigationLink(destination: Survey_Questions_Fivth()) {
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
                    Image("Q4")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("How much sleep are you getting per night?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Less than 8 hrs"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Between 8 - 10 hrs"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "More than 10 hrs"
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
struct Survey_Questions_Fivth: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
    @EnvironmentObject var sharedData: SharedData
struct RectangleButton: View {
            let option: Int
            @Binding var selectedOptions: [Int]
            let imageName: String
            let labelText: String
            let family: Int
            @EnvironmentObject var sharedData: SharedData

            var isSelected: Bool {
                return selectedOptions.contains(option)
            }

            var body: some View {
                Button(action: {
                    if isSelected {
                            // Deselect the option if it's already selected
                            sharedData.score -= option
                            sharedData.relationship -= family
                            selectedOptions.removeAll { $0 == option }
                    } else {
                        // Clear all selections and select the current option
                        sharedData.score += option
                        sharedData.relationship += family
                        selectedOptions = [option]
                                }
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                            .frame(width: 365, height: 62)
                            .cornerRadius(10)
                            .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                        ZStack {
                            Image(imageName)
                        }.padding(.trailing, 295)

                        ZStack {
                            Text(labelText)
                                .multilineTextAlignment(.leading)
                                .fontWeight(.regular)
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 282, height: 45, alignment: .topLeading)
                        }.padding(.leading, 53)
                            .padding(.top, 23)
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
                    NavigationLink(destination: Survey_Questions_Sixth()) {
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
                    Image("Q5")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Do you feel as if you have friends that support you and accept you as you are?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Yes", family: 1
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "No", family: 2
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "I'm not sure", family: 3
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
struct Survey_Questions_Sixth: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
    @EnvironmentObject var sharedData: SharedData
struct RectangleButton: View {
                let option: Int
                @Binding var selectedOptions: [Int]
                let imageName: String
                let labelText: String
                let family: Int
                @EnvironmentObject var sharedData: SharedData

                var isSelected: Bool {
                    return selectedOptions.contains(option)
                }

                var body: some View {
                    Button(action: {
                        if isSelected {
                                // Deselect the option if it's already selected
                                sharedData.score -= option
                                sharedData.relationship -= family
                                selectedOptions.removeAll { $0 == option }
                        } else {
                            // Clear all selections and select the current option
                            sharedData.score += option
                            sharedData.relationship += family
                            selectedOptions = [option]
                                    }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                                .frame(width: 365, height: 62)
                                .cornerRadius(10)
                                .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                            ZStack {
                                Image(imageName)
                            }.padding(.trailing, 295)

                            ZStack {
                                Text(labelText)
                                    .multilineTextAlignment(.leading)
                                    .fontWeight(.regular)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 282, height: 45, alignment: .topLeading)
                            }.padding(.leading, 53)
                                .padding(.top, 23)
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
                    NavigationLink(destination: Survey_Questions_Seventh()) {
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
                    Image("Q6")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Do you feel as if you have a trusted adult to talk to when you are feeling down?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Yes",family: 1
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "No",family: 2
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "I'm not sure",family: 3
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
struct Survey_Questions_Seventh: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
    @EnvironmentObject var sharedData: SharedData
struct RectangleButton: View {
            let option: Int
            @Binding var selectedOptions: [Int]
            let imageName: String
            let labelText: String
            @EnvironmentObject var sharedData: SharedData

            var isSelected: Bool {
                return selectedOptions.contains(option)
            }

            var body: some View {
                Button(action: {
                    if isSelected {
                            // Deselect the option if it's already selected
                            sharedData.score -= option
                            selectedOptions.removeAll { $0 == option }
                    } else {
                        // Clear all selections and select the current option
                        sharedData.score += option
                        selectedOptions = [option]
                                }
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .black)
                            .frame(width: 365, height: 62)
                            .cornerRadius(10)
                            .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                        ZStack {
                            Image(imageName)
                        }.padding(.trailing, 295)

                        ZStack {
                            Text(labelText)
                                .multilineTextAlignment(.leading)
                                .fontWeight(.regular)
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 282, height: 45, alignment: .topLeading)
                        }.padding(.leading, 53)
                            .padding(.top, 23)
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
                    NavigationLink(destination: Results()) {
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
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Finally, how content do you feel on a daily basis?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "I feel content with my life."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "I never really know how I feel."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "I feel stressed and unhappy."
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

struct TestZone2: View{
    @EnvironmentObject var sharedData: SharedData
    var calculatedScore: Int {
            let rawScore = sharedData.score * 4
            return min(rawScore, 100)
               }
    var calculatedScoreString: String {
           return String(calculatedScore)
       }
    var body: some View {
        Text(calculatedScoreString)
    }
}


struct Homepage: View {
    @State private var selectedOptions: [Int] = []
    @State private var isNextButtonEnabled: Bool = false
    @EnvironmentObject var sharedData: SharedData

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
            ZStack{
                ZStack {
                Rectangle()
                    .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : Color(red: 0.69, green: 0.69, blue: 0.69))
                    .frame(width: 59.19822, height: 60.29846)
                    .cornerRadius(16)
                    .shadow(color: isSelected ? Color.black.opacity(0.25) : Color.clear, radius: 2, x: isSelected ? 4 : 0, y: isSelected ? 4 : 0)
                
                Image(imageName)
                    .frame(width: 33.1804, height: 32.23721)
            }.padding(.bottom,90)
                
                Text(labelText)
                    .font(
                        Font.custom("SF Pro Text", size: 12)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.xLarge)
                    .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                    .frame(width: 37.60357, height: 12.17822, alignment: .top)
            }
        }
    }
}
struct CustomView: View {
    var title: String
    var date: String
    var content: String
    var websiteURL: URL?
    var type: String
    var pic: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.85, green: 0.84, blue: 1))
                .frame(width: 325, height: 161)
                .cornerRadius(16)
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                    .overlay(
                        Circle()
                            .stroke(Color(red: 0.42, green: 0.39, blue: 1).opacity(0.47), lineWidth: 5)
                            .overlay(
                            Image(pic)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                            )
                    )
            }
            .frame(width: 35, height: 35)
            .padding(.leading, 15.0)
            .padding(.trailing, 275.0)
            .padding(.top, 20.0)
            .padding(.bottom, 115.0)
            ZStack{
                Text(title)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                    .frame(width: 262, alignment: .topLeading)
            }
            .padding(.top, 20.0)
            .padding(.leading, 77.0)
            .padding(.trailing, 20.0)
            .padding(.bottom, 133.0)
            ZStack{
                Text("Article")
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
            }
                                .padding(.top, 40.0)
                                .padding(.leading, 68.0)
                                .padding(.trailing, 233.0)
                                .padding(.bottom, 112.0)
            ZStack{
                Text(content)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                    .frame(width: 301, alignment: .topLeading)
                                
            }
            .padding(.top, 61.0)
                .padding(.leading, 19.0)
                .padding(.trailing, 5.0)
                .padding(.bottom, 44.0)
            HStack{
                Button(action: {
                                if let url = websiteURL {
                                    UIApplication.shared.open(url)
                                }
                    
                            }) {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 82, height: 28)
                                        .background(Color(red: 0.42, green: 0.39, blue: 1))
                                        .cornerRadius(9)

                                    Text("Check it!")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                                }
                            }
                            .padding(.top, 127.0)
                            .padding(.bottom, 22.0)
                
                ZStack{
                    Image(systemName: "calendar")
                        .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                        .font(.system(size: 17))
                    
                }
                .padding(.top, 127.0)
                .padding(.bottom, 22.0)
                ZStack{
                    Text(date)
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                }
                .padding(.top, 127.0)
                .padding(.bottom, 22.0)
                
            }
            .padding(.trailing, 75.0)
        }
    }
}

var body: some View {
    NavigationView{
        VStack{
            ZStack{
                Text("My Journey")
                    .font(
                        Font.custom("SF Pro Text", size: 16)
                            .weight(.light)
                    )
                    .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxLarge/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
            }.padding(.top,-5)
                .padding(.bottom,-10)
            ZStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 43, height: 43)
                        .background(
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 43, height: 43)
                                .clipped()
                        )
                        .cornerRadius(43)
                        .overlay(
                            RoundedRectangle(cornerRadius: 43)
                                .inset(by: -1)
                                .stroke(Color(red: 0.39, green: 0.4, blue: 1), lineWidth: 2)
                        )
                    
                }
                .padding(.trailing,320)
                .padding(.leading,27)
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 186, height: 14)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(50)
                        .shadow(color: .black.opacity(0.25), radius: 3.5, x: 0, y: 4)
                        .padding(.horizontal, 102.0)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 50, height: 14)
                        .background(Color(red: 0.42, green: 0.39, blue: 1))
                        .cornerRadius(50)
                        .padding(.trailing,238)
                        .padding(.leading,102)
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 30)
                        .background(
                            Image(systemName: "bell")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                                .cornerRadius(16)
                            
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                                .clipped()
                        )
                }
                .padding(.leading,323)
                .padding(.trailing,37)
            }.padding(.bottom,10)
            ZStack{
                Text("Good Afternoon,")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .dynamicTypeSize(.xLarge)
                    .lineLimit(1)
                    .frame(width:300)
                    .padding(.leading, 0.0)
            }
            .padding(.trailing,153)
            .padding(.leading,30)
            ZStack{
                Text("Aryan")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .frame(width:300)
                    .padding(.leading, -30.0)
            }
            .padding(.trailing,275)
            .padding(.leading,30)
            .padding(.bottom,15)
            ZStack{
                Text("How are you feeling today?")
                    .font(.system(size: 21))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .frame(width:300)
                
            }
            .padding(.trailing, 280.0)
            .padding(.leading,180)
            .padding(.bottom,10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    HStack{
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "Happy",
                            labelText: "Happy"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "Calm",
                            labelText: "Clam"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "Relax",
                            labelText: "Manic"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 4,
                            selectedOptions: $selectedOptions,
                            imageName: "Angry",
                            labelText: "Angry"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 5,
                            selectedOptions: $selectedOptions,
                            imageName: "Sad",
                            labelText: "Sad"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 6,
                            selectedOptions: $selectedOptions,
                            imageName: "Overwhlemed",
                            labelText: "Stress"
                        ).padding(.trailing, 10)
                        RectangleButton(
                            option: 7,
                            selectedOptions: $selectedOptions,
                            imageName: "peace",
                            labelText: "Peace"
                        ).padding(.trailing, 10)
                        
                    }
                }
                .padding(.leading,35)
            }
            .padding(.bottom, -55.0)
            ZStack{
                Text("AI Analysis")
                    .font(.system(size: 18))
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .padding(.leading, 30.0)
            .padding(.trailing, 280.0)
            .frame(width:500)
            HStack{
                NavigationLink(destination: Voice_Rec()) {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 155, height: 62)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 4, y: 4)
                        
                        ZStack{
                            ZStack{
                                Image(systemName: "waveform")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24))
                            }.padding(.trailing, 100.0)
                            ZStack{
                                Text("Voical Rec")
                                    .font(.system(size: 16))
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width: 100, alignment: .topLeading)
                            }
                            .padding(.leading,45)
                        }
                        
                        
                    }.padding(.leading, 30.0)
                }
                NavigationLink(destination: Face_Rec()) {
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 155, height: 62)
                        .background(Color(red: 0.42, green: 0.39, blue: 1))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 4, y: 4)
                    
                    
                    ZStack{
                        ZStack{
                            Image(systemName: "person.and.background.dotted")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }.padding(.trailing, 100.0)
                        ZStack{
                            Text("Facial Rec")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 100, alignment: .topLeading)
                        }
                        .padding(.leading,45)
                    }
                    
                }.padding(.horizontal, 30.0)
                }
            }
            .padding(.bottom,14)
            ZStack{
                Text("Resources")
                    .font(.system(size: 18))
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .padding(.leading, 30.0)
            .padding(.trailing, 280.0)
            .frame(width:500)
            NavigationLink(destination: Mental_Resources()) {
                ZStack{
                    ZStack{
                        Rectangle()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.clear)
                            .frame(width: 348, height: 62)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 4, y: 4)
                        
                    }
                    .padding(.trailing, 25.0)
                    ZStack{
                        ZStack{
                            Image(systemName: "books.vertical.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }
                        .padding(.trailing, 280.0)
                        ZStack{
                            Text("Mental Health Resources")
                                .font(.system(size: 16))
                                .bold()
                                .frame(width:300)
                                .lineLimit(1)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.leading,10)
                    }
                    
                    
                }
                .padding(.leading, 30.0)
                .padding(.bottom,14)
            }
            HStack{
                ZStack{
                    Text("Recommendations")
                        .font(.system(size: 18))
                        .lineLimit(1)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                ZStack{
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                        .font(.system(size: 24))
                }
                
                
            }
            .padding(.trailing, 145.0)
            .padding(.bottom,-5.0)
            ScrollView{
                VStack{
                    CustomView(
                        title: "How to improve your mental wellbeing",
                        date: "23st October ‘23",
                        content: "Explains what mental wellbeing means, and gives tips to help you take care of your mental wellbeing.",
                        websiteURL: URL(string: "https://www.mind.org.uk/information-support/tips-for-everyday-living/wellbeing/"),
                        type: "Article",
                        pic: "Article_01_Img"
                    ).padding(.bottom,-10)
                    CustomView(
                        title: "8 Daily Habits to Boost Mental Health",
                        date: "23st October ‘23",
                        content: "It is crucial for managing stress, relationships, decision-making, and overall quality of life. ",
                        websiteURL: URL(string: "https://www.healthline.com/health/mental-health/habits-to-improve-mental-health"),
                        type: "Article",
                        pic: "Article_02_Img"
                    ).padding(.bottom,12)
                    CustomView(
                        title: "10 Tips for Students",
                        date: "23st October ‘23",
                        content: "The impact of the Covid-19 pandemic on students' mental health, highlighting various issues they faced. ",
                        websiteURL: URL(string: "https://leverageedu.com/blog/mental-health-for-students/"),
                        type: "Article",
                        pic: "Article_03_Img"
                    ).padding(.bottom,12)
                    
                }.padding(.bottom)
            }
            
            
            
        }
        
    }
    .navigationBarBackButtonHidden(true)
    }
    
}
struct Voice_Rec: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Homepage()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 34.0)
                        .padding(.leading, 16.0)
                    ZStack{Text("Vocal Rec")
                            .font(
                                Font.custom("Epilogue", size: 40)
                                    .weight(.bold)
                            )
                        .foregroundColor(.black)}
                    .padding(.trailing,95)
                }
                ZStack{
                    Rectangle()
                        .frame(width: 355, height: 490)
                        .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                        .cornerRadius(35)
                    ZStack{
                        Image(systemName: "person.wave.2")
                            .foregroundColor(.white)
                            .font(.system(size: 250))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding([.bottom, .trailing])
                    }.padding(.bottom,100)
                    ZStack{
                        ZStack{
                            Image(systemName: "waveform")
                                .foregroundColor(.white)
                                .font(.system(size: 70))
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding(.trailing,80)
                        ZStack{
                            Image(systemName: "waveform")
                                .foregroundColor(.white)
                                .font(.system(size: 70))
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.leading,35)
                        ZStack{
                            Image(systemName: "waveform")
                                .foregroundColor(.white)
                                .font(.system(size: 70))
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding(.trailing,195)
                        ZStack{
                            Image(systemName: "waveform")
                                .foregroundColor(.white)
                                .font(.system(size: 70))
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.leading,150)
                    }.padding(.top,340)
                    
                }
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 76)
                            .background(Color(red: 0.85, green: 0.84, blue: 1))
                            .cornerRadius(10)
                        ZStack{
                            Text("Start\nRecording")
                                .font(.system(size: 20))
                                .bold()
                                .kerning(0.1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                                .frame(width: 155, height: 66, alignment: .center)
                        }
                    }.padding(.trailing,14)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 76)
                            .background(Color(red: 0.85, green: 0.84, blue: 1))
                            .cornerRadius(10)
                        ZStack{
                            Text("Stop\nRecording")
                                .font(.system(size: 20))
                                .bold()
                                .kerning(0.1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                                .frame(width: 155, height: 66, alignment: .center)
                        }
                    }
                }
                .padding(.bottom, 15.0)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 331, height: 77)
                        .background(Color(red: 0.42, green: 0.39, blue: 1).opacity(0.47))
                        .cornerRadius(10)
                    HStack{
                        ZStack{
                            Text("Results")
                                .font(.system(size: 35))
                                .kerning(0.175)
                                .bold()
                                .foregroundColor(.black)
                                .frame(width:230, height: 66, alignment: .leading)
                        }
                        ZStack{
                            Image(systemName: "arrowshape.forward")
                                .foregroundColor(.black)
                                .font(.system(size: 50))
                        }
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}
struct Face_Rec: View {
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Homepage()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 34.0)
                        .padding(.leading, 16.0)
                    ZStack{Text("Face Rec")
                            .font(
                                Font.custom("Epilogue", size: 40)
                                    .weight(.bold)
                            )
                        .foregroundColor(.black)}
                    .padding(.trailing,95)
                }.padding(.top)
                ZStack{
                    Rectangle()
                        .frame(width: 355, height: 490)
                        .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                        .cornerRadius(35)
                    ZStack{
                        Image(systemName: "person.and.background.dotted")
                            .foregroundColor(.white)
                            .font(.system(size: 250))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal)
                    }
                    
                }.padding(.bottom)
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 76)
                            .background(Color(red: 0.85, green: 0.84, blue: 1))
                            .cornerRadius(10)
                        ZStack{
                            Text("Start\nRecording")
                                .font(.system(size: 20))
                                .bold()
                                .kerning(0.1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                                .frame(width: 155, height: 66, alignment: .center)
                        }
                    }.padding(.trailing,14)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 76)
                            .background(Color(red: 0.85, green: 0.84, blue: 1))
                            .cornerRadius(10)
                        ZStack{
                            Text("Stop\nRecording")
                                .font(.system(size: 20))
                                .bold()
                                .kerning(0.1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                                .frame(width: 155, height: 66, alignment: .center)
                        }
                    }
                }
                .padding(.bottom, 15.0)
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 331, height: 77)
                        .background(Color(red: 0.42, green: 0.39, blue: 1).opacity(0.47))
                        .cornerRadius(10)
                    HStack{
                        ZStack{
                            Text("Results")
                                .font(.system(size: 35))
                                .kerning(0.175)
                                .bold()
                                .foregroundColor(.black)
                                .frame(width:230, height: 66, alignment: .leading)
                        }
                        ZStack{
                            Image(systemName: "arrowshape.forward")
                                .foregroundColor(.black)
                                .font(.system(size: 50))
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}
struct Mental_Resources: View {
struct CustomView: View {
    var title: String
    var date: String
    var content: String
    var websiteURL: URL?
    var type: String
    var pic: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.85, green: 0.84, blue: 1))
                .frame(width: 325, height: 161)
                .cornerRadius(16)
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                    .overlay(
                        Circle()
                            .stroke(Color(red: 0.42, green: 0.39, blue: 1).opacity(0.47), lineWidth: 5)
                            .overlay(
                            Image(pic)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                            )
                    )
            }
            .frame(width: 35, height: 35)
            .padding(.leading, 15.0)
            .padding(.trailing, 275.0)
            .padding(.top, 20.0)
            .padding(.bottom, 115.0)
            ZStack{
                Text(title)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                    .frame(width: 262, alignment: .topLeading)
            }
            .padding(.top, 20.0)
            .padding(.leading, 77.0)
            .padding(.trailing, 20.0)
            .padding(.bottom, 133.0)
            ZStack{
                Text("Article")
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
            }
                                .padding(.top, 40.0)
                                .padding(.leading, 68.0)
                                .padding(.trailing, 233.0)
                                .padding(.bottom, 112.0)
            ZStack{
                Text(content)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                    .frame(width: 301, alignment: .topLeading)
                                
            }
            .padding(.top, 61.0)
                .padding(.leading, 19.0)
                .padding(.trailing, 5.0)
                .padding(.bottom, 44.0)
            HStack{
                Button(action: {
                                if let url = websiteURL {
                                    UIApplication.shared.open(url)
                                }
                    
                            }) {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 82, height: 28)
                                        .background(Color(red: 0.42, green: 0.39, blue: 1))
                                        .cornerRadius(9)

                                    Text("Check it!")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                                }
                            }
                            .padding(.top, 127.0)
                            .padding(.bottom, 22.0)
                
                ZStack{
                    Image(systemName: "calendar")
                        .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                        .font(.system(size: 17))
                    
                }
                .padding(.top, 127.0)
                .padding(.bottom, 22.0)
                ZStack{
                    Text(date)
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                }
                .padding(.top, 127.0)
                .padding(.bottom, 22.0)
                
            }
            .padding(.trailing, 75.0)
        }
    }
}
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Homepage()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 34.0)
                        .padding(.leading, 16.0)
                    ZStack{Text("Mental Health\nResources")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 260, alignment: .leading)
                            .foregroundColor(.black)}
                    .padding(.trailing,45)
                }
                .padding(.top)
                .padding(.bottom,22)
                NavigationLink(destination: Time_Mangagement()){
                    ZStack{
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 326, height: 86)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(8)
                        ZStack{
                            Text("Time Management")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .kerning(0.15)
                                .foregroundColor(.white)
                                .frame(width: 314, height: 86, alignment: .center)
                        }
                        
                    }
                    .padding(.bottom,23)
                }
                NavigationLink(destination: Stress_Mangagement()){
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 326, height: 86)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(8)
                        ZStack{
                            Text("Stress Management")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .kerning(0.15)
                                .foregroundColor(.white)
                                .frame(width: 314, height: 86, alignment: .center)
                        }
                        
                    }
                    .padding(.bottom,23)
                }
                NavigationLink(destination: Communication()){
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 326, height: 86)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(8)
                        ZStack{
                            Text("Communication")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .kerning(0.15)
                                .foregroundColor(.white)
                                .frame(width: 314, height: 86, alignment: .center)
                        }
                        
                    }
                    .padding(.bottom,13)
                }
                HStack{
                    ZStack{
                        Text("Recommendations")
                            .font(.system(size: 18))
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                    ZStack{
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                            .font(.system(size: 24))
                    }
                    
                    
                }
                .padding(.trailing, 125.0)
                .padding(.bottom,-5.0)
                ScrollView{
                    VStack{
                        CustomView(
                            title: "How to improve your mental wellbeing",
                            date: "23st October ‘23",
                            content: "Explains what mental wellbeing means, and gives tips to help you take care of your mental wellbeing.",
                            websiteURL: URL(string: "https://www.mind.org.uk/information-support/tips-for-everyday-living/wellbeing/"),
                            type: "Article",
                            pic: "Article_01_Img"
                        ).padding(.bottom,-10)
                        CustomView(
                            title: "8 Daily Habits to Boost Mental Health",
                            date: "23st October ‘23",
                            content: "It is crucial for managing stress, relationships, decision-making, and overall quality of life. ",
                            websiteURL: URL(string: "https://www.healthline.com/health/mental-health/habits-to-improve-mental-health"),
                            type: "Article",
                            pic: "Article_02_Img"
                        ).padding(.bottom,12)
                        CustomView(
                            title: "10 Tips for Students",
                            date: "23st October ‘23",
                            content: "The impact of the Covid-19 pandemic on students' mental health, highlighting various issues they faced. ",
                            websiteURL: URL(string: "https://leverageedu.com/blog/mental-health-for-students/"),
                            type: "Article",
                            pic: "Article_03_Img"
                        ).padding(.bottom,12)
                        
                    }.padding(.bottom)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Time_Mangagement: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Mental_Resources()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 34.0)
                        .padding(.leading, 16.0)
                    ZStack{Text("Time\nManagement")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 260,height:100,alignment: .leading)
                        .foregroundColor(.black)}
                    .padding(.trailing,25)
                }
                ZStack{
                    Text("Create a personalized schedule/planner\n\n\u{2022} Realistic\n\u{2022} Highlight prioritized needs\n\u{2022} Incorporate decorations/themes you like\n\u{2022} Incorporate relaxation time\n\nRatio of classroom time to study time should be 1:2 or 1:3\n\n\u{2022} Every hour in class = two to three hours out of class working independently on course assignments. If your\ncomposition class meets for one hour, three times a week, you’d be expected to devote from six to nine hours each\nweek on reading assignments, writing assignments, etc.")
                      .font(Font.custom("Nunito", size: 24))
                      .foregroundColor(.black)
                      .frame(width: 325, height: 668, alignment: .topLeading)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Stress_Mangagement: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        ZStack{
                            NavigationLink(destination: Mental_Resources()) {
                                ZStack {
                                    Image("Back_Button")
                                        .renderingMode(.original)
                                }
                            }
                        }.padding(.trailing, 34.0)
                            .padding(.leading, 16.0)
                        ZStack{Text("Stress")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .frame(width: 270, alignment: .leading)
                            .foregroundColor(.black)}
                        .padding(.trailing,35)
                    }
                    ScrollView{
                        ZStack{
                            Text("\nAvoid Stress\n\u{2022}Take notice of how your body reacts when you feel stressed → the more you are aware of these signs, the more alert you will feel\n\u{2022}Physical movement\n\t\u{2022}AI or the app itself can incorporate stretching exercise guides\n\u{2022}Meditation\n\t\u{2022}AI or the app itself can incorporate guided meditation\n\u{2022}Journaling is a good way to get your thoughts out (positive affirmations)\n\u{2022}Taking walks, avoiding screen usage, being with nature\n\u{2022}If social media use is a factor, cut down on that\n\u{2022}Healthy diet\n\u{2022}Sleep. Stress can lead to sleeping difficulties and sleeping poorly can lead to more stress, which can lead to worse sleeping issues… and so on in a downward spiral. \n\u{2022}Being in the nature can reduce stress hormones\n\u{2022}Reading can reduce stress and relax your body by lowering the heart pace and easing muscle tension \n\nWhat stress is and what causes it \nStress is an emotional or physical reaction of the body towards a challenge or demand. The main causes of student stress are academic pressure, obligatory success, the uncertainty of the future, complications of into the system \nMental health issues have a negative impact on students academic performance, their social relationships, and overall health.\nSymptoms of stress/what stress can lead to\nheadache, tiredness, sleep difficulties (have deeply effects on the cognition), musculoskeletal pain, increased risk of infection, depression, gastrointestinal issues, insomnia\nloss of sleep have deeply effects on the cognition, it amplifies anxiety, reduce attention, can lead to more stress\nbehaviors like an inadequate diet and lack of exercise\nprolonged stress increases the risks of cancer, diabetes and autoimmune diseases, weight gain,\nstress hinders students true abilities\n  ")
                                .font(Font.custom("Nunito", size: 17))
                                .foregroundColor(.black)
                                .frame(width: 325, height: 853, alignment: .topLeading)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Communication: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Mental_Resources()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 8.0)
                        .padding(.leading, 26.0)
                    ZStack{Text("Communication")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 300, alignment: .leading)
                        .foregroundColor(.black)}
                    .padding(.trailing,25)
                }
                ZStack{
                    Text("\n\u{2022}School psychologist \n\u{2022}Bring awareness to teachers and parents \n\u{2022}Therapy groups \n\u{2022}Students who feel stressjoin together and talkabout solutions\n")
                      .font(Font.custom("Nunito", size: 25))
                      .foregroundColor(.black)
                      .frame(width: 325, height: 518, alignment: .topLeading)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        }
}
struct Results: View{
 @EnvironmentObject var sharedData: SharedData
 var calculatedScore: Int {
         let rawScore = sharedData.score * 4
         return min(rawScore, 100)
            }
 var calculatedScoreString: String {
        return String(calculatedScore)
    }
    var balanceDescription: String {
            if sharedData.balance < 3 {
                return "Average"
            } else if sharedData.balance >= 3 && sharedData.balance <= 6 {
                return "Moderate"
            } else {
                return "Strong Stress Factor"
            }
        }
    var workoutDescription: String {
            if sharedData.workout < 3 {
                return "Average"
            } else if sharedData.workout >= 3 && sharedData.workout <= 5 {
                return "Severe"
            } else {
                return "Strong Stress Factor"
            }
        }
    var relationshipDescription: String {
        if sharedData.relationship <= 2 {
            return "Average"
        } else if sharedData.relationship >= 4 {
            return "Strong Stress Factor"
        } else {
            return "Moderate"
        }
    }
    func calculateBalanceStressLevel() -> String {
            if sharedData.balance < 3 {
                return "Average"
            } else if sharedData.balance >= 3 && sharedData.balance <= 6 {
                return "Moderate"
            } else {
                return "Strong Stress Factor"
            }
        }
    func calculateWorkoutStressLevel() -> String {
           if sharedData.workout < 3 {
               return "Average"
           } else if sharedData.workout >= 3 && sharedData.workout <= 5 {
               return "Moderate"
           } else {
               return "Strong Stress Factor"
           }
       }

       func calculateRelationshipStressLevel() -> String {
           if sharedData.relationship <= 2 {
               return "Average"
           } else if sharedData.relationship >= 2 && sharedData.relationship <= 4 {
               return "Moderate"
           } else {
               return "Strong Stress Factor"
           }
       }
    var body: some View{
        
        NavigationView{
            VStack{
                HStack{
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
                .padding(.top,50)
                ZStack{
                    Text("Results")
                        .font(.system(size: 40))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 341, alignment: .top)
                }
                ZStack{
                    Image("Results_drawing")
                    ZStack{
                        ZStack{
                            Circle()
                                .stroke(Color(red: 0.42, green: 0.39, blue: 1), lineWidth: 9)
                                .frame(width: 237, height: 237)
                            
                        }
                        ZStack{
                            Text(calculatedScoreString + "%")
                                .font(
                                    Font.custom("Abhaya Libre", size: 64)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(width: 177, alignment: .top)
                        }
                        .padding(.bottom,50)
                        ZStack{
                            Text("Stress Level")
                                .font(.system(size:32))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            .frame(width: 204, alignment: .top)}
                        .padding(.top, 60)
                    }.padding(.bottom,80)
                }
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 357, height: 394)
                      .background(.black)
                      .cornerRadius(30)
                      .shadow(color: .black.opacity(0.46), radius: 4, x: 5, y: 10)
                    ZStack{
                        ZStack{
                            Text("Work-Life Balance Score ⚖️")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text(balanceDescription)
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(calculateBalanceStressLevel() == "Average" ? Color(red: 0.39, green: 0.85, blue: 1) :
                                                    calculateBalanceStressLevel() == "Moderate" ? Color(red: 1, green: 0.94, blue: 0.39) :
                                                    Color(red: 1, green: 0.39, blue: 0.39))
                        }
                        .padding(.top, 53)
                        .padding(.leading, -150)
                        ZStack{
                            Text("- This metric evaluates how well an individual is\nmanaging their work and personal life. ")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341,height: 100, alignment: .topLeading)
                        }
                        .padding(.top, 183)
                        .padding(.leading, 33)
                    }
                    .padding(.bottom, 290)
                    ZStack{
                        ZStack{
                            Text("Physical Health Metrics 🏋️‍♂️")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text(workoutDescription)
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(calculateWorkoutStressLevel() == "Average" ? Color(red: 0.39, green: 0.85, blue: 1) :
                                                    calculateWorkoutStressLevel() == "Moderate" ? Color(red: 1, green: 0.94, blue: 0.39) :
                                                    Color(red: 1, green: 0.39, blue: 0.39))
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 53)
                        .padding(.leading, 35)
                        ZStack{
                            Text("- This metric takes into account an individual's overall physical health,and including exercise.")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 123)
                        .padding(.leading, 33)
                    }
                    .padding(.top, 190)
                    ZStack{
                        ZStack{
                            Text("Social Support Metrics 🤝")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text(relationshipDescription)
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(calculateRelationshipStressLevel() == "Average" ? Color(red: 0.39, green: 0.85, blue: 1) :
                                                    calculateRelationshipStressLevel() == "Moderate" ? Color(red: 1, green: 0.94, blue: 0.39) :
                                                    Color(red: 1, green: 0.39, blue: 0.39))
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 53)
                        .padding(.leading, 33)
                        ZStack{
                            Text("- This metric is an individual's social support system, including the quality of relationships.")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 133)
                        .padding(.leading, 33)
                    }
                    .padding(.bottom, 50)
                }.padding(.top,-144)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SharedData()) // Set up the environment object
    }
}

//Version 1.0
/*
import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack {
                    Image("Hiking_1")
                }
                .padding(.bottom, 10.0)
                ZStack{
                    Text("Eudaimonia")
                        .fontWeight(.bold)
                        .dynamicTypeSize(/*@START_MENU_TOKEN@*/.accessibility3/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .shadow(color: .black.opacity(0.21), radius: 2, x: 7, y: 6)
                }.padding(.bottom,5)
                ZStack{
                    Text("Answer a Quick Survey")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 10.0)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 191, height: 41)
                        .background(.black)
                        .cornerRadius(6)
                        .shadow(color: .black.opacity(0.26), radius: 4.5, x: 4, y: 7)
                    NavigationLink(destination: Survey_Questions()) {
                        Text("Start Here")
                            .fontWeight(.heavy)
                            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
                            .kerning(1.092)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        .frame(width: 323, alignment: .top)}
                }
                .padding(.vertical, 30.0)
                
            }
        }
    }
}
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
                    .frame(width: 365, height: 62)
                    .cornerRadius(10)
                    .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                ZStack {
                    Image(imageName)
                }.padding(.trailing, 295)

                ZStack {
                    Text(labelText)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.regular)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 282, height: 45, alignment: .topLeading)
                }.padding(.leading, 53)
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
                    Image("Q1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("How much time are you spending on HW?")
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            
                    }.padding(.bottom,30)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Minimal Effort: I don't prioritize homework and invest minimal time."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Balanced Approach: I consider homework relatively important"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "Excessively Work: Homework is crucial to me, but I overexert myself"
                        ).padding(.bottom, 19)
                        
                       
                         
                        
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
                    .frame(width: 345, height: 62)
                    .cornerRadius(10)
                    .shadow(color: isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : .clear, radius: 12.5, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                ZStack {
                    Image(imageName)
                }.padding(.trailing, 275)

                ZStack {
                    Text(labelText)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.regular)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 272, height: 45, alignment: .topLeading)
                }.padding(.leading, 63)
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
                    Image("Q2")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, -20.0)
                VStack{
                    ZStack{
                        Text("How much time are you spending on extracurriculars?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,20)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "No Extracurriculars: I don't do extracurriculars."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Balanced Life: I balance homework, extracurriculars & etc."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "No Extracurriculars: I don't do extracurriculars, and it bothers me."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 4,
                            selectedOptions: $selectedOptions,
                            imageName: "D_Button",
                            labelText: "Stressful Commitment: Extracurriculars stress me out."
                        ).padding(.bottom, 19)
                        /*
                         Text("Score: \(sharedData.score)")
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
                    Image("Q3")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("How much leisure time do you have?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "I have the right amount of time in which I feel happy and relaxed."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "I have the right amount of time in which I feel happy and relaxed"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "I get either very limited or no leisure time."
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
                        .padding(.top,12.5)
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
                    NavigationLink(destination: Survey_Questions_Fivth()) {
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
                    Image("Q4")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("How much sleep are you getting per night?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Less than 8 hrs"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "Between 8 - 10 hrs"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "More than 10 hrs"
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
struct Survey_Questions_Fivth: View {
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
                        .padding(.top,12.5)
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
                    NavigationLink(destination: Survey_Questions_Sixth()) {
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
                    Image("Q5")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Do you feel as if you have friends that support you and accept you as you are?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Yes"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "No"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "I'm not sure"
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
struct Survey_Questions_Sixth: View {
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
                        .padding(.top,12.5)
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
                    NavigationLink(destination: Survey_Questions_Seventh()) {
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
                    Image("Q6")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Do you feel as if you have a trusted adult to talk to when you are feeling down?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "Yes"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "No"
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "I'm not sure"
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
struct Survey_Questions_Seventh: View {
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
                        .padding(.top,12.5)
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
                    NavigationLink(destination: Results()) {
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
                        .resizable()
                        .frame(width:390,height:322)
                }.padding(.bottom, 14.0)
                VStack{
                    ZStack{
                        Text("Finally, how content do you feel on a daily basis?")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.padding(.bottom,30)
                        .padding(.horizontal,10)
                    
                    VStack {
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "A_Button",
                            labelText: "I feel content with my life."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "B_Button",
                            labelText: "I never really know how I feel."
                        ).padding(.bottom, 19)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "C_Button",
                            labelText: "I feel stressed and unhappy."
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
struct Results: View{
    var body: some View{
        NavigationView{
            VStack{
                HStack{
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
                .padding(.top,50)
                ZStack{
                    Text("Your Score")
                        .font(.system(size: 40))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 341, alignment: .top)
                }
                ZStack{
                    Image("Results_drawing")
                    ZStack{
                        ZStack{
                            Circle()
                                .stroke(Color(red: 0.42, green: 0.39, blue: 1), lineWidth: 9)
                                .frame(width: 237, height: 237)
                            
                        }
                        ZStack{
                            Text("78% ")
                                .font(
                                    Font.custom("Abhaya Libre", size: 64)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(width: 157, alignment: .top)
                        }
                        .padding(.bottom,50)
                        ZStack{
                            Text("Stress Level")
                                .font(.system(size:32))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            .frame(width: 204, alignment: .top)}
                        .padding(.top, 60)
                    }.padding(.bottom,80)
                }
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 357, height: 394)
                      .background(.black)
                      .cornerRadius(30)
                      .shadow(color: .black.opacity(0.46), radius: 4, x: 5, y: 10)
                    ZStack{
                        ZStack{
                            Text("Work-Life Balance Score ⚖️")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text("Moderate")
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(Color(red: 1, green: 0.94, blue: 0.39))
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 53)
                        .padding(.leading, 33)
                        ZStack{
                            Text("- This metric evaluates how well an individual is\nmanaging their work and personal life. ")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341,height: 100, alignment: .topLeading)
                        }
                        .padding(.top, 183)
                        .padding(.leading, 33)
                    }
                    .padding(.bottom, 290)
                    ZStack{
                        ZStack{
                            Text("Physical Health Metrics 🏋️‍♂️")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text("Strong Stress Factor")
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(Color(red: 1, green: 0.39, blue: 0.39))
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 53)
                        .padding(.leading, 33)
                        ZStack{
                            Text("- This metric takes into account an individual's overall physical health,and including exercise.")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 123)
                        .padding(.leading, 33)
                    }
                    .padding(.top, 190)
                    ZStack{
                        ZStack{
                            Text("Social Support Metrics 🤝")
                                .font(.system(size:20))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.leading, 33)
                        ZStack{
                            Text("Average")
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(Color(red: 0.39, green: 0.85, blue: 1))
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 53)
                        .padding(.leading, 33)
                        ZStack{
                            Text("- This metric is an individual's social support system, including the quality of relationships.")
                                .font(.system(size:14))
                                .foregroundColor(.white)
                                .frame(width: 341, alignment: .topLeading)
                        }
                        .padding(.top, 133)
                        .padding(.leading, 33)
                    }
                    .padding(.bottom, 50)
                }.padding(.top,-144)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Homepage: View {
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
            ZStack{
                ZStack {
                Rectangle()
                    .foregroundColor(isSelected ? Color(red: 0.42, green: 0.39, blue: 1) : Color(red: 0.69, green: 0.69, blue: 0.69))
                    .frame(width: 59.19822, height: 60.29846)
                    .cornerRadius(16)
                    .shadow(color: isSelected ? Color.black.opacity(0.25) : Color.clear, radius: 2, x: isSelected ? 4 : 0, y: isSelected ? 4 : 0)
                
                Image(imageName)
                    .frame(width: 33.1804, height: 32.23721)
            }.padding(.bottom,90)
                
                Text(labelText)
                    .font(
                        Font.custom("SF Pro Text", size: 12)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.xLarge)
                    .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                    .frame(width: 37.60357, height: 12.17822, alignment: .top)
            }
        }
    }
}
struct CustomView: View {
    var title: String
    var date: String
    var content: String
    var websiteURL: URL?
    var type: String
    var pic: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.85, green: 0.84, blue: 1))
                .frame(width: 325, height: 161)
                .cornerRadius(16)
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                    .overlay(
                        Circle()
                            .stroke(Color(red: 0.42, green: 0.39, blue: 1).opacity(0.47), lineWidth: 5)
                            .overlay(
                            Image(pic)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                            )
                    )
            }
            .frame(width: 35, height: 35)
            .padding(.leading, 15.0)
            .padding(.trailing, 275.0)
            .padding(.top, 20.0)
            .padding(.bottom, 115.0)
            ZStack{
                Text(title)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                    .frame(width: 262, alignment: .topLeading)
            }
            .padding(.top, 20.0)
            .padding(.leading, 77.0)
            .padding(.trailing, 20.0)
            .padding(.bottom, 133.0)
            ZStack{
                Text("Article")
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
            }
                                .padding(.top, 40.0)
                                .padding(.leading, 68.0)
                                .padding(.trailing, 233.0)
                                .padding(.bottom, 112.0)
            ZStack{
                Text(content)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                    .frame(width: 301, alignment: .topLeading)
                                
            }
            .padding(.top, 61.0)
                .padding(.leading, 19.0)
                .padding(.trailing, 5.0)
                .padding(.bottom, 44.0)
            HStack{
                Button(action: {
                                if let url = websiteURL {
                                    UIApplication.shared.open(url)
                                }
                    
                            }) {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 82, height: 28)
                                        .background(Color(red: 0.42, green: 0.39, blue: 1))
                                        .cornerRadius(9)

                                    Text("Check it!")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                                }
                            }
                            .padding(.top, 127.0)
                            .padding(.bottom, 22.0)
                
                ZStack{
                    Image(systemName: "calendar")
                        .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                        .font(.system(size: 17))
                    
                }
                .padding(.top, 127.0)
                .padding(.bottom, 22.0)
                ZStack{
                    Text(date)
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                }
                .padding(.top, 127.0)
                .padding(.bottom, 22.0)
                
            }
            .padding(.trailing, 75.0)
        }
    }
}

var body: some View {
    NavigationView{
        VStack{
            ZStack{
                Text("My Journey")
                    .font(
                        Font.custom("SF Pro Text", size: 16)
                            .weight(.light)
                    )
                    .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxLarge/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
            }.padding(.top,-5)
                .padding(.bottom,-10)
            ZStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 43, height: 43)
                        .background(
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 43, height: 43)
                                .clipped()
                        )
                        .cornerRadius(43)
                        .overlay(
                            RoundedRectangle(cornerRadius: 43)
                                .inset(by: -1)
                                .stroke(Color(red: 0.39, green: 0.4, blue: 1), lineWidth: 2)
                        )
                    
                }
                .padding(.trailing,320)
                .padding(.leading,27)
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 186, height: 14)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(50)
                        .shadow(color: .black.opacity(0.25), radius: 3.5, x: 0, y: 4)
                        .padding(.horizontal, 102.0)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 50, height: 14)
                        .background(Color(red: 0.42, green: 0.39, blue: 1))
                        .cornerRadius(50)
                        .padding(.trailing,238)
                        .padding(.leading,102)
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 30)
                        .background(
                            Image(systemName: "bell")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                                .cornerRadius(16)
                            
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                                .clipped()
                        )
                }
                .padding(.leading,323)
                .padding(.trailing,37)
            }.padding(.bottom,10)
            ZStack{
                Text("Good Afternoon,")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .dynamicTypeSize(.xLarge)
                    .lineLimit(1)
                    .frame(width:300)
                    .padding(.leading, 0.0)
            }
            .padding(.trailing,153)
            .padding(.leading,30)
            ZStack{
                Text("Aryan")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .frame(width:300)
                    .padding(.leading, -30.0)
            }
            .padding(.trailing,275)
            .padding(.leading,30)
            .padding(.bottom,15)
            ZStack{
                Text("How are you feeling today?")
                    .font(.system(size: 21))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .frame(width:300)
                
            }
            .padding(.trailing, 280.0)
            .padding(.leading,180)
            .padding(.bottom,10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    HStack{
                        RectangleButton(
                            option: 1,
                            selectedOptions: $selectedOptions,
                            imageName: "Happy",
                            labelText: "Happy"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 2,
                            selectedOptions: $selectedOptions,
                            imageName: "Calm",
                            labelText: "Clam"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 3,
                            selectedOptions: $selectedOptions,
                            imageName: "Relax",
                            labelText: "Manic"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 4,
                            selectedOptions: $selectedOptions,
                            imageName: "Angry",
                            labelText: "Angry"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 5,
                            selectedOptions: $selectedOptions,
                            imageName: "Sad",
                            labelText: "Sad"
                        ).padding(.trailing, 10)
                        
                        RectangleButton(
                            option: 6,
                            selectedOptions: $selectedOptions,
                            imageName: "Overwhlemed",
                            labelText: "Stress"
                        ).padding(.trailing, 10)
                        RectangleButton(
                            option: 7,
                            selectedOptions: $selectedOptions,
                            imageName: "peace",
                            labelText: "Peace"
                        ).padding(.trailing, 10)
                        
                    }
                }
                .padding(.leading,35)
            }
            .padding(.bottom, -55.0)
            ZStack{
                Text("AI Analysis")
                    .font(.system(size: 18))
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .padding(.leading, 30.0)
            .padding(.trailing, 280.0)
            .frame(width:500)
            HStack{
                NavigationLink(destination: Voice_Rec()) {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 155, height: 62)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 4, y: 4)
                        
                        ZStack{
                            ZStack{
                                Image(systemName: "waveform")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24))
                            }.padding(.trailing, 100.0)
                            ZStack{
                                Text("Voical Rec")
                                    .font(.system(size: 16))
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width: 100, alignment: .topLeading)
                            }
                            .padding(.leading,45)
                        }
                        
                        
                    }.padding(.leading, 30.0)
                }
                NavigationLink(destination: Face_Rec()) {
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 155, height: 62)
                        .background(Color(red: 0.42, green: 0.39, blue: 1))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 4, y: 4)
                    
                    
                    ZStack{
                        ZStack{
                            Image(systemName: "person.and.background.dotted")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }.padding(.trailing, 100.0)
                        ZStack{
                            Text("Facial Rec")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 100, alignment: .topLeading)
                        }
                        .padding(.leading,45)
                    }
                    
                }.padding(.horizontal, 30.0)
                }
            }
            .padding(.bottom,14)
            ZStack{
                Text("Resources")
                    .font(.system(size: 18))
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .padding(.leading, 30.0)
            .padding(.trailing, 280.0)
            .frame(width:500)
            NavigationLink(destination: Mental_Resources()) {
                ZStack{
                    ZStack{
                        Rectangle()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.clear)
                            .frame(width: 348, height: 62)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 4, y: 4)
                        
                    }
                    .padding(.trailing, 25.0)
                    ZStack{
                        ZStack{
                            Image(systemName: "books.vertical.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }
                        .padding(.trailing, 280.0)
                        ZStack{
                            Text("Mental Health Resources")
                                .font(.system(size: 16))
                                .bold()
                                .frame(width:300)
                                .lineLimit(1)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.leading,10)
                    }
                    
                    
                }
                .padding(.leading, 30.0)
                .padding(.bottom,14)
            }
            HStack{
                ZStack{
                    Text("Recommendations")
                        .font(.system(size: 18))
                        .lineLimit(1)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                ZStack{
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                        .font(.system(size: 24))
                }
                
                
            }
            .padding(.trailing, 145.0)
            .padding(.bottom,-5.0)
            ScrollView{
                VStack{
                    CustomView(
                        title: "How to improve your mental wellbeing",
                        date: "23st October ‘23",
                        content: "Explains what mental wellbeing means, and gives tips to help you take care of your mental wellbeing.",
                        websiteURL: URL(string: "https://www.mind.org.uk/information-support/tips-for-everyday-living/wellbeing/"),
                        type: "Article",
                        pic: "Article_01_Img"
                    ).padding(.bottom,-10)
                    CustomView(
                        title: "8 Daily Habits to Boost Mental Health",
                        date: "23st October ‘23",
                        content: "It is crucial for managing stress, relationships, decision-making, and overall quality of life. ",
                        websiteURL: URL(string: "https://www.healthline.com/health/mental-health/habits-to-improve-mental-health"),
                        type: "Article",
                        pic: "Article_02_Img"
                    ).padding(.bottom,12)
                    CustomView(
                        title: "10 Tips for Students",
                        date: "23st October ‘23",
                        content: "The impact of the Covid-19 pandemic on students' mental health, highlighting various issues they faced. ",
                        websiteURL: URL(string: "https://leverageedu.com/blog/mental-health-for-students/"),
                        type: "Article",
                        pic: "Article_03_Img"
                    ).padding(.bottom,12)
                    
                }.padding(.bottom)
            }
            
            
            
        }
        
    }
    .navigationBarBackButtonHidden(true)
    }
    
}
struct Voice_Rec: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Homepage()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 34.0)
                        .padding(.leading, 16.0)
                    ZStack{Text("Vocal Rec")
                            .font(
                                Font.custom("Epilogue", size: 40)
                                    .weight(.bold)
                            )
                        .foregroundColor(.black)}
                    .padding(.trailing,95)
                }
                ZStack{
                    Rectangle()
                        .frame(width: 355, height: 490)
                        .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                        .cornerRadius(35)
                    ZStack{
                        Image(systemName: "person.wave.2")
                            .foregroundColor(.white)
                            .font(.system(size: 250))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding([.bottom, .trailing])
                    }.padding(.bottom,100)
                    ZStack{
                        ZStack{
                            Image(systemName: "waveform")
                                .foregroundColor(.white)
                                .font(.system(size: 70))
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding(.trailing,80)
                        ZStack{
                            Image(systemName: "waveform")
                                .foregroundColor(.white)
                                .font(.system(size: 70))
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.leading,35)
                        ZStack{
                            Image(systemName: "waveform")
                                .foregroundColor(.white)
                                .font(.system(size: 70))
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding(.trailing,195)
                        ZStack{
                            Image(systemName: "waveform")
                                .foregroundColor(.white)
                                .font(.system(size: 70))
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.leading,150)
                    }.padding(.top,340)
                    
                }
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 76)
                            .background(Color(red: 0.85, green: 0.84, blue: 1))
                            .cornerRadius(10)
                        ZStack{
                            Text("Start\nRecording")
                                .font(.system(size: 20))
                                .bold()
                                .kerning(0.1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                                .frame(width: 155, height: 66, alignment: .center)
                        }
                    }.padding(.trailing,14)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 76)
                            .background(Color(red: 0.85, green: 0.84, blue: 1))
                            .cornerRadius(10)
                        ZStack{
                            Text("Stop\nRecording")
                                .font(.system(size: 20))
                                .bold()
                                .kerning(0.1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                                .frame(width: 155, height: 66, alignment: .center)
                        }
                    }
                }
                .padding(.bottom, 15.0)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 331, height: 77)
                        .background(Color(red: 0.42, green: 0.39, blue: 1).opacity(0.47))
                        .cornerRadius(10)
                    HStack{
                        ZStack{
                            Text("Results")
                                .font(.system(size: 35))
                                .kerning(0.175)
                                .bold()
                                .foregroundColor(.black)
                                .frame(width:230, height: 66, alignment: .leading)
                        }
                        ZStack{
                            Image(systemName: "arrowshape.forward")
                                .foregroundColor(.black)
                                .font(.system(size: 50))
                        }
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}
struct Face_Rec: View {
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Homepage()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 34.0)
                        .padding(.leading, 16.0)
                    ZStack{Text("Face Rec")
                            .font(
                                Font.custom("Epilogue", size: 40)
                                    .weight(.bold)
                            )
                        .foregroundColor(.black)}
                    .padding(.trailing,95)
                }.padding(.top)
                ZStack{
                    Rectangle()
                        .frame(width: 355, height: 490)
                        .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                        .cornerRadius(35)
                    ZStack{
                        Image(systemName: "person.and.background.dotted")
                            .foregroundColor(.white)
                            .font(.system(size: 250))
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal)
                    }
                    
                }.padding(.bottom)
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 76)
                            .background(Color(red: 0.85, green: 0.84, blue: 1))
                            .cornerRadius(10)
                        ZStack{
                            Text("Start\nRecording")
                                .font(.system(size: 20))
                                .bold()
                                .kerning(0.1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                                .frame(width: 155, height: 66, alignment: .center)
                        }
                    }.padding(.trailing,14)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 76)
                            .background(Color(red: 0.85, green: 0.84, blue: 1))
                            .cornerRadius(10)
                        ZStack{
                            Text("Stop\nRecording")
                                .font(.system(size: 20))
                                .bold()
                                .kerning(0.1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                                .frame(width: 155, height: 66, alignment: .center)
                        }
                    }
                }
                .padding(.bottom, 15.0)
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 331, height: 77)
                        .background(Color(red: 0.42, green: 0.39, blue: 1).opacity(0.47))
                        .cornerRadius(10)
                    HStack{
                        ZStack{
                            Text("Results")
                                .font(.system(size: 35))
                                .kerning(0.175)
                                .bold()
                                .foregroundColor(.black)
                                .frame(width:230, height: 66, alignment: .leading)
                        }
                        ZStack{
                            Image(systemName: "arrowshape.forward")
                                .foregroundColor(.black)
                                .font(.system(size: 50))
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}
struct Mental_Resources: View {
struct CustomView: View {
    var title: String
    var date: String
    var content: String
    var websiteURL: URL?
    var type: String
    var pic: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.85, green: 0.84, blue: 1))
                .frame(width: 325, height: 161)
                .cornerRadius(16)
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                    .overlay(
                        Circle()
                            .stroke(Color(red: 0.42, green: 0.39, blue: 1).opacity(0.47), lineWidth: 5)
                            .overlay(
                            Image(pic)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                            )
                    )
            }
            .frame(width: 35, height: 35)
            .padding(.leading, 15.0)
            .padding(.trailing, 275.0)
            .padding(.top, 20.0)
            .padding(.bottom, 115.0)
            ZStack{
                Text(title)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                    .frame(width: 262, alignment: .topLeading)
            }
            .padding(.top, 20.0)
            .padding(.leading, 77.0)
            .padding(.trailing, 20.0)
            .padding(.bottom, 133.0)
            ZStack{
                Text("Article")
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
            }
                                .padding(.top, 40.0)
                                .padding(.leading, 68.0)
                                .padding(.trailing, 233.0)
                                .padding(.bottom, 112.0)
            ZStack{
                Text(content)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                    .frame(width: 301, alignment: .topLeading)
                                
            }
            .padding(.top, 61.0)
                .padding(.leading, 19.0)
                .padding(.trailing, 5.0)
                .padding(.bottom, 44.0)
            HStack{
                Button(action: {
                                if let url = websiteURL {
                                    UIApplication.shared.open(url)
                                }
                    
                            }) {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 82, height: 28)
                                        .background(Color(red: 0.42, green: 0.39, blue: 1))
                                        .cornerRadius(9)

                                    Text("Check it!")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                                }
                            }
                            .padding(.top, 127.0)
                            .padding(.bottom, 22.0)
                
                ZStack{
                    Image(systemName: "calendar")
                        .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                        .font(.system(size: 17))
                    
                }
                .padding(.top, 127.0)
                .padding(.bottom, 22.0)
                ZStack{
                    Text(date)
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                }
                .padding(.top, 127.0)
                .padding(.bottom, 22.0)
                
            }
            .padding(.trailing, 75.0)
        }
    }
}
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Homepage()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 34.0)
                        .padding(.leading, 16.0)
                    ZStack{Text("Mental Health\nResources")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 260, alignment: .leading)
                            .foregroundColor(.black)}
                    .padding(.trailing,45)
                }
                .padding(.top)
                .padding(.bottom,22)
                NavigationLink(destination: Time_Mangagement()){
                    ZStack{
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 326, height: 86)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(8)
                        ZStack{
                            Text("Time Management")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .kerning(0.15)
                                .foregroundColor(.white)
                                .frame(width: 314, height: 86, alignment: .center)
                        }
                        
                    }
                    .padding(.bottom,23)
                }
                NavigationLink(destination: Stress_Mangagement()){
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 326, height: 86)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(8)
                        ZStack{
                            Text("Stress Management")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .kerning(0.15)
                                .foregroundColor(.white)
                                .frame(width: 314, height: 86, alignment: .center)
                        }
                        
                    }
                    .padding(.bottom,23)
                }
                NavigationLink(destination: Communication()){
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 326, height: 86)
                            .background(Color(red: 0.42, green: 0.39, blue: 1))
                            .cornerRadius(8)
                        ZStack{
                            Text("Communication")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .kerning(0.15)
                                .foregroundColor(.white)
                                .frame(width: 314, height: 86, alignment: .center)
                        }
                        
                    }
                    .padding(.bottom,13)
                }
                HStack{
                    ZStack{
                        Text("Recommendations")
                            .font(.system(size: 18))
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                    ZStack{
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(Color(red: 0.42, green: 0.39, blue: 1))
                            .font(.system(size: 24))
                    }
                    
                    
                }
                .padding(.trailing, 125.0)
                .padding(.bottom,-5.0)
                ScrollView{
                    VStack{
                        CustomView(
                            title: "How to improve your mental wellbeing",
                            date: "23st October ‘23",
                            content: "Explains what mental wellbeing means, and gives tips to help you take care of your mental wellbeing.",
                            websiteURL: URL(string: "https://www.mind.org.uk/information-support/tips-for-everyday-living/wellbeing/"),
                            type: "Article",
                            pic: "Article_01_Img"
                        ).padding(.bottom,-10)
                        CustomView(
                            title: "8 Daily Habits to Boost Mental Health",
                            date: "23st October ‘23",
                            content: "It is crucial for managing stress, relationships, decision-making, and overall quality of life. ",
                            websiteURL: URL(string: "https://www.healthline.com/health/mental-health/habits-to-improve-mental-health"),
                            type: "Article",
                            pic: "Article_02_Img"
                        ).padding(.bottom,12)
                        CustomView(
                            title: "10 Tips for Students",
                            date: "23st October ‘23",
                            content: "The impact of the Covid-19 pandemic on students' mental health, highlighting various issues they faced. ",
                            websiteURL: URL(string: "https://leverageedu.com/blog/mental-health-for-students/"),
                            type: "Article",
                            pic: "Article_03_Img"
                        ).padding(.bottom,12)
                        
                    }.padding(.bottom)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Time_Mangagement: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Mental_Resources()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 34.0)
                        .padding(.leading, 16.0)
                    ZStack{Text("Time\nManagement")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 260,height:100,alignment: .leading)
                        .foregroundColor(.black)}
                    .padding(.trailing,25)
                }
                ZStack{
                    Text("Create a personalized schedule/planner\n\n\u{2022} Realistic\n\u{2022} Highlight prioritized needs\n\u{2022} Incorporate decorations/themes you like\n\u{2022} Incorporate relaxation time\n\nRatio of classroom time to study time should be 1:2 or 1:3\n\n\u{2022} Every hour in class = two to three hours out of class working independently on course assignments. If your\ncomposition class meets for one hour, three times a week, you’d be expected to devote from six to nine hours each\nweek on reading assignments, writing assignments, etc.")
                      .font(Font.custom("Nunito", size: 24))
                      .foregroundColor(.black)
                      .frame(width: 325, height: 668, alignment: .topLeading)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Stress_Mangagement: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        ZStack{
                            NavigationLink(destination: Mental_Resources()) {
                                ZStack {
                                    Image("Back_Button")
                                        .renderingMode(.original)
                                }
                            }
                        }.padding(.trailing, 34.0)
                            .padding(.leading, 16.0)
                        ZStack{Text("Stress")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .frame(width: 270, alignment: .leading)
                            .foregroundColor(.black)}
                        .padding(.trailing,35)
                    }
                    ScrollView{
                        ZStack{
                            Text("\nAvoid Stress\n\u{2022}Take notice of how your body reacts when you feel stressed → the more you are aware of these signs, the more alert you will feel\n\u{2022}Physical movement\n\t\u{2022}AI or the app itself can incorporate stretching exercise guides\n\u{2022}Meditation\n\t\u{2022}AI or the app itself can incorporate guided meditation\n\u{2022}Journaling is a good way to get your thoughts out (positive affirmations)\n\u{2022}Taking walks, avoiding screen usage, being with nature\n\u{2022}If social media use is a factor, cut down on that\n\u{2022}Healthy diet\n\u{2022}Sleep. Stress can lead to sleeping difficulties and sleeping poorly can lead to more stress, which can lead to worse sleeping issues… and so on in a downward spiral. \n\u{2022}Being in the nature can reduce stress hormones\n\u{2022}Reading can reduce stress and relax your body by lowering the heart pace and easing muscle tension \n\nWhat stress is and what causes it \nStress is an emotional or physical reaction of the body towards a challenge or demand. The main causes of student stress are academic pressure, obligatory success, the uncertainty of the future, complications of into the system \nMental health issues have a negative impact on students academic performance, their social relationships, and overall health.\nSymptoms of stress/what stress can lead to\nheadache, tiredness, sleep difficulties (have deeply effects on the cognition), musculoskeletal pain, increased risk of infection, depression, gastrointestinal issues, insomnia\nloss of sleep have deeply effects on the cognition, it amplifies anxiety, reduce attention, can lead to more stress\nbehaviors like an inadequate diet and lack of exercise\nprolonged stress increases the risks of cancer, diabetes and autoimmune diseases, weight gain,\nstress hinders students true abilities\n  ")
                                .font(Font.custom("Nunito", size: 17))
                                .foregroundColor(.black)
                                .frame(width: 325, height: 853, alignment: .topLeading)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct Communication: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ZStack{
                        NavigationLink(destination: Mental_Resources()) {
                            ZStack {
                                Image("Back_Button")
                                    .renderingMode(.original)
                            }
                        }
                    }.padding(.trailing, 8.0)
                        .padding(.leading, 26.0)
                    ZStack{Text("Communication")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 300, alignment: .leading)
                        .foregroundColor(.black)}
                    .padding(.trailing,25)
                }
                ZStack{
                    Text("\n\u{2022}School psychologist \n\u{2022}Bring awareness to teachers and parents \n\u{2022}Therapy groups \n\u{2022}Students who feel stressjoin together and talkabout solutions\n")
                      .font(Font.custom("Nunito", size: 25))
                      .foregroundColor(.black)
                      .frame(width: 325, height: 518, alignment: .topLeading)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        }
}

#Preview {
    ContentView()
}
*/
