//
//  ApiRequest.swift
//  HackaTruco
//
//  Created by Natan de Camargo Rodrigues on 25/09/23.
//

import Foundation

class ApiRequest: ObservableObject {
    @Published var reshuffle : ShuffleModel? = nil
    @Published var draw: DrawModel? = nil
    
    /**Faz a chamada da API com as cartas necessárias **/
    func getNewDeck(completion: @escaping (ShuffleModel) -> Void) {
            guard let url = URL(string: "https://www.deckofcardsapi.com/api/deck/new/shuffle/?cards=AS,AD,AC,AH,2S,2D,2C,2H,3S,3D,3C,3H,KS,KD,KC,KH,JS,JD,JC,JH,QS,QD,QC,QH,7S,7D,7C,7H,6S,6D,6C,6H,5S,5D,5C,5H,4S,4D,4C,4H") else {return}
            
        callJsonApi(url: url, object: ShuffleModel.self) { deckModel in
                self.reshuffle = deckModel
                completion(self.reshuffle ?? ShuffleModel(sucess: false, deck_id: "", shuffled: false, remaining: 0))
            }
        }
    
        /**
         * Faz a chamada API que reembaralha um deck já existente (deve passar o id do deck) 
         */
        func getReshuffle(deckId: String, completion: @escaping (ShuffleModel) -> ()) {
            guard let url = URL(string: "https://deckofcardsapi.com/api/deck/\(deckId)/shuffle/") else {
                print("nao deu certo")
                return
            }
            
            callJsonApi(url: url, object: ShuffleModel.self) { deckModel in
                self.reshuffle = deckModel as ShuffleModel
                completion(self.reshuffle ?? ShuffleModel(sucess: false, deck_id: "", shuffled: false, remaining: 0))
            }
        }
    
    
        /**
         * Faz a chamada API para puxar uma quantidade de cartas de um deck. Deve passar o id do deck e a quantidade de cartas a ser puxada
         */
        func drawCard(deckId: String, drawCount: Int, completion: @escaping (DrawModel) -> Void) {
            guard let url = URL(string: "https://deckofcardsapi.com/api/deck/\(deckId)/draw/?count=\(drawCount)") else {return}
            
            callJsonApi(url: url, object: DrawModel.self) { deckModel in
                self.draw = deckModel
                completion(self.draw ?? DrawModel(sucess: false, deck_id: "", cards: [], remaining: 0))
            }
        }
    
    
    /**
     * Faz a chamada da API e a converte o JSON para o objeto, retornando o objeto deste tipo.
     * url: Passe a url da api nesse parâmetro.
     * object: Passe o modelo do tipo "Deck" que irá receber o JSON (no caso, ShuffleModel ou DrawModel)
     */
    private func callJsonApi<T:DeckOfCards>(url: URL, object: T.Type, completion: @escaping (T) -> ()) {
        // api call
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else { return }
            
            // convert from json
            do {
                let decodedDeck = try JSONDecoder().decode(object.self, from: data)
                
                DispatchQueue.main.async {
                    completion(decodedDeck as T)
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}
