//
//  ContentView.swift
//  apiChallenge
//
//  Created by Student16 on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack {
            
            ForEach(viewModel.carros,id: \._id){index in
                
                Text(index.nome!)
                Text("endereco \(index.endereco!)")
                Text("Vagas \(index.vaga!)")
                
                    ForEach(index.carro, id: \.modelo){ p in
                        Text("modelo do carro: \(p.modelo!)")
                        Text("ano: \(p.ano!)")
                        Text("cor: \(p.cor!)")
                        Text("\(p.preco!, specifier: "%.2f")")
                    }
                
                
            }
            .padding(10)
            
        }
        
        .onAppear() {
            viewModel.fetch()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

