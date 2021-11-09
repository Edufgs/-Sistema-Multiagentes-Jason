// Agent mae in project ProjetoFesta.mas2j

//Crenças iniciais
servicos(2). //Contador de serviços
sujo(casa). //Casa suja
sujo(louca). //louça suja

//Quando o filho pedir para ir na festa então entra aqui
+filho(festa) <-  
	!verificaservico. //Verifica serviço do filho
	
//Verifica serviço se ainda houver alguma crença de "sujo(X)"
+!verificaservico: sujo(X) <-
	.print("Mãe: Só vai se fizer todos os serviços de casa.");
	.send(filho,tell, sujo(X)). //Manda a crença "sujo(X)" para o filho

//Verifica serviço se tiver servuços no contador
+!verificaservico: servicos(X) & X == 0 <-
	.print("Mãe: todos os serviços feitos.");
	.print("Mãe: Vou perguntar ao seu pai.");
	.print("Mãe: O filho pode ir a festa?");
	.send(pai,tell, filho(festa)). //Manda a crença do filho ir a festa

//Quando for adicionado a crença de "limpo(X)" e tiver serviços então executa
+limpo(X): servicos(R) & R >=1 <-
	.print("Mãe: Legal, ", X, " limpa.");
	.send(filho,untell, sujo(X)); //Retira a crença "sujo(X)" do filho
	-+servicos(R-1); //Atualiza o contador de serviços
	-sujo(X). //retira uma crença de sujo quando a crença limpo dor inserida
	

