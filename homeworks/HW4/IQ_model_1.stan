data {
  int<lower=0> n;
  array[n] int<lower=0> y;
}

parameters {
  real<lower=0> mu;
  real<lower=0> sigma;
}

model {
  mu ~ normal(100, sigma);  // Prior for μ with mean 100 and variance σ²/κ0
  sigma ~ gamma(15, 1);  // Prior for σ with shape a=15 and rate b=1

  y ~ double_exponential(mu, sigma);  // Likelihood
}

generated quantities {
    int<lower=0, upper=1> mu_gt_100 = mu > 100;
}