# frania darringer hw 13

library(tidyverse)
library(lme4)
library(lmerTest)
library(gapminder)
library(ggeffects)
library(MASS)

data("gapminder")

gap <- gapminder %>%
  mutate(
    country = factor(country),
    continent = factor(continent),
    year_centered = year - mean(year)
  )

# Q1
mod1 <- lmer(lifeExp ~ year_centered * continent + (1 | country), data = gap)

summary(mod1)

anova(mod1)

pred1 <- ggpredict(mod1, terms = c("year_centered [all]", "continent"))
pred1_df <- as.data.frame(pred1)

ggplot(pred1_df, aes(x = x + mean(gap$year), y = predicted, color = group, fill = group)) +
  geom_line(linewidth = 1) +
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = 0.15, color = NA) +
  labs(
    title = "predicted change in life expectancy over time by continent",
    x = "yr",
    y = "predicted life expectancy",
    color = "continent",
    fill = "continent"
  ) +
  theme_minimal()

# Q2
mod2 <- glmer.nb(pop ~ year_centered * continent + (1 | country), data = gap)

summary(mod2)

mod2_no_interaction <- glmer.nb(pop ~ year_centered + continent + (1 | country), data = gap)

anova(mod2_no_interaction, mod2)

pred2 <- ggpredict(mod2, terms = c("year_centered [all]", "continent"))
pred2_df <- as.data.frame(pred2)

ggplot(pred2_df, aes(x = x + mean(gap$year), y = predicted, color = group, fill = group)) +
  geom_line(linewidth = 1) +
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = 0.15, color = NA) +
  labs(
    title = "predicted population change over time by continent",
    x = "yr",
    y = "predicted population",
    color = "continent",
    fill = "continent"
  ) +
  theme_minimal()

