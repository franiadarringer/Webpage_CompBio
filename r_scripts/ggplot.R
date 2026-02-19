# learning the basics of ggplot2
# frania darringer 2/19

library(ggplot2)
library(ggthemes)
library(patchwork)

# install data
d <- mpg

# histogram
ggplot(data = d) +
  aes(x = hwy) +
  geom_histogram()

# histogram but change colors
ggplot(data = d) +
  aes(x = hwy) +
  geom_histogram(fill = "slateblue", color = "black")

# density plot
ggplot(data = d) +
  aes(x = hwy) +
  geom_density(fill = "slateblue", color = "black")

# scatter plot
ggplot(data = d) +
  aes(x = displ, y = hwy) +
  geom_point() +
  geom_smooth() + # adds line of best fit
  geom_smooth(method = "lm", col = "red") # adds lin reg

# box plot
ggplot(data = d) +
  aes(x = fl, y = cty) +
  geom_boxplot(fill = "lightpink", color = "darkblue")

# basic barplot
ggplot(data = d) +
  aes(x = fl) +
  geom_bar()

# barplot with y response
x_treatment <- c("control", "low", "high")
y_response <- c(12, 2.5, 22)
summary_data <- data.frame(x_treatment, y_response)

ggplot(data = summary_data) +
  aes(x = x_treatment, y = y_response) +
  geom_col(fill = c("lightpink", "goldenrod", "darkorange"), color = "black")

# plotting a line or a curve
my_vec <- seq(1,100, by = 0.1)
d_frame <- data.frame(x = my_vec, y = sin(my_vec))

ggplot(data = d_frame) +
  aes (x = x, y = y) +
  geom_line()

d_frame_2 <- data.frame(x = my_vec, y = dgamma(my_vec, shape = 5, scale = 3))

ggplot(data = d_frame_2) +
  aes (x = x, y = y) +
  geom_line()

# themes and fonts
p1 <- ggplot(data = d, mapping = aes(x = displ, y = cty))+
  geom_point() 

p1 + theme_classic() # publication ready !
p1 + theme_minimal()
p1 + theme_linedraw()
p1 + theme_dark()
p1 + theme_base()
p1 + theme_void()

# font size and type
p1 + theme_classic(base_size = 30, base_family = "serif")
p1 + theme_classic(base_size = 30, base_family = "chalkduster")

# coordinate flipping in ggplot
p2 <- ggplot(data = d, mapping = aes(x = fl, fill = fl)) + 
  geom_bar()

p2 + coord_flip() +
  theme_grey(base_size = 20, base_family = "sans")

# setting x and y limits
p1 <- ggplot(data = d, mapping = aes(x = displ, y = cty))+
  geom_point() +
  theme_bw()+
  xlim(4, 6) +
  ylim(0, 30)

p1 <- ggplot(data = d, mapping = aes(x = displ, y = cty))+
  geom_point() +
  theme_bw()+
  xlim(0, 8) +
  ylim(0, 50)

p1
