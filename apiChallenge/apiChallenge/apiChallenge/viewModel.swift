
import Foundation

struct Carro: Decodable {
    let _id: String?
    let _rev: String?
    let nome: String?
    let endereco:String?
    let vaga:String?
    let carro : [CarroModel]
}

struct CarroModel : Decodable {
    let modelo: String?
    let ano: Int?
    let cor: String?
    let preco : Double?
    
}
class ViewModel : ObservableObject {
    @Published var carros : [Carro] = []
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/list" ) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Carro].self, from: data)
                
                DispatchQueue.main.async {
                    self?.carros = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    
}

