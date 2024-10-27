//
//  Mental Resources.swift
//  Eudaimonia
//
//  Created by Aryan Khimani on 2023-10-24.
//

import SwiftUI
/*
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
*/
#Preview {
    Mental_Resources()
}
