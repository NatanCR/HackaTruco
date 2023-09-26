//
//  Regras.swift
//  HackaTruco
//
//  Created by Luana Moraes on 25/09/23.
//

import Foundation


class Regras {
    static let shared = Regras()
    let lista = [
        ListaRegras(titulo: "Número de cartas", descricao: "Utiliza-se um baralho, sendo que as cartas 8, 9 e 10 e curingas são excluídas."),
        ListaRegras(titulo: "Glosário do Truco", descricao: "A Mão: Corresponde à jogada das três cartas. A mão tem três vazas.\n O Mão: O jogador que deve jogar a primeira carta. O primeiro à direita de quem distribui as cartas.\n O Pé: Aquele que deve jogar a última carta, o mesmo que distribui as cartas.\n Vira: Carta que determina as manilhas ponto acima.\n Manilha: Carta ponto acima da vira.\n Raio: Fechamento de uma queda de 12 tentos.\n Tento: Ponto.\n Vaza: Uma de cada três partes de uma mão. Vence a vaza quem mostrar a maior carta.\n Casal Maior: As duas maiores manilhas do jogo."),
        ListaRegras(titulo: "Valores das mãos", descricao: "Paus/Zap/Gato: Manilha de maior valor, do naipe de paus.\n Copas/Copeta/Copilha: Segunda manilha, do naipe de copas.\n Espadas/Espadilha: Terceira manilha, de naipe de espadas.\n Ouros/Pica-fumo/Mole: Quarta manilha do naipe de ouros.\n As demais cartas, em ordem decrescente de valor são: 3, 2, Ás, reis, valetes, damas, 7, 6, 5 e 4."),
        ListaRegras(titulo: "Desenrolar do jogo", descricao: "O Truco é disputado em mãos. Cada mão vale inicialmente 1 ponto, e ganha o jogo a dupla ou trio que fizer 12 pontos. Para jogar uma mão, cada jogador recebe três cartas. \n Em cada rodada, cada jogador coloca uma de suas cartas na mesa, e o jogador com a carta mais forte vence a rodada. Quem ganhar 2 dessas rodadas ganha a mão e marca 1 ponto, e uma nova mão se inicia.\n A qualquer hora o jogador pode pedir Truco. É o grande momento do jogo. O Truco é pedido para elevar a aposta a três tentos. Ao ser trucada, a dupla adversária tem direito a três ações:\n 1. Mandar cair (a mão passa a valer três tentos);\n 2. Pedir 6 (a mão passa a valer seis tentos);\n 3. Fugir (a dupla que trucou leva um tento).\n E assim sucessivamente."),
        ListaRegras(titulo: "Mão de 11", descricao: "A Mão de 11 é aquela na qual uma dupla ou trio atinge 11 pontos. Na Mão de 11 para uma só equipe, é permitido olhar as cartas do parceiro. Caso a dupla resolva jogar, a mão valerá três tentos. Caso resolva fugir, os adversários ganham um tento.\n Quem trucar em Mão de 11 perderá três tentos. O empate em Mão de 11 beneficiará os adversários com três tentos.\n Com cartas a provar vitória garantida em Mão de 11 (ex.: Casal Maior), o desenvolvimento da jogada se torna desnecessário, bastando tão somente que essas cartas sejam mostradas."),
        ListaRegras(titulo: "Empate em Mão de 11\n (Mão de Ferro/Escuro)", descricao: "Não é permitido fazer maço. As cartas devem ser dadas de três em três ou de uma em uma sem pingar, no sentido anti-horário, com a vira na última carta.\n Havendo empate, ninguém ganha tentos, passando o maço para frente. Há ainda uma variação jogada neste caso, em que nenhum jogador pode ver suas cartas. Deve-se jogar as cartas na sorte."),
        ListaRegras(titulo: "Conversas", descricao: "A competição deve se desenvolver por meio de sinais ou gestos. Nenhuma palavra, sob forma de orientação, poderá ser dita durante a jogada, incorrendo aquele que assim proceder, na perda do tento em jogo."),
        ListaRegras(titulo: "Empates nas vazas", descricao: "Havendo empate na primeira vaza, ninguém é obrigado a mostrar sua carta maior na segunda, mesmo com trucada, podendo a mão terminar na terceira vaza, valendo, pois, essa carta maior na jogada.\n Em caso de empate nas três vazas sem trucada, ninguém ganha tento, passando-se o maço para a frente. Em caso de empate nas três vazas com trucada, o adversário ganha 3 tentos.\n Observe-se ainda:\n Quem truca ou retruca em Carta Exposta, perde em caso de empate;\n Quem truca ou retruca no Escuro, joga pelo empate;\n Deve-se observar o limite dos tentos. Ex.: Quem tem nove tentos não pode retrucar com seis (somente no caso de empate)."),
        ListaRegras(titulo: "Variações", descricao: "Em cada região do Brasil o jogo tem algumas diferenças nas regras. Uma variação comum no Sul do Brasil é o truco jogado com o baralho espanhol.")
    ]
    
}

struct ListaRegras: Hashable {
    var titulo: String
    var descricao: String
}
