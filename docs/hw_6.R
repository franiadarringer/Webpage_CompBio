# hw 6
# frania darringer, 2/19

library(deSolve)
library(ggplot2)
library(viridis)

run_sir_model <- function(
  beta    = 0.1,
  gamma   = 0.1,
  N       = 1000,
  S0      = 999,
  I0      = 1,
  R0      = 0,
  t_start = 0,
  t_end   = 160,
  dt      = 1
){

  init  <- c(S = S0, I = I0, R = R0)
  times <- seq(t_start, t_end, by = dt)

  sir_equations <- function(time, state, parameters) {
    with(as.list(c(state, parameters)), {
      dS <- -beta * S * I / N
      dI <-  beta * S * I / N - gamma * I
      dR <-  gamma * I
      list(c(dS, dI, dR))
    })
  }

  out <- ode(
    y     = init,
    times = times,
    func  = sir_equations,
    parms = c(beta = beta, gamma = gamma, N = N)
  )

  as.data.frame(out)
} 

parameter_sweep_sir <- function(beta_vec, gamma_vec) {

  total_runs <- length(beta_vec) * length(gamma_vec)

  results_df <- data.frame(
    beta = numeric(total_runs),
    gamma = numeric(total_runs),
    max_infected = numeric(total_runs)
  )

  counter <- 1

  for (b in beta_vec) {
    for (g in gamma_vec) {

      sim <- run_sir_model(beta = b, gamma = g)

      max_I <- max(sim$I)

      results_df$beta[counter] <- b
      results_df$gamma[counter] <- g
      results_df$max_infected[counter] <- max_I

      counter <- counter + 1
    }
  }

  return(results_df)
}

plot_sir_heatmap <- function(results_df) {

  ggplot(results_df, aes(x = beta, y = gamma, fill = max_infected)) +
    geom_tile() +
    scale_fill_viridis(option = "magma") +
    labs(
      title = "sir param model sweep",
      x = expression(beta),
      y = expression(gamma),
      fill = "max infected"
    ) +
    theme_minimal()
}

beta_vec  <- seq(0, 0.5, by = 0.01)
gamma_vec <- seq(0, 0.5, by = 0.01)

sir_results <- parameter_sweep_sir(beta_vec, gamma_vec)

plot_sir_heatmap(sir_results)
