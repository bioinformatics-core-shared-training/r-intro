library(tidyverse)

table1
View(table1)

table2
table3

table1
table4a
table4b

# table4a and table4b in "wide" format

# are 1999 and 2000 truly variables? or are they values?

# what if we want to create a bar chart showing the numbers of cases
# per year in each country?

table4a_long <- pivot_longer(table4a, c(`1999`, `2000`), names_to = "year", values_to = "cases")
table4a_long

ggplot(table4a_long) + geom_col(mapping = aes(x = year, y = cases)) + facet_wrap(vars(country), scales = "free_y")

table4b_long <- pivot_longer(table4b, c(`1999`, `2000`), names_to = "year", values_to = "population")
table4b_long

left_join(table4a_long, table4b_long, by = c("country", "year"))

# gene expression matrices are wide format
# rows for each gene, columns for each sample (or the other way round)

# pivot_wider is opposite of pivot_longer
table4a_long
pivot_wider(table4a_long, names_from = "year", values_from = "cases")

# is table2 tidy?

table2

# are the type and count columns true variables?
# what is the observational unit in this case?

# if the observational unit is country and year then table2 is not tidy
# because the observations are split across two years

# the count column contains values for what are two different measurements

pivot_wider(table2, names_from = "type", values_from = "count")

# is table3 tidy?

table3

# the rate column contains 2 different values - it is a "compound variable"

table3_fixed <- separate(table3, rate, into = c("cases", "population"), sep = "/")

# error when calculating the rate
table3_fixed %>%
  mutate(rate = cases / population)

# convert cases and population to numeric
table3_fixed %>%
  mutate_at(vars(cases, population), as.numeric) %>%
  mutate(rate = cases / population)

# use convert = TRUE in separate
table3_fixed <- separate(table3, rate, into = c("cases", "population"), sep = "/", convert = TRUE)
table3_fixed %>%
  mutate(rate = cases / population)

# real example (METABRIC expression)
metabric <- read_csv("metabric_clinical_and_expression_data.csv")
metabric <- select(metabric, Patient_ID, ER_status, ESR1:MLPH)
metabric

# a plot we created in week 3
ggplot(metabric) +
  geom_boxplot(mapping = aes(x = ER_status, y = GATA3))

# what if we wanted to create a box plot of the expression of all our genes?
# we'd need gene to be a variable rather than have separate gene columns

# the observational unit should be sample and gene rather than sample

# an example of a wide format table in its current form

metabric <- pivot_longer(metabric, ESR1:MLPH, names_to = "gene", values_to = "expression")
metabric

# now have one row-per-sample-per-gene

ggplot(data = metabric) +
  geom_boxplot(mapping = aes(x = gene, y = expression, colour = ER_status))

ggplot(metabric) +
  geom_boxplot(mapping = aes(x = ER_status, y = expression)) +
  facet_wrap(vars(gene))

# scatter plots comparing gene expression require the one-row-per-sample format

# real example 2 - proteomic data from qPLEX-RIME paper (Papachristou et al. 2018)

library(readxl)
protein_levels <- read_excel("41467_2018_4619_MOESM11_ESM.xlsx", skip = 1)
select(protein_levels, `Uniprot Accession`, `Gene Name`, ends_with("rep01"))



