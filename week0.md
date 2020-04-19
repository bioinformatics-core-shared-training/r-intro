---
title: 'Getting Ready'
---

> **Learning objectives**
>
> * Install R and RStudio
> * Install the tidyverse collection of R packages

# Installing software you will need

Before starting this course you will need to ensure that your computer is set
up with the required software.

In addition, online learning requires extra screen 'real estate' and you may
find it useful (but not essential) to have a dual screen setup or two devices,
e.g. laptop and tablet/phone.

If you have any difficulty installing any of this software then please contact
one of the trainers for help.

<div style="line-height: 100%;"><br/></div>

# R and RStudio

**R** and **RStudio** are separate downloads and installations.

**R** is the underlying statistical computing environment. The base R system and
a very large collection of packages that give you access to a huge range of
statistical and analytical functionality are available from
[CRAN](https://cran.r-project.org), the Comprehensive R Archive Network.

However, using R alone is no fun. **RStudio** is a graphical integrated
development environment (IDE) that makes using R much easier and more
interactive. You need to install R before you install RStudio.

On this course we will be making use of a brilliant collection of packages
designed for data science called the **`tidyverse`** that make it much easier
and more fun to work with your data. After installing R and RStudio, follow
the instructions at the bottom of this page to install the `tidyverse`.

<div style="line-height: 75%;"><br/></div>

## Windows

#### If you already have R and RStudio installed

* Open RStudio, and click on "Help" > "Check for updates". If a new version is
  available, quit RStudio, and download the latest version for RStudio.

To check which version of R you are using, start RStudio and the first thing
that appears in the console indicates the version of R you are running.
Alternatively, you can type `sessionInfo()`, which will also display which
version of R you are running. Go on the
[CRAN website](https://cran.r-project.org/bin/windows/base/) and check whether
a more recent version is available. If so, please download and install it. You
can [check here](https://cran.r-project.org/bin/windows/base/rw-FAQ.html#How-do-I-UNinstall-R_003f)
for more information on how to remove old versions from your system if you wish
to do so.

#### If you don't have R and RStudio installed

* Download R from the [CRAN website](https://cran.r-project.org/bin/windows/base/release.htm).
* Run the `.exe` file that was just downloaded
* Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select **RStudio x.yy.zzz - Windows 10/8/7** (where x, y, and z represent version numbers)
* Double click the file to install it
* Once it's installed, open RStudio to make sure it works and you don't get any
  error messages.

<div style="line-height: 75%;"><br/></div>

## macOS

#### If you already have R and RStudio installed

* Open RStudio, and click on "Help" > "Check for updates". If a new version is
	available, quit RStudio, and download the latest version for RStudio.

To check the version of R you are using, start RStudio and the first thing that
appears on the terminal indicates the version of R you are running.
Alternatively, you can type `sessionInfo()`, which will also display which
version of R you are running. Go on the
[CRAN website](https://cran.r-project.org/bin/macosx/) and check whether a more
recent version is available. If so, please download and install it.

#### If you don't have R and RStudio installed

* Download R from
  the [CRAN website](https://cran.r-project.org/bin/macosx/).
* Select the `.pkg` file for the latest R version
* Double click on the downloaded file to install R
* It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed
  by some packages)
* Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select **RStudio x.yy.zzz - Mac OS X 10.6+ (64-bit)**
  (where x, y, and z represent version numbers)
* Double click the file to install RStudio
* Once it's installed, open RStudio to make sure it works and you don't get any
  error messages.

<div style="line-height: 75%;"><br/></div>

## Linux

* Follow the instructions for your distribution
  from [CRAN](https://cloud.r-project.org/bin/linux), they provide information
  to get the most recent version of R for common distributions. For most
  distributions, you could use your package manager (e.g., for Debian/Ubuntu run
  `sudo apt-get install r-base`, and for Fedora `sudo yum install R`), but we
  don't recommend this approach as the versions provided by this are
  usually out of date. In any case, make sure you have at least R 3.3.1.
* Go to the
  [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select the version that matches your distribution, and
  install it with your preferred method (e.g., with Debian/Ubuntu `sudo dpkg -i
  rstudio-x.yy.zzz-amd64.deb` at the terminal).
* Once it's installed, open RStudio to make sure it works and you don't get any
  error messages.

<div style="line-height: 100%;"><br/></div>

# Tidyverse

After installing R and RStudio, please install the `tidyverse` packages.

* After starting RStudio, at the console type:
  `install.packages("tidyverse")`
  (look for the 'Console' tab and type at the `>` prompt)

* You can also do this by going to Tools -> Install Packages and typing the names of the packages separated by a comma.

<div style="line-height: 100%;"><br/></div>

#### Credit

These instructions were adapted from [Data Carpentry](https://datacarpentry.org)
course materials.
