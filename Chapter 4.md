# Chapter 4

## Lec 32 Continuous time Markov Chain

#### Comparison

**DTMC**: $x_n, n = 0, 1, 2, ...$

**CTMC**: $x_t$, $t$ is real, at leat 0.

In both cases, space is discrete.

##### Time homogeneous

Probability is independent with time.



#### Markov property

##### DTMC

$$
\mathbb{P}(X_{n+1}=j|x_n = i, x_{n-1}=i_{n-1}, ... x_0 = i_0) = \mathbb{P}(x_{n+1} = j|x_n = i) = p(i,j) = u(i,j)
$$

##### CTMC

$$
\mathbb{P}(X_{t+s}=j|x_s = i, x_{s_n}=i_{n}, ... x_{s_0} = i_0) = \mathbb{P}(x_{t+s} = j|x_s = i) = \mathbb{P}(x_{t} = j|x_0 = i)
$$

The probability dependes on states $i$, $j$ and time $t$.



##### Example: CTMC model

Let $N(t)$ be a Poisson process rate $\lambda$. Let $y_n$ be a DTMC with transition $u(i, j)$. Define $x_t = y_{N(t)}$.

- Is this example Markov?

> 1. only dependes on previous one state
> 2. $y_n$ is Markov

- What if $\tau_i\sim u[0, 1]$?

> <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec32.png" width="200px" /><img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec32-2.png" width="200px" />
> Estimate $\mathbb{P}(x_1) = 1|x_{0.9} = 2, x_{0.8} = 2, …. x_0 = 2 \approx 1/2$,
>
> but $\mathbb{P}(x_{0.1}=1|x_0=2) = 1/10 \times 1/2 = 1/20$.
>
> Thus if $\tau$ is a uniform distribution it doesn't satisfy the Markov property. 
>
> The reason that Poisson process satisfies is because **exponential distribution is memoryless**.

- Compute transition probability in terms of $\lambda$ and $u(i, j)$.

> $p_t(i, j) = \mathbb{P}(x_t = j|x_0 = i) = \sum_{n=0}^\infty\mathbb{P}(x_t = j, N(t) = n |x_0 = i)$.
>
> **Assume $y_n$ and $N(t)$ are independent.**
> $$
> \begin{aligned}
> p_t(i, j) &= \sum_{n=0}^\infty  \mathbb{P}(x_t=j, N(t)=n|x_0=i)\\
> &= \sum_{n=0}^\infty\mathbb{P}(y_{N(t)}=j, N(t)=n|y_0=i)\\
> &= \sum_{n=0}^\infty\mathbb{P}(y_{N(t)}=j|y_0=i)\mathbb{P}(N(t)=n|y_0 = i)\\
> &= \sum_{n=0}^\infty\mathbb{P}(y_n=j|y_0=i)\mathbb{P}(N(t)=n)\\
> &= \sum_{n=0}^\infty u^n(i, j)e^{-\lambda t}\frac{(\lambda t)^n}{n!}
> \end{aligned}
> $$



#### Chapman-Komogorov (CT)

$$
\mathbb{P}_{s+t}(i, j) = \sum_{k\in S}p_s(i, k)p_t(k, j)
$$



#### Memoryless preperty

Exponential distribution is the only continuous random variable with memoryless propety.

Say $X(0) = x$, let $T_x$ be the time to transition away from $x$.
$$
\begin{aligned}
\mathbb{P}(T_x > s+t|T_x>s) &= \mathbb{P}(X(r)=x \text{ for }r\in[0, s+t]|X(r)=x\text{ for }r\in[0, s])\\
&=  \mathbb{P}(X(r)=x \text{ for }r\in[s, s+t]|X(r)=x\text{ for }r\in[0, s])\\ 
&= \mathbb{P}(X(r)=x \text{ for }r\in[s, s+t]|X(s)=x)\\
&= \mathbb{P}(X(r)=x \text{ for }r\in[0, t]|X(0)=x)\\
&= \mathbb{P}(T_x > t)
\end{aligned}
$$

> If $B\subset A$, $P(A, B|A) = P(B|A)$.



## Lec 33

The hold time at a state is exponential. Rate could depende on state.

#### Infinitesimal Rates

Let $T_i$ be **holding time** for state $i$, $T_i \sim \exp(\lambda(i))$.

