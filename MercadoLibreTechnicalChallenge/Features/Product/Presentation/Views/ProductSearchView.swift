//
//  ContentView.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 5/04/25.
//

import SwiftUI



struct ProductSearchView: View {
    
    @State private var searchText: String = ""
    @State private var chosenCountry = "🇨🇴 Colombia"

    let countries: [String: String] = [
        "🇦🇷 Argentina": "MLA",
        "🇧🇷 Brasil": "MLB",
        "🇨🇱 Chile": "MLC",
        "🇨🇴 Colombia": "MCO",
        "🇲🇽 México": "MLM",
        "🇵🇪 Perú": "MPE",
        "🇺🇾 Uruguay": "MLU"
    ]
    
    var body: some View {
        ZStack{
            Color(red: 254/255, green: 208/255, blue: 18/255)
                .ignoresSafeArea()
            VStack {
                
                Image("logoApp")
                    .resizable()
                    .scaledToFit()
                Spacer()
                
                HStack{
                    Text("Pais:")
                    VStack {
                        Picker("Selecciona un país", selection: $chosenCountry) {
                            ForEach(countries.keys.sorted(), id: \.self) { key in
                                Text(key).tag(key)
                            }
                        }
                        .pickerStyle(.menu) // o .automatic, .inline, etc.
                        .foregroundColor(.black)
                        .padding()

                        .cornerRadius(8)
                    }
                }

                TextField("Buscando producto...🔍", text: $searchText)
                    .padding(15)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                        
                    )
                    .padding(.horizontal, 10)
                    .padding()
                
                Button(action: {
                    print("Botón presionado")
                }) {
                    Text("Buscar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 80)
                Spacer()
            }
            .padding()
        }
        }

}

#Preview {
    ProductSearchView()
}
