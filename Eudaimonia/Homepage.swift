//
//  Homepage.swift
//  Eudaimonia
//
//  Created by Aryan Khimani on 2023-10-17.
//

import SwiftUI
/*
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
                        )
                        RectangleButton(
                            option: 7,
                            selectedOptions: $selectedOptions,
                            imageName: "peace",
                            labelText: "Peace"
                        )
                        
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
*/
#Preview {
    Homepage()
}
