# Chapter 3

## Lec 24 Renewal process

Recall: Poisson process, $\tau_1$, $\tau_2$, … were independent, $\exp(\lambda)$ arrival times.

$\lambda$ is Poisson process rate, and

$T_n = \tau_1 + \tau_2 + … + \tau_n$,

$N(t) = \max\{n: T_n\leq t\}$.

**New idea**: $\tau_i$ is still indepdent, but may not be $\exp$ distributed. An non-negative distribution is okay.

1. Machine repair: arrival is when a machine is repaired to "like new" state
2. Markov chains: return time to a state $x$ is a renewal $T_x$.

In discrete case, $T_x$ is an integer. Generally $\tau_i = 0$ with some probability is okay.

### Law of Large Numbers

Let $x_1$, $x_2$, … be i.i.d. then
$$
\mathbb{P}\left(\left|\frac{x_1+x_2+...}{n}-\mu\right|>\epsilon\right) \rightarrow 0
$$
as $n\rightarrow \infty$.

Assume $Var(x_i)<\infty$, $\mathbb{P}\left(\left|\frac{x_1+x_2+...}{n}-\mu\right|>\epsilon\right) \leq \frac{Var X}{n\epsilon^2}\rightarrow 0$.

### Strong LLN

Let $x_1$, $x_2$, … be i.i.d with $\mu=E[x_i]$. Then with probability 1, 
$$
\frac{x_1+...+x_n}{n}\rightarrow \mu
$$
**example**

$x_i$ is the number showing on a fair die (6 sided), $\frac{S_n}{n} \rightarrow 3.5$.

**Discuss**: what does *probability 1* mean?

In space of infinite sequences of $x_i$, there are infinite many infinite sequences where the above convergence would fail, but their total measure is 0.

**Theorem**

Let $\mu=E[\tau_i]$, $\tau_i$ is the $i$th "interrarival arrival" time. 

If $\mathbb{P}(\tau_i>0)>0$, then with probability 1, $\frac{N(t)}{t}\rightarrow \frac{1}{\mu}$.

Try $\tau_i \equiv \mu$, for $N(t) = n$, $n\mu \leq t < (n+1)\mu$.

If $\mathbb{P}(\tau_i>0) = 0$, then $\tau_i  = 0$, $\frac{N(t)}{t} = \infty$.

If  probability of $\tau_i \neq 0$ is positive, the theorem applies.

>*proof*
>
>With strong law of large numbers,
>$$
>\lim_{n\rightarrow \infty}\frac{T_n}{n} = \lim_{n\rightarrow \infty}\frac{\tau_1+...+\tau_n}{n} = \mu
>$$
>$T_{N(t)}\leq t < T_{N(t)+1}$, so
>$$
>\frac{T_{N(t)}}{N(t)} 
>\leq \frac{t}{N(t)} < \frac{T_{N(t)+1}}{N(t)+1}\cdot \frac{N(t)+1}{N(t)}
>$$
>as $n\rightarrow\infty$, $\frac{N(t)+1}{N(t)}\rightarrow 1$, so
>$$
>\frac{T_{N(t)}}{N(t)} 
>\leq \frac{t}{N(t)} \leq \frac{T_{N(t)+1}}{N(t)+1}
>$$
>Thus $\mu\leq \frac{t}{N(t)} \leq \mu$, showing $\lim_{t\rightarrow\infty} \frac{N(t)}{t} =\frac{1}{\mu}$.



## Lec 25 Renew Reward

