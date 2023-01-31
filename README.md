# Monte Carlo Simulation of Majority Voting Model

Monte Carlo simulation of the Majority Vote Model 

## Majority Voting Model

## Metropolis Algorithm

O algoritmo em fornece a taxa de transição ${\cal W}$ condizente com o requisito de
balanço detalhado, gerando corretamente as configurações de equilíbrio.
Sua prescrição é dada por

$$
{\cal W} \rightarrow  
\begin{cases} 
\vert 1 \rangle \bigg[\frac{2\beta}{\sqrt{\alpha^2 + 4\beta^2}}\vert B\rangle &D_1\textrm{ clicks, probability $\frac{\alpha^2}{4}$}\\
\quad - \frac{\alpha}{\sqrt{\alpha^2 + 4\beta^2}}\vert A \rangle\bigg], & \\
\vert 2 \rangle\vert A \rangle, &D_2\text{ clicks, probability $\frac{\alpha^2}{4}$}\\
\vert \text{scattered} \rangle\vert A \rangle, &\text{no clicks with probability $\frac{\alpha^2}{2}$}
\end{cases}
$$

Wi→j =



e
−β∆E se ∆E > 0
1 se ∆E < 0


onde $Delta E = E(\sigma_j ) − E(\sigma_i)$. Na prática a taxa de transição $W_{i\rightarrowj}$ 
é implementada comparando o fator $\exp{-\beta\Delta E}$ com números aleatórios 
${\cal R}$ $\in$ $[0, 1]$. Se $\Delta E < 0$ implementamos a troca da configuração 
atual $\sigma_i$ por $\sigma_j$, caso contrário a nova configuração somente será 
aceita se $\exp{−\Beta \Delta E} > {\cal R}$. Se $\exp{\Beta\Delta E} < R$ então 
$\sigma_j$ é rejeitada [97]. Observe que se $\Delta E < 0$ estamos gerando uma 
cadeia de Markov de estados com energia decrescente. Realizando-se o procedimento 
repetidas vezes alcançamos a situação de equilíbrio[1].

## General Results


## References

[1]ALLEN, M. P.; TILDESLEY, D. J. Computer Simulation of Liquids. Oxford science
publications. Oxford University Press, USA, 1989.