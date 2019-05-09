# Chapter 2 Poisson Process

## Lec 17 Exponential Distribution

#### Definition

A random variable $T$ is said to have an exponential distribution with rate $\lambda$, writing $T \sim \exp(\lambda)$, if
$$
\mathbb{P}(T\leq t) = 1 - e^{-\lambda t}, ~~~~~t \geq 0
$$
In a function definition,
$$
f_T(t) = \left\{\begin{aligned} 
&\lambda e^{-\lambda t} &t\geq 0 \\
& 0  & t<0
\end{aligned}\right.
$$
Its expectation describes how fast the event is happening, *aka* **waiting time**.
$$
E[T] = \int_{-\infty}^\infty f_T(t)dt = \int_0^\infty e^{-\lambda t}dt = \frac{1}{\lambda}
$$
Its variance is $Var(T) = \frac{1}{\lambda^2}$.

Common models: line waiting, atomic decay.

####Property: memoryless

Let $T \sim \exp(\lambda)​$ then for any $s, t\geq  0​$, 
$$
\mathbb{P}(T>(s+t)|T>t) = \mathbb{P}(T>s)
$$

>*proof*
>$$
>\begin{aligned}
>\frac{\mathbb{P}(T>s+t\text{ and }T>t)}{\mathbb{P}(T>t)} &= \frac{\mathbb{P}(T>s+t)}{\mathbb{P}(T>t)} \\
>&= \frac{e^{-\lambda(s+t)}}{e^{-\lambda t}}\\
>&= e^{-\lambda s}\\
>&= \mathbb{P}(T>s)
>\end{aligned}
>$$
>

#### Property with independence

If $X_i \sim \exp(\lambda_i)​$, $i = 1, 2, … n​$ are all independent, then
$$
X_0 := \min_{1\leq i\leq n}\{X_i\}
$$
satisfies $X_0 \sim \exp(\lambda_0)​$ where $\lambda_0 = \sum_{i=1}^n\lambda_i​$.

> Independence means **multiplication**:
> $$
> \begin{aligned}
> \mathbb{P}(X_0>t) &= \mathbb{P}(X_1>t)\mathbb{P}(X_2>t) ... \mathbb{P}(X_n>t)\\
> &= \Pi_{i=1}^n\mathbb{P}(X_i>t) \\
> &= e^{-(\sum_{i=1}^n\lambda_i)t}\\
> \end{aligned}
> $$

For $i = 1, 2, …n$, let $X_i \sim \exp(\lambda_i)$ all independent and $I$ be the index of the smallest $X_I$ occurs.

In two-case, calculating probability of $\mathbb{P}(X_1 < X_2)​$ and vice versa, we can find
$$
\left\{\begin{aligned}
\mathbb{P}(I=1) = \frac{\lambda_1}{\lambda_1+\lambda_2}\\
\mathbb{P}(I=2) = \frac{\lambda_2}{\lambda_1+\lambda_2}
\end{aligned}\right.
$$
In the genergal case, $X_i < X_1, X_2, … X_{i-1}, X_{i+1}, …X_n$, and let
$$
X = \min\{X_1, X_2, … X_{i-1}, X_{i+1}, …X_n\}
$$
$X\sim \exp(\lambda_{in})\ $ where $\lambda_{in} = \lambda_0 - \lambda_i$. Then using the two-case formula, we have
$$
\mathbb{P}(I = X_i) = \frac{\lambda_i}{\lambda_i+\lambda_0-\lambda_i} = \frac{\lambda_i}{\lambda_0}
$$
**Discussion**

Suppose $T_1 \sim\exp(999)$,  $T_2\sim\exp(1)$ are independent, given $\min$ of $T_1$, $T_2$ are less than $\frac{1}{1000}$, is it more likely that $T_1$ occurs first than it would be if $\min$ were 2?

> *NO*.

**Fact**: for independent $T_i$, $V = \min_{1\leq j \leq n} T_j$, $I$ the coord of smallest $X_i$,
$$
\mathbb{P}(V>t, I=i) = \mathbb{P}(V>t)\mathbb{P}(I=i)
$$

> *proof*
>
> Let $y\sim \exp(\sum_{j\neq i}\lambda_j)$, $x \sim \exp(\lambda_i)$, and let $B_i$ denote $\sum_{j\neq i}\lambda_j$. Thus $B_i + \lambda_i = \lambda_0$.
> $$
> \begin{aligned}
> \mathbb{P}(\min_{j\neq i} T_j\geq T_i\geq t) &= \mathbb{P}(y\geq T_i>t) \\
> &= \int_{y=t}^\infty\int_{x=t}^yB_ie^{-B_iy}\lambda_ie^{-\lambda_ix}dxdy\\
> &= \int_{y=t}^\infty B_ie^{-B_iy} \left(\int_{x=t}^y\lambda_ie^{-\lambda_ix}dx\right)dy\\
> &= \int_{y=t}^\infty B_ie^{-B_iy} \left( e^{-\lambda_it} - e^{-\lambda_iy}\right)dy\\
> &=  e^{-\lambda_it}\cdot e^{-B_it} - \frac{B_i}{\lambda_0}e^{-\lambda_0t}\\
> &= \frac{\lambda_i}{\lambda_0}e^{-\lambda_0t}\\
> &= \mathbb{P}(I=i)\mathbb{P}(V>t)
> \end{aligned}
> $$



## Lec 18 Poisson Process

**Theorem**

Let $\tau_1$, $\tau_2$, … $\tau_n$ be independent $\exp(\lambda)$. Let $T_n = \tau_1 + \tau_2 + … + \tau_n$, then $T_n \sim gamma(n, \lambda)$.

- Is $T_n$ discrete or continuous?

  > It is *continous*. The distribution satisfies
  > $$
  > f_{T_n}(t) = \left\{
  > \begin{aligned}
  > &\lambda e^{-\lambda t}\frac{(\lambda t)^{n-1}}{(n-1)!}& t\geq 0\\
  > &0 & t < 0
  > \end{aligned}\right.
  > $$

### Poisson process

Let $\tau_1​$, $\tau_2​$, … be independent $\exp(\lambda)​$ random variables. Let 
$$
T_n = \tau_1 + \tau_2 + … + \tau_n
$$
and let 
$$
N(s) = \max\{n: T_n < s\}
$$
$N(s)​$ is a poisson  process with rate $\lambda​$.

- $N(s)$ is discrete, because $n$ can only take integers.

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec18.png" width="600px" />

### Poisson Random Variable

A poisson random variable $X$ for $\lambda > 0$, $n\geq 0$, satisfies
$$
\mathbb{P}(X=n) = e^{-\lambda}\frac{\lambda^n}{n!}
$$
And its expectation is 
$$
\begin{aligned}
E(X) &= \sum_{n=0}^\infty n\mathbb{P}(X=n) \\
&= \sum_{n=0}^\infty n e^{-\lambda}\frac{\lambda^n}{n!} & 0\times0! = 0\times1 = 0\\
&= e^{-\lambda}\lambda\sum_{n=1}^\infty\frac{\lambda^{n-1}}{(n-1)!} &e^\lambda = 1 + \lambda + \frac{\lambda^2}{2!} + ... \\
&= e^{-\lambda}\lambda e^{\lambda} \\
&= \lambda
\end{aligned}
$$
**Theorem 1**

$N(s)​$ is a Poisson random variable with parameter $\lambda s​$.

> *proof*
> $$
> \begin{aligned}
> \mathbb{P}(N(s) = n) &= \mathbb{P}(T_n \leq s < T_{n+1})\\
> &= \mathbb{P}(T_n\leq s, T_{n+1}>s) \\
> &= \mathbb{P}(T_n\leq s, \tau_{n+1}>s-T_n)
> \end{aligned}
> $$
> <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec18-3.png" width="400px" />
>
> Although $T_n$ and $\tau_{n+1}$  are independent, the time of $\tau_{n+1}$ depends on $T_n$, so we cannot simply multiply their probabilities directly. Instead, we can use double integration on the probability density at each point:
>
> <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec18-2.png" width="300px" />
> $$
> \begin{aligned}
> \mathbb{P}(N(s) = n) &= \mathbb{P}(T_n\leq s, \tau_{n+1}>s-T_n) \\
> &= \int_{t=0}^s\int_{r=s-t}^\infty \lambda e^{-\lambda t}\frac{(\lambda t)^{n-1}}{(n-1)!}\lambda e^{-\lambda r}drdt \\
> &= \frac{\lambda^{n}}{(n-1)!}\int_{t=0}^s e^{-\lambda t} t^{n-1}e^{-\lambda (s-t)}dt \\
> &= \frac{\lambda^{n}}{(n-1)!}\int_{t=0}^s t^{n-1}e^{-\lambda s}dt \\
> &= \frac{\lambda^{n}e^{-\lambda s}}{(n-1)!}\int_{t=0}^s t^{n-1}dt \\
> &= \frac{(\lambda s)^n}{n!}e^{-\lambda  s}
> \end{aligned}
> $$
> Therefore, this is a Poisson distribution.
>
> Intuitively, this can be understood as the probability of number of events occurred up to time $s$. 

**Lemma**

$N(t+s) - N(s)$ for $t\geq 0$ is a rate $\lambda$  Poisson process and is independent of $N(r)$, $0\leq r\leq s$.

> proof idea: get back to $\tau$'s, use the memoryless property.

**Corollary**

$N(t)$ has independent  increments, i.e., $t_0 < t_1 < … < t_n$ then $N(t_1)-N(t_0)$, $N(t_2)-N(t_1)$… $N(t_n)-N(t_n-1)$ are independent. 

Each is a Poisson distribution, $Poi[(t_i - t_{i-1})\lambda]$.

###Theorem: determination of a Poisson  process

If $\{N(s), s\geq 0\}​$ is a Poisson process, then

1. $N(0) = 0$
2. $N(t+s) - N(s) \sim \lambda t$
3. $N(t)$ has independent increments

Conversely if (1) (2) (3) then $\{N(s), s\geq 0\}$ is a Poisson process with rate $\lambda$.



## Let 19 Nonhomogeneous Poisson Process

**Definition**

$\{N(s), s\geq 0\}​$ is a Poisson process with rate $\lambda(r)​$ if

1. $N(0) = 0​$
2. $N(t)​$ has independent increments
3. $N(t)-N(s)​$ is Poisson with param $\int_s^t\lambda(r)dr​$.

**Example 1**

Frogs arrive at pond with rate $3/h$.

1. What's the probability of no frogs come in 1 hour?
2. What's the probability of seeing 12 or fewer frogs in 5 hours?

> In this case, $\lambda(r) = 3$ is constant. 
>
> 1. $N(1) - N(0) \sim Poi(3)​$.
>    $\mathbb{P}(N(1)=0) = e^{-3}\frac{3^0}{0!} = e^{-3} \approx 0.04978​$
>
> 2. $N(5) - N(0) \sim Poi(3\times5) = Poi(15)$.
>
>    $\mathbb{P}(N(5)\leq 12) = \sum_{k=0}^{12} e^{-15}\frac{15^k}{k!}\approx 0.2676​$.

**Example 2**

New rate: $\lambda(t) = 3+\sin\frac{t}{4}​$.

> 1. The param for $N(1) - N(0)​$ is $\alpha = \int_0^1\left(3+\sin(\frac{1}{4})\right)dt = 7 - 4\cos\frac{1}{4}​$.
>    $\mathbb{P}(N(1) = 0) = e^{-\alpha} \approx 0.044​$.
> 2. The param for $N(5) - N(0)$ is $\alpha = \int_0^5\left(3+\sin(\frac{1}{4})\right)dt = 19 - 4\cos\frac{5}{4}$.
>    $\mathbb{P}(N(5) \leq 12) = e^{-\alpha} \approx 0.1017$.

### Compound Poisson Process

Embellish Poisson process by associating an independent and identically distributed (i.i.d.) random variable $y_i$ with each arrival. For example, the poissom process may be the time a car passes a street. and $y_i$ is the number of people in car. Let
$$
s(t) = y_1+y_2+...+y_{N(t)}
$$
where $N(t)$ is the number of arrivals up to time $t$. If $N(t)=0$, $s(t) = 0$.

**Theorem**

let $y_1$, $y_2$, … be independent, identically distribution. Let $N$ be independent of $\{y_i\}$, a nonnegative integer random variable. Let $S = y_1+y_2+…+y_N$.

1. If $\mathbb{E}(|y_i|)<\infty$, $\mathbb{E}(N)<\infty$ then $\mathbb{E}(S)=\mathbb{E}(N)\mathbb{E}(Y)$.

   > *proof*
   > $$
   > \begin{aligned}
   > \mathbb{E}(S) &= \sum_{n=0}^\infty\mathbb{E}(S|N=n)\mathbb{P}(N=n) & \text{this actually excludes the $N=\infty$ case}\\
   > &= \sum_{n=0}^\infty n\mathbb{E}(Y)\mathbb{P}(N=n) &\text{this is because $N$ and $Y$ are independent}\\
   > &= \mathbb{E}(Y)\mathbb{E}(N)
   > \end{aligned}
   > $$
   > 

2. If $\mathbb{E}(y_i^2)<\infty$, $\mathbb{E}(N^2)<\infty$ then $Var (S) = \mathbb{E}(N)Var (Y)+ Var(N)\mathbb{E}^2(Y)$.

   > $$
   > \begin{aligned}
   > Var S &= \mathbb{E}(S^2) - \mathbb{E}^2(S)\\
   > \mathbb{E}(S^2)&= \sum_{n=0}^\infty \mathbb{E}(S^2|N=n)\mathbb{P}(N=n) \\
   > &= \sum_{n=0}^\infty\left[Var(y_1+y_2+...+y_N) + \mathbb{E}(y_1+...+y_N)^2\right]\mathbb{P}(N=n) \\
   > &= \sum_{n=0}^\infty nVar(Y)\mathbb{P}(N=n) + \sum_{n=0}^\infty n^2\mathbb{E}^2(Y) \mathbb{P}(N=n)\\
   > &= \sum_{n=0}^\infty nVar(Y)\mathbb{P}(N=n) + \mathbb{E}^2(Y) \mathbb{E}(N^2)\\
   > \therefore VarS &= \mathbb{E}(N)Var (Y) + \mathbb{E}^2(Y) \mathbb{E}(N^2) - \mathbb{E}^2(Y) \mathbb{E}^2(N)\\
   > &= \mathbb{E}(N)Var (Y) + \mathbb{E}^2(Y) [VarS + \mathbb{E}^2(N)]- \mathbb{E}^2(Y) \mathbb{E}^2(N) \\
   > &= \mathbb{E}(N)Var (Y) + \mathbb{E}(Y)Var (N)
   > \end{aligned}
   > $$
   >
   > 

3. If $N$ is a Poisson process with rate $\lambda$, $Var S = \lambda\mathbb{E}(Y^2)$.



## Lec 20

$$
S = y_1 + ...  + y_{N(t)}
$$

**Example**

People arrive at store with rate 81 per day and spend on average with \$8 with standard  deviation \$6. Find average and standard deiation for daily revenue.

> $N(t)​$ is a Poisson process with rate 81.
>
> $\mathbb{E}(S) =  \mathbb{E}(N)\mathbb{E}(Y) = 81\times 8 = 648​$
>
> $Var S = \mathbb{E}(N)Var Y + Var N[\mathbb{E}(Y)]^2  = 81\times(36+64) = 8100$, standard deviation is 90.

How to heuristically understand this formula?

If $N​$ is constant, there are fixed number of arrivals, which are identically indepedent distribution, 
$$
S= y_1 + …+ y_N
$$
and the variance is sum of  all  individual's variance. So the first term represents variance of $Y$s.

If  $y$ is  constant, each arrival has  fixed amount,
$$
S =  yN
$$
so the variance $Var S = y^2 Var N$.  The second  term is  variance of $N$.

### Thinning

**Idea**

Each arrival comes with a random variable $Y_i​$, which is a  *type*.

$ y\in \{1, 2, …\}$.

Using $N_j​$ represents $j​$ type, then $N_j(t)  = \sum_{i=1}^{N(t)}\textbf{1}\{y_i =  j\}​$.

$\sum_{j=1}^{\infty}N_j(t)  = N(t)$.

$\mathbb{E}[N_j(t)]= \mathbb{E}[N(t)]\mathbb{P}(y_i  = j) = \lambda_t\mathbb{P}(y_i = j)$.

**Theorem**

$N_j(t)$ are independent of each other, and are Poisson process with rate $\lambda\mathbb{P}(y_i = j)$.

**Example**

Suppose for the following case, 
$$
y_i = \left\{\begin{aligned}
14~~ \text{   with probability } \frac{1}{2}\\
2~~ \text{   with probability } \frac{1}{2}\\
\end{aligned}\right.
$$

> $\mathbb{E}[N_{14}(t)|N_2(t) = 0)] = \mathbb{E}[N_{14}(t) ]= 81\times \frac{1}{2}t$
>
> This is because The two events are independent.

**Proof of  the  theorem**

Assume there are 2 types, 1 & 2 with probabilities $\mathbb{P}(y_i  =  1)  = p​$ and $\mathbb{P}(y_i = 2) = 1-p​$.

> **Using the second definition to prove:**
>
> $\{N(s), s\geq 0\}$ is a Poisson process with rate $\lambda(r)$ if
>
> 1. $N(0) = 0​$
> 2. $N(t)​$ has independent increments
> 3. $N(t)-N(s)$ is Poisson with param $\int_s^t\lambda(r)dr$.

Check the definition of process.

1. $N(0) = N_1(0) + N_2(0) =  0$. So $N_1(0) = N_2(0)  = 0$.

2. Check increments: pick $t_2 > t_1 > t_0$.
   $N_1(t_2) - N_1(t_1) = \sum_{i=1}^{N(t_2)}\textbf{1}\{y_i = 1\} - \sum_{i=1}^{N(t_1)}\textbf{1}\{y_i = 1\}$
   $N_1(t_1) - N_1(t_0) = \sum_{i=N(t_0)+1}^{N(t_1)}\textbf{1}\{y_i = 1\}$
   The two terms have  disjoint indices, and the number of  terms in each  sum are independent.
   Therefore the two  terms are independent. Similary for $N_2​$.

3. For the  third condition,  
   $$
   \begin{aligned}
   \mathbb{P}(N_1(t)=j, N_2(t)=k) &= \mathbb{P}(N(t)=j+k, N_2(t)=k) \\
   & = \mathbb{P}(N_2(t)=k|N(t)=j+k)\cdot \mathbb{P}(N(t)=j+k) \\
   & = \binom{j+k}{j}p^j(1-p)^k\cdot e^{-\lambda t}\frac{(\lambda t)^{j+k}}{(j+k)!}\\
   & = (\lambda t)^j\frac{p^j}{j!}e^{-\lambda (1-p+p)t}  (\lambda t)^k\frac{(1-p)^k}{k!}\\
   &= (\lambda t)^j\frac{p^j}{j!}e^{-\lambda pt}  (\lambda t)^k\frac{(1-p)^k}{k!}e^{-\lambda (1-p)t}\\
   &=\mathbb{P}(Poi(\lambda pt)  = j)\mathbb{P}(Poi(\lambda(1-p)t)  =k)
   \end{aligned}
   $$
   Sum over $k  = 0,1, … \infty$, we can get the probability of $N_1(t)$ as
   $$
   \mathbb{P}(N_1(t_1=  j)) = e^{-\lambda tp} \frac{(\lambda tp)^j}{j!}
   $$
   Therefore $N_1(t) \sim Poi(\lambda pt)$. Fomr the production we also acquire the independence of $N_1(t)$ and $N_2(t)$.

**Theorem**

We can also thin to  get a new Poisson process with probability $p(s)$ for an arrival at time $s$. This is non-homogeneous Poisson process with rate $\lambda p(s)$.



## Lec 21

### Superposition

Combine independent Poisson process.

**Theorem**

Suppose $N_1(t), … N_k(t)​$ are independent  Poisson process with  rate $\lambda_1, \lambda_2, … \lambda_k​$, then

$N(t) = N_1(t)  + … + N_k(t)$ is a Poisson process with rate $\lambda_1 + … + \lambda_k$.

**Proof**

> Back to definition, there are  two choices:
>
> 1. in terms of  **wait time**: 
>    Let $\tau_1$, $\tau_2$, … be independent $\exp(\lambda)$ random variables. Let 
>    $$
>    T_n = \tau_1 + \tau_2 + … + \tau_n
>    $$
>    and let 
>    $$
>    N(s) = \max\{n: T_n < s\}
>    $$
>    $N(s)$ is a poisson  process with rate $\lambda$.
>
> 2. in  terms of **increments** of $N$:
>    $\{N(s), s\geq 0\}$ is a Poisson process with rate $\lambda(r)$ if
>
>    1. $N(0) = 0$
>    2. $N(t)$ has independent increments
>    3. $N(t)-N(s)$ is Poisson with param $\int_s^t\lambda(r)dr$.

In this proof, we choose  the second definition for proof of this theorem.

1. $N(0) = 0$?
   This is a natural result from $N_1(0) +N_2(0) + … +N_k(0) = 0 + 0 + … + 0 = 0$.
2. Independent increments?
   $N(t_1) - N(t_0) = (N_1(t_1) - N_1(t_0) )+ … + (N_k(t_1) - N_k(t_0))$,
   $N(t_2) - N(t_1) = (N_1(t_2) - N_1(t_1)) + … + (N_k(t_2) - N_k(t_1))$.
   Since increments on RHS are independent, LHS are independent.
3. $N(t_1) - N(t_0)​$ is Poisson distribution?
   This results from  the  fact that sum of indepedent Poisson is  Poisson.

**Example**

Ducks arrive as Poisson process at rate $\lambda_1​$ (in a unit time, expectation \# dcuks seen is $\lambda_1​$), herons  arrive as  Poisson process a t rate  $\lambda_2​$. Bird process is the superposition of the two, $Poi(\lambda_1 + \lambda_2)​$. The expectation of 
$$
\mathbb{E}(\text{wait time for first bird}) =\mathbb{E}[\tau_1] = \frac{1}{\lambda_1+\lambda_2}
$$
Since events are independent,
$$
\mathbb{E}(\text{wait time for first heron  after 10th bird}) = \frac{1}{\lambda_2}
$$

> To derive this, note there are  two possible cases:
>
> 1. 10th arrival is duck
> 2. 10th arrival is heron
>    <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec21.png" width="300px" />
>
> $$
> \begin{aligned}
> &\mathbb{E}[\exp(\lambda_2)\cdot\mathbb{P}(10th\text{ is heron})] + \mathbb{E}[\mathbb{E}(\tau_H + H - T_{10}|\tau_H > T_0-H)\cdot\mathbb{P}(10th\text{ is duck})]\\
> = &\mathbb{E}[\exp(\lambda_2)\cdot\mathbb{P}(10th\text{ is heron})] + \mathbb{E}[\mathbb{E}(\tau_H + H - T_{10}|\tau_H + H > T_{10})\cdot\mathbb{P}(10th\text{ is duck})]\\
> =&\frac{1}{\lambda_2}p + \frac{1}{\lambda_2}(1-p)\\
> =& \frac{1}{\lambda_2}
> \end{aligned}
> $$

### Conditioning

Given that $N(t_0)  = n$, what  can we say abouut the distribution of points of arrivals?

Case $n = 1$, for  a  position $0<s<t_0$,
$$
\begin{aligned}
\mathbb{P}(\tau_1>s|N(t_0)=1) &= \mathbb{P}(N(s)=0|N(t_0)=1)\\
&=\frac{\mathbb{P}(N(s)=0, N(t_0)=1)}{\mathbb{P}(N(t_0)=1)}\\
&= \frac{\mathbb{P}(N(s)-N(0)=0, N(t_0)-N(s)=1)}{\mathbb{P}(N(t_0)-N(0)=1)}
\end{aligned}
$$
The reason for this transformation is because we know that $N(s)-N(0)$ and $N(t_0)-N(s)$ are  independent, and as for the denominator, we can only subtract by $N(0)$ because  in the denominator's case, we only know $N(0)=0$ in general. To continue from above, 
$$
\begin{aligned}
\mathbb{P}(\tau_1>s|N(t_0)=1) &= \frac{\mathbb{P}(N(s)-N(0)=0, N(t_0)-N(s)=1)}{\mathbb{P}(N(t_0)-N(0)=1)}\\
&= \frac{\mathbb{P}(N(s)-N(0)=0)\mathbb{P}(N(t_0)-N(s)=1)}{\mathbb{P}(N(t_0)-N(0)=1)}\\
&=\frac{e^{-s\lambda}e^{-(t_0-s)\lambda}(t_0-s)\lambda}{e^{-t_0\lambda}t_0\lambda}\\
&=\frac{t_0-s}{t_0}
\end{aligned}
$$
Therefore, $\mathbb{P}(\tau_1\leq s|N(t_0)=1) = \frac{s}{t_0}$. It is a uniform distribution with density $\frac{1}{t_0}$. The point  is uniform on $[0, t_0]$.

**Theorem**

If  $s<t$ and  $0\leq m < n$, then
$$
\mathbb{P}(N(s)=m|N(t)=n) = \binom{n}{m}\left(\frac{s}{t}\right)^m\left(\frac{t-s}{t}\right)^{n-m}
$$
*proof*: all $n$ points are uniform in $[0, t]$.

Therefore, the distribution is **binomial** when **conditioning on Poisson**.



## Lec 22

### Poisson process in 2-dimension

<img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec22.png" width="300px" />

**Example 1**

Rain drops hit a sidewalk as a 2-dimension Poisson process rate $\lambda​$. Let $N(R_i) = \#rain drops​$ in region $R_i​$. Since $R_i​$ are disjoint, the events are independent.

> 1-D case: scale with distance, linear
>
> 2-D case: scale with area: $\lambda\cdot Area(R_i)​$

Say $R_i$ are circles with radii 1 and 2 respectively, which means $Poi(4\lambda\pi)$ and $Poi(\lambda\pi)$.
$$
\begin{aligned}
\mathbb{P}[N(R_2)\geq4, N(R_1)<2] &= \mathbb{P}[N(R_2\geq 4)]\cdot \mathbb{P}[N(R_1)<2] \\
&= \sum_{k=4}^\infty e^{-4\lambda\pi}\frac{(4\lambda\pi)^k}{k!} \sum_{m=0}^1 e^{-\lambda\pi}\frac{(\lambda\pi)^m}{m!}\\
\end{aligned}
$$
**Example 2**

Traffic on a road passes as a Poisson process with rate 2 vehicles per min. $20\%$ are trucks and $80\%$ are cars.

- Find probability that there are 1 truck or more in an hour.
  $$
  0.2\times2 = 0.4\\
  0.4\times 60 = 24
  $$
  Expected: 24 on average.
  $$
  \begin{aligned}
  P &= 1 - \mathbb{P}[N_T(60)=0] \\
  &=1 - e^{-24}\cdot\frac{24^0}{0!} \\
  &= 1 - e^{-24}
  \end{aligned}
  $$

- Given 10 trucks in an hour, find the expected number of vehicles in that hour.
  Known: $N_T(60) = 10$.
  Need to find $N_C(60)$.
  First note that the two events are independent, therefore, the condition on expectation $\mathbb{E}[N_C(60)|N_T(60)=10]$ is useless.
  $$
  \begin{aligned}
  \mathbb{E}[N_C(60)+N_T(60)|N_T(60)=10] &= \mathbb{E}[N_C(60)] + 10\\
  &= 24\times4 + 10\\
  &= 106
  \end{aligned}
  $$

- Given 50 vehicles in an hour. What is the probabiliity of getting 45 cars and 5 trucks?
  With total number known, it becomes a binomial probalem.
  $$
  \begin{aligned}
  \mathbb{P}[N_C(60)=45|N_C(60)+N_T(60)=50] &= \frac{\mathbb{P}[N_C(60)=45, N_T(60)=5]}{\mathbb{P}[N_C(60)+N_T(60)=50]} \\
  &= \frac{\mathbb{P}[N_C(60)=45]\mathbb{P}[N_T(60)=5]}{\mathbb{P}[N_C(60)+N_T(60)=50]} \\
  &= \binom{50}{5}0.2^50.8^{45}
  \end{aligned}
  $$



## Let 23

**Example 1**

A flashlight takes 2 batteries. Each batter has exponential lifetime with average 100 h.

$B_1\sim \exp(-t/100)$,

$B_2\sim \exp(-t/100)​$.

Let $A$ denotes **life** of the flashlight, $A = \min\{B_1, B_2\} \sim \exp(-t/50)$.

- If we have 50 batteries, how long does the flashlight run on average (replace a bad with new if necessary)?
  <img src="/Users/kelly/Desktop/2019_Spring/Math 632/pic/lec23.png" width="300px" />
  $A_2 = ​$ **life** of flashlight after replacing one battery, life time of each battery is $A_1 +​$ exponential given it survived to time $A_1​$ already (memoryless property). It is still exponential with average 100 hours, and $A_2 \sim \exp(1/50)​$.
  $A_3​$ … so on.

  WIth 50 batteries, the total time flashlight works is $A_1 + A_2 + … + A_{49}$ (since there are 49 replacements). This is [gamma distribution](<https://en.wikipedia.org/wiki/Gamma_distribution>). 

  > **Gamma distribution**
  > $$
  > X \sim \Gamma(\alpha, \beta) \equiv \operatorname{Gamma}(\alpha, \beta)
  > $$
  > where $\alpha$ is the shape parameter and $\beta$ is the rate parameter.
  >
  > The density of a gamma distribution is
  > $$
  > f(\alpha, \lambda) = \lambda e^{-\lambda t}\frac{(\lambda t)^{\alpha-1}}{(\alpha-1)!}
  > $$

  In our case, it is $\text{Gamma}(49, \lambda)$ where $\lambda = 1/50$.
  $$
  \begin{aligned}
  \mathbb{E}\left[\lambda e^{-\lambda t}\frac{(\lambda t)^{48}}{48!}\right] &= \int_0^\infty e^{-\lambda t}\frac{(\lambda t)^{49}}{48!} dt\\
  &= \frac{49}{\lambda}\int_0^\infty \lambda e^{-\lambda t}\frac{(\lambda t)^{49}}{49!}dt \\
  &= \frac{49}{\lambda} \\
  &= 49\times50
  \end{aligned}
  $$

- Number the batteries 1, 2, 3, … 50 and always put in the smallest battery when necessary.

  Let $N​$ be the number of last battery working. Find the distribution of $N​$.
  From back to the front,
  $\mathbb{P}(N=50) = 1/2​$, this is because at last the batteries are one from 1-49 and 50.
  Similarly, $\mathbb{P}(N=49) = 1/2\times1/2 = 1/4​$.
  ...
  $\mathbb{P}(N=2) = 1/2^{49}​$,
  $\mathbb{P}(N=1) = 1/2^{49}​$.
  To check its a distribution, simply notice that its sum is 1.



**Example 2**

Let $N(t)$ be a Poisson process with rate 2.

- $\mathbb{P}[N(3) = 4|N(1) = 1] = \mathbb{P}[N(3) -N(1) = 3|N(1) = 1] = \mathbb{P}[N(3) -N(1) = 3] = e^{-4}\frac{4^3}{3!} ​$.
- $\mathbb{P}[N(1) = 1|N(3) = 4] = \frac{\mathbb{P}[N(1) = 1, N(3) = 4] }{\mathbb{P}[N(3) = 4]} = \frac{4!}{3!1!}\left(\frac{2}{3}\right)^3\frac{1}{3}$.











