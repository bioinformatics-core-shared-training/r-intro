# Week 3 live coding session

# ------------------------------------------------------------------------------

# METABRIC data set (11.05am)
# -----------------

# we're going to spend most of the session exploring the METABRIC data set by
# creating various kinds of plot using ggplot2

# using an expanded version of the METABRIC data in which we've downloaded all
# the clinical metadata columns and we've added columns for the mRNA expression
# data for selected genes (estrogen receptor alpha ESR1, progesterone receptor
# PGR, GATA3 and FOXA1)

library(tidyverse)
metabric <- read_csv("metabric_clinical_and_expression_data.csv")
metabric

# show metabric dataset in viewer in RStudio and draw attention to the various
# columns, especially the expression columns at the far end and the mutation
# counts

# expression values from Illumina HT-12 microarrays

# mutation counts from targeted sequencing of a panel of 40 genes thought to
# contain driver mutations

# also comment on renaming the columns replacing spaces with underscores so that
# we don't have to refer to them with backticks - exception being
# 3-gene_classifier
metabric$`3-gene_classifier`

# ------------------------------------------------------------------------------

# First ggplot - scatter plot (11.10am)
# ---------------------------

ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1))

# show how the plot gets displayed in the Plots tab pane (bottom RHS in RStudio)

# explain what's going on here
# - data
# - type of plot - geom_point
# - mapping of variables to visual properties (aesthetics) of the plot

# ------------------------------------------------------------------------------

# Aesthetic mappings (11:15am)
# ------------------

# x and y coordinates - aesthetic quality?

# other aesthetics: colour, size, shape

# let's try colour

ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, colour = ER_status))

# ER_status has two possible values, positive and negative

# what about a continuous variable, e.g. Nottingham_prognostic_index

ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, colour = Nottingham_prognostic_index))

# you get a colour gradient

# let's try size

ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, size = ER_status))

# several problems here
# - warning message about using size for a discrete variable - not advised
# - too many points to be displaying these with these sizes (a bit of a mess)
# - not usually a good idea to map size to a variable in your data set

# would be good to reduce the size of the points though given we have so many
ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, colour = Nottingham_prognostic_index), size = 0.5)

# that's more like it - now we can see a possible relationship between the
# Nottingham prognostic index and the ESR1/GATA3 expression levels

# some aesthetics can only be used with categorical variables, e.g. shape.
ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, shape = Survival_time))

# the 3-gene classifier is categorical - let's use that instead
ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, shape = `3-gene_classifier`), size = 0.9)

# draw attention to missing values - not displayed in this case

# colours usually a much better choice than sizes or shapes for distinguishing
# between different categories within our data

# sometimes use both colour and shape when trying to show which group data
# points belong to within 2 classifications
ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, colour = PAM50, shape = `3-gene_classifier`), size = 0.9)

# shows that luminal A/B tumours tend to have higher GATA3/ESR1 expression

# might be better off with a different representation, e.g. a box plot

# transparency - very useful when we have a lot of points
ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, colour = `3-gene_classifier`), size = 0.75, alpha = 0.5)

# customization
# virtually every aspect of the plot can be customized - we'll learn more about
# this later in the course

# ------------------------------------------------------------------------------

# ggplot2 grammar of graphics (11:23am)
# ---------------------------

# 'gg' stands for grammar of graphics

# show blue summary box in web site course materials

# ------------------------------------------------------------------------------

# Another plot type - bar chart (11.25am)
# -----------------------------

# look up geom in RStudio Packages tab (ggplot2 package)

# Integrative cluster - METABRIC redefined how we think about types of breast
# cancers, defining several new subtypes

table(metabric$Integrative_cluster)

# a more visual way to show this is using a bar chart

ggplot(data = metabric) +
  geom_bar(mapping = aes(x = Integrative_cluster))

# talk about why we didn't set the y aesthetic and how geom_bar has summed the
# numbers of observations in each category - refer to section on statistical
# transformations in the course materials

# colour aesthetic

ggplot(data = metabric) +
  geom_bar(mapping = aes(x = Integrative_cluster, colour = Integrative_cluster))

# look up help page again - which aesthetic do we need?

ggplot(data = metabric) +
  geom_bar(mapping = aes(x = Integrative_cluster, fill = Integrative_cluster))

# what happens if we colour by a different variable, e.g. ER status

ggplot(data = metabric) +
  geom_bar(mapping = aes(x = Integrative_cluster, fill = ER_status))

ggplot(data = metabric) +
  geom_bar(mapping = aes(x = Integrative_cluster, fill = `3-gene_classifier`))

