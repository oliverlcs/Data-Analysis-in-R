# CLAUDE.md
This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
University data analysis project (5th Semester) analyzing crash/accident data from Montgomery County, Maryland, USA. The main dataset is `Crash_Reporting_Drivers_Data.csv` (~96MB, 204,688 observations, 39 variables). Authors: Nele Hauck, Oliver Lucius.

**Goal:** Data understanding and exploratory analysis — NO predictive modeling or ML training.

## FIRST: Check Research Question
Before making changes, read `analysis.qmd` to understand:
1. The defined Fragestellung (research question)
2. What has already been done
3. The current state of analysis

## Project Requirements (from Projektbeschreibung)
The report must contain these sections:
1. **Fragestellung (10 Pkt.)** — What interests you? What do you expect?
2. **Laden der Daten (10 Pkt.)** — Load data, check types, handle oddities (NA encoding, etc.)
3. **Bearbeiten/Transformieren (15 Pkt.)** — Data cleansing, recoding, subsetting, joins
4. **Visualisierung & Aggregation (15 Pkt.)** — Summaries, plots, statistical tests to answer the question
5. **Zusammenfassung (10 Pkt.)** — Conclusions, were expectations met?

**Important:** Explain your reasoning throughout. Document observations and conclusions in German.

## Commands
```bash
quarto render analysis.qmd      # Render document
R -e "renv::restore()"          # Restore R environment
Rscript data-cleansing/<script>.r  # Run helper scripts
```

## Project Structure
- `analysis.qmd` — Main Quarto analysis document (German)
- `data/Crash_Reporting_Drivers_Data.csv` — Primary dataset
- `data-cleansing/` — Helper R scripts
- `renv/`, `renv.lock` — R dependency management

## Language
All documentation and analysis text in **German**.

---

## IMPORTANT: Allowed Packages & Functions

**This is a university elective. Only use what's covered in the lecture + cited extras.**

### Core Packages (from lecture)

#### Tidyverse
`tidyverse`, `tibble`, `dplyr`, `tidyr`, `purrr`, `readr`, `forcats`, `stringr`, `magrittr`, `lubridate`

#### Visualization
`ggplot2`, `patchwork`, `gganimate`, `gt`, `lattice`, `grid`, `scatterplot3d`, `gifski`

#### Model Summaries (for understanding, not prediction)
- `broom` — `tidy()`, `glance()`, `augment()` for readable model output
- `infer` — `specify()`, `hypothesize()`, `generate()`, `calculate()` for intuitive hypothesis testing

#### Reporting
`rmarkdown`, `knitr`, `shiny`

#### Base R / Standard Library
`base`, `datasets`, `utils`, `grDevices`, `graphics`, `stats`, `methods`, `MASS`

### Extra Packages (not in lecture — MUST CITE in report)
- `skimr` — Data summaries (`skim()`)
- `janitor` — Duplicate detection (`get_dupes()`)
- `stringdist` — Fuzzy string matching (Jaro-Winkler)
- `formattable` — Table formatting

### Allowed Functions

#### Data I/O
`read.table()`, `read_csv()`, `print()`, `cat()`, `set.seed()`, `save()`, `load()`

#### Data Inspection
`glimpse()`, `head()`, `tail()`, `str()`, `summary()`, `skim()`, `View()`

#### Data Structures
`tibble()`, `as_tibble()`, `as.data.frame()`, `data.frame()`, `list()`, `c()`, `vector()`

#### Data Manipulation (dplyr)
`%>%`, `|>`, `select()`, `filter()`, `mutate()`, `arrange()`, `desc()`, `rename()`, `relocate()`, `slice()`, `distinct()`, `pull()`, `across()`, `group_by()`, `summarize()`, `summarise()`, `ungroup()`, `tally()`, `count()`, `n()`, `n_distinct()`, `case_when()`, `if_else()`, `coalesce()`, `na_if()`, `starts_with()`, `ends_with()`, `contains()`, `matches()`, `everything()`, `left_join()`, `right_join()`, `inner_join()`, `full_join()`, `anti_join()`, `semi_join()`, `bind_rows()`, `bind_cols()`

