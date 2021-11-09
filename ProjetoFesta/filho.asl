// Agent filho in project ProjetoFesta.mas2j

!falarpai. //executa o plano de falar com o pai

//Pergunta ao pái se pode ir a festa
+!falarpai : true <- 
	.print("Filho: Pai, posso ir em uma festa ?");
	.send(pai,askOne, pergunta(Resposta),Reply); //O filho pergunta ao pai se pode ir a festa
	+Reply. //adiciona a resposta nas crenças

//detalha a crença da resposta do pai, onde pergunta para a mae se pode ir a festa
+pergunta(R)[source(pai)] <-
	.print("Pai: Pergunta para sua ",R,".");
	!falarmae. //executa falar com a mae

//Se tiver a crença "pergunta(mae)" é executado "falarmae"
+!falarmae: pergunta(mae) <- 
	.print("Filho: Mãe, posso ir em uma festa ?");
	.send(mae,tell, filho(festa)). //O filho pergunta a mae se pode ir a festa (manda um tell)

//Descreve a crença quando tem algo sujo
+sujo(S) <-
	.send(mae,untell, filho(festa)); //retira a crença da mae de ir na festa (filho(festa))
	.print("Filho: Limpando ", S,".");
	.print("Filho: ",S," limpa.");
	.send(mae,tell, limpo(S));  //manda a crença para o agente mae onde algo esta limpo
	+limpo(S). //Adiciona a crença  limpo(S)

//Quando retira a crença -sujo(S) então executa novamente o !falamae (Pede novamente para a mae se pode ir na festa)
-sujo(S) <-
	!falarmae.

//Executa quando o agente mae envia um pedido do pai
+!pedido(pai) <-
	.print("Filho: Vou perguntar para o pai como limpa o carro.");
	.print("Filho: Pai, como limpa o carro ?");
	.send(pai, achieve,ensinando(lavar)). //envia para o pai o conteudo para agir no objetivo "ensinando(lavar)"

//Quando o pai retira a crença então finaliza o programa
-pergunta(mae)[source(pai)] <-
	.print("Filho: Obrigado.").