For a small $h$, let $\lambda = \lambda(i)$, $\mathbb{P}(T_i \leq h) = \int_0^h\lambda e^{-\lambda t}dt = 1 - e^{-h\lambda} = \lambda h - \frac{(\lambda h)^2}{2!} + \frac{(\lambda h)^3}{3!} - … = \lambda h + \cal{O}(h^2)$.

(Using Taylor expansion here.) $\cal{O}(h^2)$: hidden constant.

The main term is linear.

- What's the order of magnitude/main term for probability of two or more steps in $[0, h]$?

  > For $n$ steps, the probability $p_n \leq \mathbb{P}(T_i + T_j \leq h)\leq\mathbb{P}(T_i \leq h)\mathbb{P}(T_j \leq h) =\cal{O}(h^2)$.

Therefore, $\mathbb{P}(x_h\neq i|x_0=i) = \sum_{j\neq i}\mathbb{P}(x_h = j|x_0=i) \leq \mathbb{P}(T_i\leq h) + \cal{O}(h^2) = \sum_{j\neq i}\lambda(i)h + \cal{O}(h^2)$.

Therefore, $\mathbb{P}_h(i, j) = \cal{O}(h)$.



#### jump rate

Define the jump rate from $i$ to $j$:
$$
q(i, j) = \lim_{h\rightarrow 0}\frac{{P}_h(i, j)}{h}.
$$

##### Example 1: underlying DTMC

$Y_n$ with transitions $u(i, j)$, jumps as a Poisson rate $\lambda$.

Recall $p_t(i, j) = \sum_{n=0}^\infty u^n(i, j)e^{-\lambda t}\frac{(\lambda t)^n}{n!}$,

- what is $u^n(i, j)$ if $n=0$ and $i\neq j$ ?

  > 0.

- Find $q(i, j)$.

  > $$
  > \begin{aligned}
  > q(i, j) &= \lim_{h\rightarrow 0}\frac{{P}_h(i, j)}{h}\\
  > &= \lim_{h\rightarrow 0}\frac{e^{-\lambda h}\lambda h}{h}u(i, j)\\
  > &= \lambda u(i, j)
  > \end{aligned}
  > $$
  >
  > 

- Often we will be given the jump rate to find the chain.

##### Example 2

Fixed number of $s$ tellers. Customers arrive as a Poisson process rate $\lambda$, customers served by a teller at rate $\mu$.

