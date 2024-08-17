/*Ideia Final do Projeto
O projeto é um Sistema de Gerenciamento de Tarefas que permite ao usuário organizar e controlar suas atividades diárias. O sistema é baseado em um menu de linha de comando e suporta três funcionalidades principais:

Adicionar Tarefas:

O usuário pode criar uma nova tarefa fornecendo uma descrição e definindo uma prioridade.
As tarefas são armazenadas em uma lista e inicialmente são marcadas como não concluídas.
Listar Tarefas:

O sistema exibe todas as tarefas armazenadas.
Para cada tarefa, é mostrado:
Descrição: O que precisa ser feito.
Prioridade: Importância da tarefa (por exemplo, alta, média ou baixa).
Status: Indicação se a tarefa está concluída ou pendente.
Concluir Tarefas:

O usuário pode marcar uma tarefa específica como concluída.
A tarefa permanece na lista, mas seu status muda para concluída, facilitando a visualização do progresso.
Funcionamento
Armazenamento:

As tarefas são armazenadas em um vetor. Cada tarefa é representada por um registro contendo a descrição, a prioridade e o status de conclusão.
Interação com o Usuário:

O programa oferece um menu simples onde o usuário pode escolher entre adicionar uma nova tarefa, listar todas as tarefas, marcar uma tarefa como concluída ou sair do sistema.
A escolha do usuário determina qual ação será executada.
Atualização e Visualização:

Após adicionar uma tarefa, ela é imediatamente incluída na lista de tarefas.
Quando o usuário marca uma tarefa como concluída, o sistema atualiza o status dessa tarefa e a reflete na próxima listagem de tarefas.*/

//Adicionar Tarefa:

/*1- O usuário entra com uma descrição como "Comprar leite" e uma prioridade como 1 (alta).
A tarefa "Comprar leite" é adicionada à lista com prioridade alta e status como pendente.*/


programa
{
	
	funcao AdicionarTarefa(cadeia task[], cadeia taskStatus[], cadeia priorityRank[], inteiro createdTask[])
	{
		cadeia description, choice = "1", priority
		inteiro interruptor = 1
		
			para(inteiro i = 0; i < 20; i++)
			{
				escreva("\nDESCREVA A NOVA TAREFA\n")
				leia(description)
				createdTask[i] = 1
				task[i] = description
				taskStatus[i] = "PENDENTE"	
				choice = "stop"
				interruptor = 1
							
				enquanto(interruptor == 1)
				{				
					escreva("DEFINA O GRAU DE IMPORTANCIA DESSA TAREFA\n")
					escreva("1- BAIXA\n")
					escreva("2- MEDIA\n")
					escreva("3- ALTA\n")
					leia(priority)
								
					se(priority == "1" ou priority == "2" ou priority == "3")
					{
							
						se(priority == "1")
						{
							priorityRank[i] = "BAIXA"	
						}
	
						se(priority == "2")
						{
							priorityRank[i] = "MEDIA"							
						}
	
						se(priority == "3")
						{
							priorityRank[i] = "ALTA"							
						}	
						interruptor = 0
						i = 21						
					} senao {
						interruptor = 1		
					}
				}
				escreva("DESEJA ADICIONAR MAIS UMA NOVA TAREFA, DIFERENTE DA ANTERIOR?\n")
				escreva("1- SIM\n")
				escreva("OUTRA TECLA- NAO\n")		
				leia(choice)			
	
				se(choice != "1")
				{
					i=21
				}
				
			}
			

	}
	
	funcao ListarTarefas(cadeia task[], cadeia taskStatus[], cadeia priorityRank[], inteiro createdTask[])
	{
		para(inteiro i = 0; i < 20; i++)
		{
			se(createdTask[i] == 1)
			{
			escreva("[Tarefa: ", task[i], "] - [Prioridade: ", priorityRank[i], "] - [Situação: ", taskStatus[i], "]\n")
			}
		}			
	}
	
	funcao ConcluirTarefa(cadeia task[], cadeia taskStatus[], inteiro createdTask[])
	{
		inteiro completedTask, interruptor = 1

		enquanto(interruptor == 1)
		{
			para(inteiro i = 0; i < 20; i++)
			{
				escreva("\nMARCAR TAREFA COMO CONCLUIDA\n")	
				se(taskStatus[i] == "PENDENTE")
				{
				escreva(i, "- ", task[i],"\n")	
				leia(completedTask)
					se(createdTask[completedTask] == 1)
					{
						taskStatus[i] = "CONCLUIDO"
						interruptor = 0				
					} senao {
						interruptor = 1
					}
				}
			}	
		}			
	}
			
	funcao inicio()
	{
		inteiro menuLoop = 1, createdTask[20]
		cadeia menuSelection, task[20], priorityRank[20], taskStatus[20]

		enquanto(menuLoop == 1)
		{
			escreva("\nPROJETO TASKPRO\n")
			escreva("1- ADICIONAR UMA NOVA TAREFA\n")
			escreva("2- LISTAR TAREFAS\n")
			escreva("3- CONCLUIR TAREFA\n")
			leia(menuSelection)

			se(menuSelection == "1")
			{
				AdicionarTarefa(task, taskStatus, priorityRank, createdTask)
			}
			
			se(menuSelection == "2")
			{
				ListarTarefas(task, taskStatus, priorityRank, createdTask)	
			}
			
			se(menuSelection == "3")
			{
				ConcluirTarefa(task, taskStatus, createdTask)
			}										
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2980; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {task, 41, 31, 4}-{task, 102, 29, 4}-{task, 113, 30, 4};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */