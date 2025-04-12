//
//  CustomErrorMessageWindow.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 12/04/25.
//

import SwiftUI

struct CustomErrorMessageWindow: View {
    
    var errorMessage: String
    
    var body: some View {
        ZStack {
            Color.clear // para ocupar toda la pantalla si es necesario

            Text("\(errorMessage)")
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
                .font(.title3)
                .frame(width: 300)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    CustomErrorMessageWindow(errorMessage: "Mensaje de error")
}