The transformation goes as:
$$
\begin{aligned}
q(n, n+1) &= \lambda\\
q(n, n-1) &= \left\{
\begin{aligned}
&n\mu  &n\leq s\\
&s\mu &n>s

\end{aligned}
\right.
\end{aligned}
$$

More about queueing theory on [$M/M/\infty$ queue](https://en.wikipedia.org/wiki/M/M/∞_queue).

**Goal**: use $q(i, j)$ to find probability in an underlying chain.

#### Lemma

Let $r(i, j) = \frac{q(i, j)}{\lambda(i)}$.

**Note**:$\lambda(i) = \sum_{j\neq i}q(i, j)$

Let $T_i$ be time to leave state $i$. Let $y$ be a random variable giving state we make transition to. 

Then $\mathbb{P}(y=j) = r(i, j)$.

**Note**: in example 1, $r(i, j)$ is the same sa $u(i, j)$.

> $T_i$ and $y$ should be independent.



## Lec 34

Given DTMC $y_n$ and hold time parameters, construct the relevant CTMC.

> Assume $\tau_0$, $\tau_1$, $\tau_2$… are independent $\exp(1)$ random variables.

1. at time $t=0$, $x_0 = y_0$.
   $t_1 = \frac{\tau_0}{\lambda(y_0)}$.
2. $x_{t_1} = y_1$ hold for $t_2 = \frac{\tau_1}{\lambda(y_1)}$.
3. $x_{t_1+t_2} = y_2$ hold for $t_3 = \frac{\tau_2}{\lambda(y_2)}$...

What if $\sum t_i < \infty$? 

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec34.png" width="250px" />

Assume that $t_i$ are $t_i = (\frac{1}{2})^i$, $\sum t_i = 1$.

- What does CTMC do at time 1? What about just before?

Explosion at $T_\infty = 1$.

Define $x_t$ for $t\geq T_\infty$ to be $\Delta$: cemetary state.

**Proposition**: suppose $E_n$ are independent $\exp(\lambda_n)$, then $\mathbb{P}(\sum E_n < \infty)= 1$ if $\sum_{n=1}^\infty \frac{1}{\lambda_n} < \infty$.

- If holding time parameter is $\frac{1}{n^2}$, $\sum\frac{1}{n^2}<\infty$ so chain explodes.



### Goal: construct $p_t(i, j)$ from $q(i, j)$

#### Kolmogorou's Forward Equation

Look at $[0, t+s]$ where $h$ is small.

**Idea**: break into $[0, t]$ and $[t, t+h]$.
$$
\begin{aligned}
p_{t+h}(i, j) &= \sum_{k\neq j}p_t(i, k)p_h(k, j) + p_t(i, j)p_h(j, j)  \\
&= \sum_{k\neq j}p_h(k, j)p_t(i, k) + p_h(j, j)p_t(i, j)  \\
&= \sum_{k\neq j}\bold{p_h(k, j)}p_t(i, k) + \left[1-\sum_{k\neq j}\bold{p_h(j, k)} \right]p_t(i, j) \\
\end{aligned}
$$
Move $p_t(i, j)$  to the left hand side and divide by $h$,
$$
\begin{aligned}
\frac{p_{t+h}(i, j) - p_t(i, j)}{h} &= \frac{\sum_{k\neq j}p_h(j, k)p_t(i, k) -\sum_{k\neq j}p_h(k, j) p_t(i, j)}{h} \\
&= \sum_{k\neq j}\frac{p_h(k, j)}{h}p_t(i, k) - \frac{\sum_{k\neq j}p_h(j, k)}{h} p_t(i, j) \\
&= \sum_{k\neq j}p_t(i, k)q(k, j) - p_t(i, j)\lambda(j)
\end{aligned}
$$
As $h\rightarrow 0$,  the left hand side becomes $\frac{d}{dt}p_t(i, j)$. In matrix version, define:
$$
Q(i, j) = \left\{
\begin{aligned}
&q(i, j) &\text{if }i \neq j\\
&-\lambda(j) &\text{if }i = j
\end{aligned}\right.
$$
Thus we acquire the **Kolmogorou's Forward Equation**:
$$
P_t' = P_tQ
$$
and the initial condition is
$$
P_0(i, j) = \left\{
\begin{aligned}
&0 &\text{if }i \neq j\\
&1 &\text{if }i = j
\end{aligned}\right.
$$


#### Kolmogorou's Backward Equation

The equation also satisfies with
$$
P_t' = QP_t
$$

>  **Fact**: the solution is $e^{Qt} = \sum_{n=0}^\infty\frac{(Qt)^n}{n!}$.
>
> - check that $e^{Qt}$ is a solution
> - check that Kolmogorou's forward equation holds for a Poisson arrival process rate $\lambda$.





## Lec 35

##### Definition: irreducible

A CTMC $X_t$ is irreducible if the uderlying DTMC is irreducible.

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec35.png" width="300px" />

Aperiodicity is not meaningful for CTMC.

##### lemma

If $x_t$ is irreducible and $t>0$, then $p_t(i, j) > 0$.

> *proof*: if irreducible, then $i\rightarrow k_1 \rightarrow k_2 … \rightarrow k_n = j$ and $p_s(k_i, k_{i+1})>0$ for all $i=1, …n$.
>
> $p_{s(n-1)}(i, j) = \sum_kp_s(i, k)p_{s(n-2)}(k, j) \geq p_s(i, k_2)p_{s(n-2)}(k_s, j) \geq \Pi_{i=1}^{n-1}p_s(k_i, k_{i+1}) > 0$.



#### Stationary distribution

In discrete time, stationary distribution $\pi$ satisfies $\pi P = \pi$.

##### Definition

For a CTMC $X_t$, $\pi$ is a stationary distirbution if $\mathbb{P}_\pi(x(t)= j) = \pi(j)$ for all $j$, and for all $t>0$.

##### Matrix version

$$
\begin{aligned}
\pi(j) &= \mathbb{P}_\pi(x(t) = j) \\
&= \sum_{k\in S}\mathbb{P}_\pi(x(t)=j, x(0) = k)\\
&= \sum_{k\in S}\mathbb{P}_\pi(x(t)=j|x(0) = k)\mathbb{P}_\pi(x(0) = k)\\
\end{aligned}
$$

$\pi$ plays no role when conditioning, and $\mathbb{P}_\pi(x(0) = k) = \pi(k)$. Therefore, 
$$
\begin{aligned}
\pi(j) &= \sum_{k\in S}p_t(k, j)\pi(k) \\
&= \sum_{k\in S}\pi(k)p_t(k, j)
\end{aligned}
$$
So $\pi = \pi P_t$, true for all possible values of $t$.

##### Rate matrix

$$
Q(i, j) = \left\{
\begin{aligned}
&q(i, j) &\text{if }i \neq j\\
&-\lambda(j) = -\sum_{k\neq i}q(i, k) &\text{if }i = j
\end{aligned}\right.
$$



#### Theorem (solve stationary distribution)

$\cal{\pi}$ is a stationary distribution if and only if $\pi Q = 0$.

> *proof*: using Kolmogorou's forward and backward equations.
>
> - Suppose that $\pi P_t = \pi$.
>
>   $0 = \frac{d}{dt}\pi = \pi P_t'$, using the forward equation, $ \pi P_t' = \pi P_tQ = \pi Q$.
>
> - Now suppose $\pi Q = 0$.
>   $ \frac{d}{dt} (\pi P_t) = \pi P_t' = \pi QP_t = 0$. Therefore $\pi P_t$ is constant. Look at $t=0$, $\pi P_t = \pi I = \pi$.

##### Theorem (limit distribution)

If a CTMC $X_t$ is irreducible and has stationary distribution $\pi$, then $lim_{t\rightarrow \infty}p_t(i, j)= \pi(i, j)$.

> *proof*: define DTMC $z_n^{(h)} = X_{hn}$
>
> **Question**: is $z_n^{(h)}$ aperiodic?
>
> $\mathbb{P}(z_1^{(h)}=i|z_0^{(h)} = j) > 0$
>
> From discrete time result, $\lim_{n\rightarrow \infty} \mathbb{P}(z_1^{(h)}=i|z_0^{(h)} = j) = \lim_{n\rightarrow \infty} \mathbb{P}(X_{nh}=i|X_0 = j)  =  \pi(j)$. 

**Example**

City weather: 1, sunny; 2, smog; 3, rain, with the matrix
$$
Q=\left[ \begin{array}{ccc}
-1/3 & 1/3 & 0\\ 
0 & -1/4 & 1/4 \\
1 & 0 & -1\end{array}\right]
$$
Using $\pi Q = 0$ and $\sum\pi(i) = 1$ to find $\pi$.



## Lec 36 Detailed  Balance

A measure $\pi$ on states  satisfies the detailed balance if $\pi(k)q(k, j) = \pi(j)q(j,k)$.

- $q(k, j)$ jump rate from $k$ to $j$
- $q(j, k)$ jump rate from $j$ to $k$

Check stationarity: total jump rate into $j = \sum_{k\neq j}\pi(k)q(k, j) = \sum_{k\neq j}\pi(j)q(j, k) = \pi(j)\lambda(j)$.

**There is no jump rate from $j$ to $j$**.

> $\pi Q = 0$, $\pi$ is a **row vector**.
> $$
> Q(i, j) = \left\{
> \begin{aligned}
> &q(i, j) &\text{if }i \neq j\\
> &-\lambda(j) &\text{if }i = j
> \end{aligned}\right.
> $$
> $\sum_{k\neq j}\pi(k)q(k, j)  - \pi(j)\lambda(j) =0$ is the $j$th coord of $\pi Q$.



**Example**

Could this graph has $\pi$ satisfying detailed balance?

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec36-1.png" width="200px" />

Arrows makred with jump rates. Cannot satisfy detailed balance, because $\pi(1)q(1, 2) \neq \pi(2)q(2,1)$ because $q(2, 1) = 0$.

> Need to be irreducible!



### Exit distributions

Compute $\mathbb{P}(\text{reach state 0 before state 4})$ determined by the underlying discrete time MC.

Recall $r(i, j) =\frac{q(i, j)}{\lambda{(i)}}$. Let $P$ denote the transition matrix for the underlying chain, then $p(i, j) = r(i, j)$.

- What is $p(i, i)$?
  Probability of having a loop, therefore, $\bold{p(i, i) = 0}$,  because $\bold{q(i, i) = 0}$.
- In another way, $\lambda(i) = \sum_{k\neq i}q(i, k)$ and $r(i, j) = 1$, so $p(i, i)$ has to be 0.



#### Example

A shop has 2 barbers, each cut hair at rate 3 people/h. Customer arrives as Poisson with rate 2 people/h. If there are 4 customers in the shop, 2 getting hair cut, 2 waiting, new customers will go else where.

> States of customers in the store: $\{0, 1, 2, 3, 4\}$.
>
> $q(0,1 ) = 2$
>
> $q(i,i+1) = 2$, for $1\leq i \leq 3$.
>
> $q(1,0) = 3$
>
> $q(4,3) = q(3, 2) = q(2, 1) = 6$, 2 people cutting hair, find the minimum of two $\exp(3)$, thus the distribution is $\exp(6)$.
>
> With $q$ and $\lambda$, we can get the underlying DTMC transition matrix.
>
> <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec36-2.png" width="300px" />
>
> Let $V_0 = \min\{t\geq 0: x_t=0\}$ and $V_4 = \min\{t\geq 0: x_t = 4\}$, find $\mathbb{P}(\text{reach 0 before 4})$, given start at 2.
>
> **Make 0 and 4 absorbing, and the rest are transient states.**
>
> <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec36-3.png" width="300px" />
>
> $F$ is the matrix with $(i, j)$ entry being probability of reaching $j$ first among recurrent states when starting at transient $i$.
>
> $F = MS = (I-\tilde{Q})^{-1}S$, and the numerical result is
>
> <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec36-4.png" width="250px" />
>
> The probability of reaching 0 before 4 drops from initia state being 1 to 3, which is reasonable.



#### Deviation

To find inverse of a matrix, we can use row reduction:

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec36-5.png" width="500px" />



## Lec 37 More on Exit distribution & times

Recall underlying DTMC has 
$$
P = \left[
 \begin{array}{cc}
\tilde{P} & 0 \\ 
S & \tilde{Q}
\end{array}
\right]
$$
entries 
$$
r(i, j) = \left\{
\begin{aligned}
&\frac{q(i, j)}{\lambda(i)} & i\neq j \\
&\lambda(i) & i = j
\end{aligned}
\right.
$$
Let 
$$
\cal{I}_\lambda  = \left[ \begin{array}{cccc}{\lambda(1)} & {0} & {...} & 0\\ 
{0} & {\lambda(2)} & {...} & 0\\
{\vdots} & {\vdots} & {\ddots} & \vdots\\\
{0} & {0} & ... & {\lambda(n)}
\end{array}\right] = diag(\lambda(1), ... \lambda(n))
$$
If $\lambda(i)\neq 0$ the matrix is invertible.

Write down entries of $\cal{I}_\lambda P$:
$$
\cal{I}_\lambda P = \left\{
\begin{aligned}
& q(i, j) &\text{ if $i\neq j$} \\
& 0 & \text{ if $i= j$}
\end{aligned}
\right.
$$
**Only taking the transient part of $\cal{I}$** into $F$:
$$
\begin{aligned}
F &= MS = (I-\tilde{Q})^{-1}S \\
&=  (I-\tilde{Q})^{-1} \cal{I}_\lambda^{-1} \cal{I}_\lambda S \\
&= (\cal{I}_\lambda (I-\tilde{Q}))^{-1}S\\
&= (\cal{I}_\lambda -  \cal{I}_\lambda\tilde{Q})^{-1}S\\
&= (-Q_T)^{-1} \cal{I}_\lambda {S} \\
&= (-Q_T)^{-1} Q_{T, R}
\end{aligned}
$$
<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec37.png" width="250px" />



#### Example

A bacteria colony, each bacterium splits at rate $\mu$ per minute and dies at rate $\lambda$ per minute. There is only enough food for 3 bacteria. Start state is 1, find probability of reaching 3.

> First get the matrix $Q$:
>
> <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec37-2.png" width="300px" />
>
> Treat 3 as absorbing, then the first two rows are all 0, and the last two rows remain unchanged.
>
> Then using the formula $F = (-Q_T)^{-1} Q_{T, R}$ we can compute the probability of reaching 3 from 1.



$M = (I - \tilde{Q})^{-1}$, entry $M_{i. j}$ was $\#\mathbb{E}[\text{visits to $\bold{j}$ if starts at $\bold{i}$}]$, where $i, j$ are both transient states. 

- In CTMC, how long will it be on average at state $j$, if starts at $i$?

> $\frac{m(i, j)}{\lambda{j}}$ is the $(i, j)$th entry of $M(\cal{I}_\lambda)^{-1} = (I-\tilde{Q})^{-1}(\cal{I}_\lambda)^{-1} = (-Q_T)^{-1}$.
>
> $m(i, j)$ is the expected number of times, and $\frac{1}{\lambda_j}$ is the average duration of each visit.



