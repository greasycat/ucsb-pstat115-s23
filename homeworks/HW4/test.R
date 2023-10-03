score <- c(4, 7, 3, 2, 3)
n <- length(score)
stan_model <- cmdstan_model(stan_file=paste(getwd(),"/poigamma11.stan", sep=""))
women_cup_fit <- stan_model$sample(data=list(N=n, y=score),
                                   refresh=0)

samples <- women_cup_fit$draws(format = "df")
theoretical <- data.frame(lambda = rgamma(8000, 1+sum(score), 1+n))

# Create histogram
ggplot(samples, aes(x = lambda)) +  
    geom_histogram(aes(y = ..density..), color = "black", alpha = .2, fill = "lightblue", bins = 30) +
    geom_density(data = theoretical, aes(x = lambda)) +
    xlab("Lambda") + 
    ylab("Frequency") + 
    ggtitle("Histogram of lambda samples") 
