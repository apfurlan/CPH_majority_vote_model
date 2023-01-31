# Monte Carlo Simulation of Majority Voting Model

Monte Carlo simulation of the Majority Vote Model 

## Majority Voting Model

## Metropolis Algorithm

O algoritmo em fornece a taxa de transição ${\cal W}$ condizente com o 
requisito de balanço detalhado, gerando corretamente as configurações de 
equilíbrio. Sua prescrição é dada por

$$
W_{i \rightarrow j} = 
\begin{cases} 
e^{-\beta\Delta E} & if & \Delta E > 0 \\
1 & se & \Delta E > 0
\end{cases}
$$

onde $\Delta E = E(\sigma_j ) − E(\sigma_i)$. Na prática a taxa de transição $W_{i \rightarrow j}$ 
é implementada comparando o fator $e^{-\beta\Delta E}$ com números aleatórios 
${\cal R}$ $\in$ $[0, 1]$. Se $\Delta E < 0$, implementamos a troca da configuração 
atual $\sigma_i$ por $\sigma_j$, caso contrário a nova configuração somente será 
aceita se $e^{−\beta \Delta E} > {\cal R}$. Se $e^{\beta \Delta E} < R$ então 
$\sigma_j$ é rejeitada [1]. Observe que se $\Delta E < 0$ estamos gerando uma 
cadeia de Markov de estados com energia decrescente. Realizando-se o procedimento 
repetidas vezes alcançamos a situação de equilíbrio.

## General Results

<img src="./img/magn.png" width="200" height="200" class="center" /><img src="./img/susce.png" width="200" height="200" class="center" />
<img src="./img/bind.png" width="200" height="200" class="center" />


## References

[1] ALLEN, M. P.; TILDESLEY, D. J. Computer Simulation of Liquids. Oxford science
publications. Oxford University Press, USA, 1989.