# what if want the bars to be the same colour and not dark grey

ggplot(data = metabric) +
  geom_bar(mapping = aes(x = Integrative_cluster, fill = "blue"))

# need to set the colour outside the aesthetic mappings just as we did for
# size and transparency before

ggplot(data = metabric) +
  geom_bar(mapping = aes(x = Integrative_cluster), fill = "blue")

# explain what ggplot2 did when we set fill to the "blue" value before

# ------------------------------------------------------------------------------

# Multiple layers (11.30am)
# ---------------

# consider again the ggplot2 grammer - show the summary blue box in the web site
# course materials again

# explain about the overloading of the '+' operator?

# + operator used to add layers to a plot (geoms)
# + operator also use to add other components - scales, themes, etc.

# will add another layer to our scatter plot from earlier

ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1)) +
  geom_smooth(mapping = aes(x = GATA3, y = ESR1))

# what is geom_smooth doing - look up the help page

# duplication of code (mappings) - can set mappings for all layers in the
# ggplot() function call (actually more common)

ggplot(data = metabric, mapping = aes(x = GATA3, y = ESR1)) +
  geom_point(size = 0.5, alpha = 0.5) +
  geom_smooth()

# let's colour by ER status again

ggplot(data = metabric, mapping = aes(x = GATA3, y = ESR1, colour = ER_status)) +
  geom_point(size = 0.5, alpha = 0.5) +
  geom_smooth()

# but we only wanted colour to apply to the points

ggplot(data = metabric, mapping = aes(x = GATA3, y = ESR1)) +
  geom_point(mapping = aes(colour = ER_status), size = 0.5, alpha = 0.5) +
  geom_smooth()

# ------------------------------------------------------------------------------

# Box plots (11.35am)
# ---------

# one of the most frequent plot types on display at Wednesday lunchtime seminars
# where a comparison of 2 or more groups is shown
# e.g. comparing GATA3 expression level in ER positive and negative tumours
ggplot(data = metabric, mapping = aes(x = ER_status, y = GATA3)) +
  geom_boxplot()

# explain about box and whiskers referring to Summary statistics in the
# geom_boxplot help

# already knew that GATA3 expression is correlated with ESR1 so tell me
# something I didn't know

# what about HER2 status
ggplot(data = metabric, mapping = aes(x = ER_status, y = GATA3, colour = HER2_status)) +
  geom_boxplot()

# box plots are great way of summarizing data but may lead to false impression
# when there are very few points - then it would be a good idea to also show the
# points on the same graph, add another layer
# refer to course materials for more on how to do this

# ------------------------------------------------------------------------------

# Time series data and line plots (11.40am)
# -------------------------------

# the METABRIC data set doesn't include time series data

# daily UK Government press conference on its response to the coronavirus
# pandemic

# can download the data from the UK Government website

# go to web brower
# search for "uk government coronavirus press conference data"
# navigate to data for 26 April and show both the report/graphs and the Excel
# spreadsheet

library(readxl)
transport_use <- read_excel("2020-04-26_COVID-19_Press_Conference_Data.xlsx",
                            sheet = "Transport use",
                            col_names = c("date", "transport_type", "percentage"),
                            col_types = c("date", "text", "numeric"),
                            skip = 4,
                            n_max = 186)

# refer to format of data and why we have to tell read_excel a lot more about
# the data than we had to with the NCI-60 data set

# view data in RStudio data viewer
# note that percentages are converted
transport_use$percentage <- transport_use$percentage * 100
transport_use

# note the type of the date column - refer to course website materials

# what modes of transport are covered?
table(transport_use$transport_type)

# focus first on rail use
rail_use <- transport_use[transport_use$transport_type == "National rail", ]
rail_use

ggplot(data = rail_use) +
  geom_line(mapping = aes(x = date, y = percentage))

# now go back to complete data set and show different transport modes as
# separate lines
ggplot(data = transport_use) +
  geom_line(mapping = aes(x = date, y = percentage, colour = transport_type))

# briefly allude to the new Apple Map mobility data that the UK Government
# have started reported on in the last couple of days and the assignment

# ------------------------------------------------------------------------------

# Categorical variables - factors (11.45am)
# -------------------------------

# talk about categorical variables and how R has automatically treated these
# as categorical when it was expecting discrete values even though we haven't
# explicitly said these are

# this worked ok for character types but not so for categorical variables read
# into R as numeric types, e.g. tumour stage

ggplot(data = metabric) +
  geom_point(mapping = aes(x = GATA3, y = ESR1, colour = Tumour_stage))

# briefly mention the factor type and point again to the course website
# materials
