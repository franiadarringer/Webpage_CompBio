# frania darringer hw 12

import plotly.express as px
import pandas as pd

# loading gapminder
gapminder = px.data.gapminder()

# picking my year
year1 = 2013

europe = gapminder[
    (gapminder["continent"] == "europe") &
    (gapminder["year"] == year1)
]

print(europe)

fig1 = px.choropleth(
    locations="europe",
    locationmode="ISO-3",
    color="gdpPercap",
    color_continuous_scale="Viridis_r",
    scope=europe,
    title="gdp per capita in europe 2013",
    labels={
        "gdpPercap": "gdp per capita",
        "pop": "population"
    },
    projection="natural earth"
)

fig1.show()

pd.dtype('gdpPercap')
