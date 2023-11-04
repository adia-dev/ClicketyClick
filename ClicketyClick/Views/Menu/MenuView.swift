//
//  MenuView.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import SwiftUI

struct MenuView: View {
    @Namespace var animation
    @State var currentTab = "Keys"
    
    var body: some View {
        VStack {
            HStack {
                TabButton(title: "Keys", currentTab: $currentTab, animation: animation)
                TabButton(title: "Presets", currentTab: $currentTab, animation: animation)
                TabButton(title: "Preferences", currentTab: $currentTab, animation: animation)
            }
            .padding(.horizontal)
            .padding(.top)
            
            Divider()
                .padding(.top, 4)
            
            Image("shape_01")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .opacity(0.8)
            
            HStack {
                Text("Configure the sound of your keys...")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                
                Button(action: {}, label: {
                    Image(systemName: "music.quarternote.3")
                        .foregroundColor(.primary)
                })
            }
            
            Divider()
                .padding(.bottom, 4)
            
            HStack {
                Image("shape_04")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                // .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("adia-dev")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Button(action: {}, label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 300, height: 300)
    }
}

struct TabButton: View {
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = title
            }
        }, label: {
            Text(title)
                .font(.callout)
                .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(currentTab == title ? .white : .primary)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity)
                .background(ZStack {
                    if currentTab == title {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.blue)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    else {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.primary, lineWidth: 0.6)
                    }
                })
                .contentShape(RoundedRectangle(cornerRadius: 4))
        })
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    MenuView()
}
