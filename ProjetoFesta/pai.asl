// Agent pai in project ProjetoFesta.mas2j

//Crenças iniciais
sujo(carro). //Crença de carro sujo
pergunta(mae). //Crença de perguntar para mae

//Quando adicionar a crença do filho ir a festa então executa
+filho(festa) <-
	.print("Pai: só vai se limpar o carro.");
	.send(mae, tellHow, "+!recado(filho) <- .print(\"Mãe: Seu pai falou para limpar o carro primeiro\"); .send(filho, achieve, pedido(pai))."); //Ensina a mae um novo plano
	.send(mae, achieve, recado(filho)). //Pede para o mae executar esse novo plano inserido

//pano de ensinar o filho a lavar o carro
+!ensinando(lavar) <-
	.print("Pai: Vou te ensinar.");
	.send(filho, tellHow, "+!lava(carro) <- .print(\"Filho: Limpando carro\"); .print(\"Filho: Carro limpo\"); .send(pai, tell, limpo(carro))."); //Ensina o filho um novo plano
	.send(filho, achieve, lava(carro)). //pede para o filho executar esse novo plano

//Quando adicionar a crença de carro limpo
+limpo(carro) <- 
	-sujo(carro); //Retira a crença de carro sujo
	.print("Pai: Agora voce pode ir a festa.");
	.send(filho, untell, pergunta(mae)). /* Retira a crença do filho de perguntar a mae */
