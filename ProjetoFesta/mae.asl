// Agent mae in project ProjetoFesta.mas2j

//Cren�as iniciais
servicos(2). //Contador de servi�os
sujo(casa). //Casa suja
sujo(louca). //lou�a suja

//Quando o filho pedir para ir na festa ent�o entra aqui
+filho(festa) <-  
	!verificaservico. //Verifica servi�o do filho
	
//Verifica servi�o se ainda houver alguma cren�a de "sujo(X)"
+!verificaservico: sujo(X) <-
	.print("M�e: S� vai se fizer todos os servi�os de casa.");
	.send(filho,tell, sujo(X)). //Manda a cren�a "sujo(X)" para o filho

//Verifica servi�o se tiver servu�os no contador
+!verificaservico: servicos(X) & X == 0 <-
	.print("M�e: todos os servi�os feitos.");
	.print("M�e: Vou perguntar ao seu pai.");
	.print("M�e: O filho pode ir a festa?");
	.send(pai,tell, filho(festa)). //Manda a cren�a do filho ir a festa

//Quando for adicionado a cren�a de "limpo(X)" e tiver servi�os ent�o executa
+limpo(X): servicos(R) & R >=1 <-
	.print("M�e: Legal, ", X, " limpa.");
	.send(filho,untell, sujo(X)); //Retira a cren�a "sujo(X)" do filho
	-+servicos(R-1); //Atualiza o contador de servi�os
	-sujo(X). //retira uma cren�a de sujo quando a cren�a limpo dor inserida
	

