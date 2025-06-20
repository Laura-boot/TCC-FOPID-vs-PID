# Aproximação de Oustaloup e Controlador FOPID

Este documento apresenta um resumo teórico dos fundamentos do controlador FOPID e a técnica de aproximação de Oustaloup, que viabiliza sua implementação prática.

---

## 🧠 Controlador FOPID (PI^λ D^μ)

O controlador FOPID é uma extensão do controlador PID clássico que permite ordens fracionárias nas ações integrativa e derivativa:

C(s) = Kp + Ki / s^λ + Kd * s^μ

- λ: ordem fracionária da parte integrativa  
- μ: ordem fracionária da parte derivativa  
- Quando λ = μ = 1, o FOPID se reduz ao PID clássico

---

## ⚙️ Aproximação de Oustaloup

A aproximação de Oustaloup permite representar o operador fracionário s^α como uma função de transferência racional:

s^α ≈ K × ∏[(s + z_k) / (s + p_k)], para k = -N até N

Onde:

- α ∈ ℝ: ordem fracionária  
- K: ganho constante  
- z_k, p_k: zeros e polos distribuídos logaritmicamente  
- N: ordem da aproximação  
- Intervalo de frequência: [ω_low, ω_high]

Essa aproximação é válida dentro de um intervalo específico de frequência. Quanto maior N, maior a fidelidade da aproximação — mas também maior o custo computacional.

---

## 📊 Exemplo (como no Gráfico 6 do TCC)

No TCC, um exemplo gráfico compara a resposta em frequência de um controlador PID clássico e de um FOPID com \( λ = μ = 0.5 \), evidenciando a diferença de comportamento em baixas e altas frequências.

O código utilizado para gerar este gráfico está disponível em [`oustaloupApproximation.py`](oustaloupApproximation.py).

---

## 📚 Referências

- Podlubny, I. (1994). *Fractional-order systems and PI^λD^μ-controllers*. IEEE Transactions.
- Oustaloup, A. et al. (2000). *Frequency-band complex noninteger differentiator: characterization and synthesis*.
