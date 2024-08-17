programa
{
	funcao AdicionarTarefa(cadeia task[], cadeia taskStatus[], cadeia priorityRank[], inteiro createdTask[])
	{
		cadeia description, choice = "1", priority
		inteiro interruptor = 1
		escreva("\n - ADICIONAR UMA NOVA TAREFA -\n")
		para(inteiro i = 0; i < 20; i++)
		{
			se(createdTask[i] == 0)
			{
				escreva("\nDESCREVA A TAREFA\n")
				leia(description)
				createdTask[i] = 1
				task[i] = description
				taskStatus[i] = "PENDENTE"	
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
					i = 21
				}
			}
		}		
	}	
	funcao ListarTarefas(cadeia task[], cadeia taskStatus[], cadeia priorityRank[], inteiro createdTask[])
	{	
		inteiro achei = 0
		escreva("\n - LISTAR TAREFAS -\n")	
		para(inteiro i = 0; i < 20; i++)
		{
			se(createdTask[i] == 1)
			{
				escreva("[Tarefa: ", task[i], "] - [Prioridade: ", priorityRank[i], "] - [Situação: ", taskStatus[i], "]\n")
				achei = 1
			} senao {
				se(createdTask[i] == 0 e achei == 0)
				{
					escreva("NENHUMA TAREFA FOI ADICIONADA\n")
					pare
				}
			}
		}			
	}	
	funcao ConcluirTarefa(cadeia task[], cadeia taskStatus[], inteiro createdTask[])
	{
		inteiro completedTask, interruptor = 1, achei = 0, achei2 = 0
		escreva("\n - CONCLUIR TAREFAS -\n")
		para(inteiro i = 0; i < 20; i++)
		{
			se(taskStatus[i] == "PENDENTE" ou taskStatus[i] == "CONCLUIDO" )
			{
				achei = 1
			}
			se(taskStatus[i] == "PENDENTE")
			{
				achei2 = 1
			}
			se(achei == 0 e createdTask[i] == 0)
			{
				escreva("NENHUMA TAREFA FOI ADICIONADA\n")
				interruptor = 0
				pare
			}
		}
		para(inteiro i = 0; i < 20; i++)
		{
			se(achei2 == 0 e createdTask[i] == 1)
			{
				escreva("TODAS AS TAREFAS FORAM CONCLUIDAS\n")
				interruptor = 0
				pare
			}
		}
		enquanto(interruptor == 1)
		{
			escreva("\nMARCAR TAREFA COMO CONCLUIDA\n")				
			para(inteiro i = 0; i < 20; i++)
			{
				se(taskStatus[i] == "PENDENTE")
				{
					escreva(i, "- ", task[i],"\n")	
				}
			}	
			leia(completedTask)
			se(completedTask >= 0 e completedTask < 20 e createdTask[completedTask] == 1)
			{				
				taskStatus[completedTask] = "CONCLUIDO"
				interruptor = 0				
			} senao {
				interruptor = 1
			}					
		}			
	}		
	funcao inicio()
	{
		inteiro menuLoop = 1, createdTask[20]
		cadeia menuSelection, task[20], priorityRank[20], taskStatus[20]
		enquanto(menuLoop == 1)
		{
			escreva("\nPROJETO TASK PRO\n")
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