Suppose at time $t_i$,  we get reward $R_i$. $N(t) = $ number of arrivals up to time $T$.
$$
\left\{\begin{aligned}
R_i \text{ are independent}\\
(R_i,\tau_i) \text{ are independent}
\end{aligned}
\right.
$$
But $R_i$ may depend on $\tau_i$.

$T_n = \tau_1 + \tau_2 + … + \tau_n$.

Goal: $R(t) = \sum_{i=1}^{N(t)}R_i$.

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec25.png" width="300px" />

**Example**: insurance company receives claims at times $T_n$, gets a reward $R_n$.

$R_(t)$ running total costs to time $t$. Say $t$ is months. How much should charge for premiums?
$$
\lim_{t\rightarrow \infty}\frac{R(t)}{t} : \text{long run reward per unit time}
$$

#### Theorem: Renewal-Reward

If $\mathbb{E}[R_j] < \infty$, $\mathbb{E}[\tau_j] = \mu \in (0, \infty)$, for $j\geq 1$, then $r =  \lim_{t\rightarrow \infty}\frac{R(t)}{t} = \frac{\mathbb{E}(R_1)}{\mu}$. ($R_i$ are i.i.d.)

 ($\mathbb{E}(R_1) = \mathbb{E}(R_2) = ...$), all $R_i$ have same distribution.

>  *proof*
>  $$
>  r = \lim_{t\rightarrow\infty}\frac{\sum_{i=1}^{N(t)}R(t)}{t} = \lim_{t\rightarrow\infty}\left(\frac{1}{N(t)}\sum_{i=1}^{N(t)}R(t)\right)\left(\frac{N(t)}{t}\right)
>  $$
>  $\frac{N(t)}{t} \rightarrow \frac{1}{\mu}$.

Prove limit is as it should be for this $w$ in sequence space. 

Know: $\frac{R_1 + … + R_{N(t)}}{N(t)}\approx \mathbb{E}[R_1]$ if $n>n_0$. Choose $t$ so that $N(t) > n_0$.

> SLLN: If $\mathbb{E}[R_1]<\infty$, $\frac{R_1 + … + R_{N(t)}}{N(t)}\rightarrow \mathbb{E}[R_1]$ with probability 1.

Conclude: $r = \frac{\mathbb{E}[R_1]}{\mu}$.

> Sequence Space: Values of $R_1, R_2, …$ initially $\frac{R_1 + … + R_{N(t)}}{n}$ may not converge to $\mathbb{E}[R_1]$, pick $w$ in sequence space that does converge. This fixes the values of $R_1, R_2, R_3, ...$
>
> The distribution of the $\tau_i$ still satisfies $N(t)\rightarrow \infty$ as $t \rightarrow \infty$ and $N(t)$ finite. Now dependence doesn't matter.



**Example**

Restaurant pays $c_1$ per day to be clean and safe. Can restaurant pay less (plus fines) to make more money？

$y_i$ is the number of days between inspections, $\mathbb{E}(y_i) = 45$. Assume probability of finding a violation $p = p(c_2)$, $c_2 < c_1$ is the new amount pair for safety and health.

Let $N$ be number of inspections between found violations (include day found).

$P(N=0) = 0$, $P(N = 1) = p(c_2)$ and $P(N=k) = (1-p(c_2))^{k-1}p(c_2)$.

Name for $N$: $Geom(p)$.

Let $T_n$ be the day $n^{th}$ violation found, and $\tau_1$ the interrarival time when violation is found. $\tau_1 = \sum_{i=1}^Ny_i$.
$$
\mathbb{E}(\tau_1) = \mathbb{E}(y_1)\cdot \mathbb{E}(N) = \frac{45}{p(c_2)}
$$
$N(t)$ is number of fines up to time $t$, $i^{th}$ fine is $F_i$.

Total cost:
$$
c(t) = c_2\cdot t + \sum_{i=1}^NF_i \\
\frac{c(t)}{t} = c_2 + \frac{\sum_{i=1}^NF_i}{t} \xrightarrow{t\rightarrow\infty}c_2 + \frac{\mathbb{E}[F_i]p(c_2)}{45}
$$
Assume $p = \frac{1}{1+c_2}$, then $f(c_2) = c_2 + \frac{\mathbb{E}[F_i]}{45(1+c_2)}$. Using calculus, we can find the mean is $\mathbb{E}[F_i] = 150$.



## Lec 26 Alternating renewal process

Two random variables:

- time spent on HW: $h_1, h_2, ...$
- time spent on sleeping: $s_1, s_2, ...$

$\mathbb{E}[h_i] = \mu_H$, $\mathbb{E}[s_i] = \mu_S$.

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec26.png" width="300px" />

State: 1, 2, 1, 2, ...

#### Theorem: limit fraction of state

In an alternating renewal process with states $h$, $s$, the limiting fraction of time in state $s$ is 
$$
\frac{\mu_S}{\mu_H + \mu_S}.
$$
**Question**: are there renewals? where?

How to account for two random time intervals?

- Separate $h$, $s$ renewals.
  Whole cycle: hw + sleep. Using whole cycle renewals: define $\tau_i = h_i + s_i$.

  > *proof*
  >
  > **renewal reward**: at each renewal, get reward.
  > For example, let sleep time $s_i$ be the reward $s_i = R_i$.
  >
  > Notice inside pair $(R_i, \tau_i)$ and compare with $(R_{i+1}, \tau_{i+1})$, different pairs are independent, but $\tau_i$ does depend on $R_i$.
  >
  > Can still apply Renewal-Reward theorem,
  > $$
  > \frac{R(t)}{t} \rightarrow \frac{\mathbb{E[R_i]}}{\mathbb{E}[\tau_i]} = \frac{\mu_S}{\mu_S+\mu_H}\\
  > \text{where } R(t) = \sum_{i=1}^{N(t)}R_i
  > $$



### Example 3.5 [109]

> Example 3.5. Poisson janitor. A light bulb burns for an amount of time
> having distribution F with mean μF then burns out. A janitor comes at times
> of a rate λ Poisson process to check the bulb and will replace the bulb if it
> is burnt out. (a) At what rate are bulbs replaced? (b) What is the limiting
> fraction of time that the light bulb works? (c) What is the limiting fraction of
> visits on which the bulb is working?





### Age and Residual Life

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec26-2.png" width="300px" />

$N(t) = \max\{n: T_n\leq t\}$

$A(t) = t - T_{N(t)}$

$Z(t) = T_{N(t)+1} - t$

If $t_0 = T_3$, the $A(t_0) = 0$, $Z(t_0) =T_4 - T_3$.

In discrete case:  all time intervals are positive integers.

Write a Markov chain example with the property:

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec26-3.png" width="300px" />

Renewal: eg, first return to R; starting from R; ...

Return times are positive integers; R has a loop if $p>0$.

Define **return time**: $\tau_R = \min\{n:X_n = R, n\geq 1\}$.

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec26-4.png" width="600px" />

**Define**
$$
\tilde{z}(t) = \left\{\begin{aligned}
&0 &\text{if $t$ is a renewal} \\
&z(t) &\text{else} 
\end{aligned}\right.
$$
$\lim_{n\rightarrow\infty}\frac{1}{n}\sum_{m=1}^{n}\mathbb{P}[A(m) = i]$ (when **fix** state $i$ is equal to $\lim_{n\rightarrow\infty}\frac{1}{n}\sum_{m=1}^{n}\mathbb{P}[\tilde{z}(m) = i]$.

 

## Lec 27

### Theorem: Non-honogeneous Thining

For a Poisson process with rate $\lambda$, keep (mark) at time $s$ with Probability $p(s)$. The points we keep form a non-homogeneous Poisson process with rate $\lambda p(s)$.

> Textbook:
>
> Suppose that in a Poisson process with rate $\lambda$, we keep a point that lands at $s$ with probability $p(s)$. Then the result is a nonhomogeneous Poisson process with rate $\lambda p(s)$.
>
> For the general case, we use the multinomial to conclude that if $p_{j}=P\left(Y_{i}=j\right)$ for $1 \leq j \leq m$ then
> $$
> P\left(X_{1}=k_{1}, \ldots X_{m}=k_{m}\right) =e^{-\lambda t} \frac{(\lambda t)^{k_{1}+\cdots k_{m}}}{\left(k_{1}+\cdots k_{m}\right) !} \frac{\left(k_{1}+\cdots k_{m}\right) !}{k_{1} ! \cdots k_{m} !} p_{1}^{k_{1}} \cdots p_{m}^{k_{m}}=\prod_{j=1}^{m} e^{-\lambda p_{j} t} \frac{\left(\lambda p_{j}\right)^{k_{j}}}{k_{j} !}
> $$

In rate $\lambda$ process, the number of arrivals in $N(t) - N(s)$ is $Poi(\lambda(t-s))$ before thining.

- What is the parameter in "kept" process in window from "s to t"? $\int_s^t p(x)dx$.



**Example**

Cell tower can handle finite many calls. Calls start as a Poisson process with parameter $\lambda$ and duration $D$ of calls is a random variable with distribution $G$.
$$
G(t) = \mathbb{P}(D\leq t)\\
\rightarrow G(0) = 0\\
\rightarrow G(1) = \infty
$$

- A call starts at time  $s$. What's the probability it continues to time $t>s$ ?
  $1 - G(t-s) = \mathbb{P}(D>t-s) = p(s)$.

- Idea: use probability that call continues  to  time $t$ as $p(s)$ to thin the process.
  Exactly the calls in system at time $t$: Poisson with rate $\lambda p(s)$.
  Kept calls are Poisson process  with rate $\lambda(1-G(t-s))$. (In window $[0, t]$)

- How many calls are in the system at time $t$?
  Same as number of kept calls in $[0, t]$.

  Write as integral: $\lambda\int_{s=0}^t1-G(t-s)ds$,

  Substitution: $r = t - s, \Rightarrow \lambda\int_0^t 1-G(r)dr$,

  Write integral as probability: $\lambda\int_0^t\mathbb{P}(D>r)dr$.

In the long run ($t\rightarrow \infty$), $\lambda\int_0^t\mathbb{P}(D>r)dr = \lambda\mathbb{E}[D]$. Uses the condition that $D$ is nonnegative.

So in the long run, the number of calls in system is Poisson with parameter $\lambda\mathbb{E}[D]$.



### Age Residual Life

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec27.png" width="500px" />

Long run behavior of $Z$ ?

Define a Markov Chain as 
$$
M_n = \left\{\begin{aligned}
&R &\text{if $n$ renewal} \\
&Z_n &\text{else} 
\end{aligned}\right.
$$
The states of $M_n$ are $\{R, 1, 2, 3, ...\}$.

Let $\tau$ represents the **number of arrows** traversed.

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec27-2.png" width="500px" />

$p(i, i-1) = 1$ if $i\geq 1$.

$\mathbb{P}(\tau_i = j+1) = f_{j+1}$ for $j\geq 0$.

$p(R, j) = f_{j+1}$.

$p(R, R) = f_1$.

Idea: $\tau>0$, and the subscript of $f$ implies $\tau$ (how long it takesbetween two successive $R$).

To do: find stationary distribution for MC, and tell $Z(t)$ in the long run.



## Lec 28 Residual Life

**Theorem**

If MC is irreducible and recurrent, let $T_R = \min\{n\geq1:M_n = R\}$, then 
$$
\mu_R(y) = \sum_{n=0}^\infty\mathbb{P}_R(M_n=y, T_R>n)
$$
is a stationary measurement.
$$
\begin{aligned}
\mu_R(R) &= \sum_{n=0}^\infty\mathbb{P}_R(M_n = R, T_R>n) \\
&= \mathbb{P}_R(M_0 = R, T_R>0) + \mathbb{P}_R(M_1 = R, T_R>1) + ...\\
&= 1
\end{aligned}\\
\begin{aligned}
\mu_R(1) &= \sum_{n=0}^\infty\mathbb{P}_R(M_n = 1, T_R>n) \\
&= \mathbb{P}_R(M_0 = 1, T_R>0) + \mathbb{P}_R(M_1 = 1, T_R>1) + ...\\
&= 0 + f_2 + f_3 + ...\\
&= \mathbb{P}(\tau > 1)
\end{aligned}\\
\begin{aligned}
\mu_R(2) &= \sum_{n=0}^\infty\mathbb{P}_R(M_n = 2, T_R>n) \\
&= \mathbb{P}_R(M_0 = 2, T_R>0) + \mathbb{P}_R(M_1 = 2, T_R>1) + ...\\
&= 0 + f_3 + f_4 + ...\\
&= \mathbb{P}(\tau > 2)
\end{aligned}
$$
Thus we can conclude that $\mu_R(k) = \mathbb{P}(\tau > k)$.

- Is $\mu_R$ a stationary distribution? 
  Is total mass sum to 1? No. In general not.
- Rescale $\mu_R$ to be a stationary distribution:
  $\sum_{states~k}\mu_R(k) = \sum_{k=0}^\infty\mathbb{P}(\tau>k) = \sum_{k=1}^\infty\mathbb{P}(\tau\geq k) = \mathbb{E}(\tau)$.

Thus a stationary distribution will be (assuming $\mathbb{E}(\tau) < \infty$):
$$
\pi(k) = \frac{\mu_R(k)}{\mathbb{E}[\tau]}
$$
**Theorem**

If irreducible, aperiodic, and exists a stationary distribution, then $p^n(R, k)\rightarrow\pi(k)$ as $n\rightarrow\infty$.

**Theorem**

Suppose $\mathbb{E}[\tau]<\infty$ and $gcd\{n:f_n >0\} = 1$, then 
$$
\lim_{n\rightarrow\infty}\mathbb{P}(M_n = i) = \frac{\mathbb{P}[\tau>i]}{\mathbb{E}[\tau]} \\
\lim_{n\rightarrow\infty}\mathbb{P}(M_n = R) = \frac{1}{\mathbb{E}[\tau]}
$$
as defined above, $M_n \approx Z_n$

**Practice**

Particles arrive at a sensor as a Poisson process with rate $\lambda$. Sensor processes for $t$ seconds, during which time it cannot sense additional particles.

- What is the long run probability that sensor is processing at time $t$?

>  Alternating renewal process.

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec28.pdf" width="300px" />

By theorem, the long run proportion in a "closed" state (cannot sense particles) is
$$
\frac{c}{\mathbb{E}[A]+c}
$$
$\mathbb{P}(A\geq t) = \mathbb{P}(\tau\geq s+t|\tau\geq s) = \mathbb{P}(\tau\geq t)$, each $\tau$ can be viewed as an exponential distribution $\exp(\lambda)$.

Thus $A\sim \exp(\lambda)$ and $\mathbb{E}[A] = \frac{1}{\lambda}$. Taking back, the answer is 
$$
\frac{c}{\frac{1}{\lambda}+c}
$$

- Computer the limiting fraction of registered particles.
  In a window of width $c$, the number of arrivals is of $Poi(c\lambda)$,  and including the initial one which is being processed, the fraction is
  $$
  \frac{1}{\mathbb{E}[c\lambda]+1} = \frac{1}{c\lambda+1}
  $$
  



## Lec 29 Residual life general case

### Theorem

As $T\rightarrow \infty$, 
$$
\frac{1}{t}\int_0^t\bold{1}\{A_s>x, Z_s>y\}ds\rightarrow \frac{1}{\mathbb{E}(\tau_1)}\int_{x+y}^\infty\mathbb{P}(\tau_1>z)dz
$$
$\tau_1$ is the interrenewal time.

### Residual life limiting density

Set $x, y = 0$. Take derivative in $z$ of r.h.s gives
$$
g(z) = \frac{\mathbb{P}(\tau_1>z)}{\mathbb{E}(\tau_1)}.
$$
