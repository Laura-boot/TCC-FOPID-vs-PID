# Controle de Nível com Controladores PI, PID e FOPID

Este repositório contém os códigos em MATLAB/Simulink desenvolvidos no Trabalho de Conclusão de Curso (TCC) intitulado:

**"Controles PID de Ordem Fracionária e Não Fracionária: Análise Comparativa num Sistema de Reservatório de Água"**

📚 Curso de Engenharia Mecatrônica  
🏫 Centro Universitário do Distrito Federal – UDF  
📅 Ano: 2024  
👩‍💻 Autoras: Maria Laura da Silva e Nicole de Oliveira Gonçalves  
🎓 Orientador: Dr. William Humberto Cuéllar Sánchez

---

## 📌 Objetivo

Comparar o desempenho dos controladores PI, PID (convencionais) e FOPID (de ordem fracionária) em um sistema de controle de nível de água, por meio de simulações no MATLAB/Simulink e validação experimental em bancada real.

---

> 📢 **Este repositório é um apêndice técnico do artigo submetido ao XVII Simpósio Brasileiro de Automação Inteligente (SBAI 2025).**  
> Os resultados, códigos e simulações aqui apresentados fazem parte da base experimental do trabalho.  
>  
> 🔜 Em breve, o artigo completo estará disponível nos **anais oficiais do SBAI 2025**.

---

## 🛠 Tecnologias e Ferramentas

- MATLAB R2023a+
- Simulink
- System Identification Toolbox
- Ferramentas de Controle e Otimização
- Bancada física com CLP e sensores de nível
- Comunicação OPC (Open Platform Communications)

---

## 📁 Organização dos Arquivos

| Pasta / Arquivo                         | Descrição |
|-----------------------------------------|-----------|
| `modelagem/`                            | Códigos da modelagem matemática e identificação da planta |
| `simulacoes/`                           | Simulações em Simulink para os controladores PI, PID e FOPID |
| `sintonizacao/`                         | Scripts de sintonização com o método IMC |
| `implementacao/`                        | Códigos de controle implementados na bancada |
| `implementacao_disturbio/`              | Experimentos com perturbações externas |
| `figuras/`                              | Gráficos e diagramas exportados do MATLAB |

---

## ⚙️ Como Executar

1. Instale o MATLAB com as toolboxes necessárias
2. Abra o projeto desejado (ex: `simulacoes/FOPID_control.slx`)
3. Execute os scripts `.m` relacionados antes de rodar os modelos
4. (Opcional) Conecte a bancada física via OPC para testes reais

---

## 📊 Resultados

- O controlador **FOPID** apresentou melhor desempenho em:
  - Tempo de acomodação
  - Robustez frente a distúrbios
  - Redução dos índices ISE, IAE e ITAE
- O controlador **PI** teve os maiores erros acumulados.
- O controlador **PID** demonstrou desempenho intermediário com boa simplicidade de ajuste.

---

## 📄 Licença

Este projeto está licenciado sob a **Licença MIT**. Veja o arquivo [`LICENSE`](./LICENSE) para mais informações.

---

## 🔗 Citação

Se utilizar este repositório em publicações acadêmicas, cite da seguinte forma:

> Silva, M. L., Gonçalves, N. O. (2024). *Controles PID de Ordem Fracionária e Não Fracionária: Análise Comparativa num Sistema de Reservatório de Água*. Centro Universitário do Distrito Federal - UDF.

---

## 📬 Contato

Para dúvidas ou sugestões:

- [Maria Laura no LinkedIn](www.linkedin.com/in/laura-silva-902411157)
- [GitHub Issues](https://github.com/Laura-boot/TCC-FOPID-vs-PID)

---
