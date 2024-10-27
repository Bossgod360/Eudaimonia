//
//  Face Rec.swift
//  Eudaimonia
//
//  Created by Aryan Khimani on 2023-10-24.
//

import SwiftUI
import AVFoundation
/*
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
*/
#Preview {
    Face_Rec()
}
