library(cmdstanr)
library(tidyverse)
library(ggplot2)
library(tibble)
# compile stan model. This may take a minute.
stan_model <- cmdstan_model(stan_file="normal.stan")
# data is a list, arguments must match the
## arguments in data block of the stan file
n = 100
y = rnorm(n, 2,0.5)
stan_fit <- stan_model$sample(data=list(N=n, y=y, k0=0.1),
                              refresh=0)
stan_fit$summary()

samples <- stan_fit$draws(format="df")

mu_samples <- samples$mu
sigma_samples <- samples$sigma
## By default there will be 4000 samples
length(mu_samples)

tibble(Mean = mu_samples, Precision=1/sigma_samples^2) %>%
    ggplot() +
    geom_point(aes(x=Mean, y=Precision)) +
    theme_bw(base_size=16)