#### Data Reshaping (tidyr)
`pivot_longer()`, `pivot_wider()`, `gather()`, `spread()`, `separate()`, `unite()`, `drop_na()`, `replace_na()`, `fill()`

#### String Manipulation (stringr)
`str_detect()`, `str_replace()`, `str_replace_all()`, `str_extract()`, `str_sub()`, `str_to_lower()`, `str_to_upper()`, `str_trim()`, `str_c()`, `str_split()`

#### Factors (forcats)
`factor()`, `as.factor()`, `levels()`, `fct_relevel()`, `fct_reorder()`, `fct_collapse()`, `fct_lump()`, `fct_infreq()`

#### Date/Time (lubridate)
`mdy_hms()`, `ymd()`, `dmy()`, `year()`, `month()`, `day()`, `hour()`, `wday()`, `floor_date()`, `ceiling_date()`

#### Functional Programming (purrr)
`map()`, `map_dbl()`, `map_int()`, `map_chr()`, `map_lgl()`, `map_df()`, `map2()`, `pmap()`, `walk()`, `iwalk()`, `\(x)` lambdas, `~ .x` syntax

#### Descriptive Statistics
`mean()`, `median()`, `sd()`, `var()`, `min()`, `max()`, `sum()`, `range()`, `quantile()`, `IQR()`, `table()`, `prop.table()`, `cor()`, `cov()`

#### Statistical Tests (for data understanding)
`t.test()`, `wilcox.test()`, `chisq.test()`, `fisher.test()`, `cor.test()`, `var.test()`, `binom.test()`, `anova()`, `aov()`

#### Simple Modeling (for insight, not prediction)
`lm()`, `glm()`, `coef()`, `fitted()`, `resid()`, `predict()`, `confint()`

#### ggplot2
- Core: `ggplot()`, `aes()`
- Geoms: `geom_point()`, `geom_line()`, `geom_bar()`, `geom_col()`, `geom_histogram()`, `geom_boxplot()`, `geom_violin()`, `geom_density()`, `geom_smooth()`, `geom_text()`, `geom_label()`, `geom_tile()`, `geom_hline()`, `geom_vline()`, `geom_errorbar()`, `geom_density_2d()`
- Scales: `scale_x_continuous()`, `scale_y_continuous()`, `scale_x_log10()`, `scale_fill_manual()`, `scale_color_manual()`, `scale_fill_brewer()`
- Coords: `coord_flip()`, `coord_cartesian()`, `coord_polar()`
- Facets: `facet_wrap()`, `facet_grid()`
- Themes: `theme()`, `theme_bw()`, `theme_minimal()`, `theme_classic()`, `labs()`, `ggtitle()`, `xlab()`, `ylab()`
- Output: `ggsave()`

#### Base Graphics
`plot()`, `hist()`, `barplot()`, `boxplot()`, `pairs()`, `par()`

#### Reporting (knitr)
`knitr::kable()`, `knitr::opts_chunk$set()`

---

## Data Cleaning Patterns (already in use)
- Convert empty strings, "N/A", "UNKNOWN" → `NA`
- Group similar values with `str_detect()` + regex
- Convert character → factor after cleaning
- Split compound columns (e.g., substance abuse → alcohol/drugs/medication)
- Fuzzy match vehicle makes/models with Jaro-Winkler (threshold 0.2)
- Parse dates with `mdy_hms()`, timezone EST

---

## DO NOT USE
- **tidymodels ecosystem** (parsnip, recipes, workflows, tune, yardstick, rsample, dials, workflowsets) — this is for ML model training
- **ML algorithms** (randomForest, ranger, rpart, nnet, svm, knn, etc.) — not needed for data understanding
- Any package/function not listed above unless you cite it properly
