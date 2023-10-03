data {
  int<lower=0> N; // Number of observations
  array[N] int<lower=0> y; // Observed data (counts)
  real<lower=0> alpha; // Gamma shape parameter
  real<lower=0> beta; // Gamma rate parameter
}

parameters {
  real<lower=0> lambda; // Poisson parameter
}

model {
  lambda ~ gamma(alpha, beta); // Prior distribution for lambda
  y ~ poisson(lambda);
}

generated quantities {
  int<lower = 0> y_tilde = poisson_rng(lambda);
}
