data {
  int<lower=0> n1;
  int<lower=0> n2;
  array[n1] int<lower=0> y1;
  array[n2] int<lower=0> y2;
  
}

parameters {
  real<lower=0> mu1;
  real<lower=0> sigma1;
  real<lower=0> mu2;
  real<lower=0> sigma2;
}

model {
  sigma1 ~ uniform(0, 1000);  
  mu1 ~ uniform(0,2000);  
  sigma2 ~ uniform(0, 1000);  
  mu2 ~ uniform(0,2000);  
  
  y1 ~ normal(mu1, sigma1)
  y2 ~ normal(mu2, sigma2)
}
