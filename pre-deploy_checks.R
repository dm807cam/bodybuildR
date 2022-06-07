# Simple helper script to check Kgen for R pre deployment.
# This script is meant to be executed locally. 

# Required packages
# install.packages("devtools")
# install.packages("rhub")

# Install newest version fo Kgen from source
devtools::unload("bodybuildR")
devtools::install_local("package", force=T)

# (2) Write Documentation and NAMESPACE and check package integrity
roxygen2::roxygenise("package")
dev_checks <- devtools::check("package")

# Stop script if devtools::check already returns an error.
if(!identical(dev_checks$errors, character(0))) stop("At least one error in devtools::check")
if(!identical(dev_checks$warnings, character(0))) stop("At least one warning in devtools::check")
if(!identical(dev_checks$notes, character(0))) stop("At least one note in devtools::check")

# (5) Check against CRAN requirements
devtools::build("package")
bodybuildR_tar <- list.files()[grep("*.tar.gz",list.files())]
rhub::check_for_cran(bodybuildR_tar) 
system(paste('rm ', bodybuildR_tar))






