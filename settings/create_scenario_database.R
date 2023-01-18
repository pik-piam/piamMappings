myscenarios <- c("SSP1", "SSP2", "SSP3", "SSP4", "SSP5")
myfoodlist <- foodlist(13,data)[[1]]
myfunctions <- collectFormula()
version <- "new"

calibration_type <- "convergent"
calibration_start <- 2010
calibration_end <- 2050

functional_form_z <- NA
functional_merging_add <- 1
z <- NA

para_1 <- NA
para_2 <- NA
para_3 <- NA
para_4 <- NA
para_5 <- NA
para_6 <- NA
R2 <- NA
R2adj <- NA

all_rows <- matrix(ncol=22, nrow=0)
colnames(all_rows) <- c("version", "scenario",
                        "foodgroup", "parent",
                        "functional_form_income", "functional_form_z",
                        "functional_merging_add", "z",
                        "gdp_scen","pop_scen", "z_scen",
                        "calibration_type", "calibration_start", "calibration_end",
                        "para_1","para_2","para_3","para_4","para_5","para_6",
                        "R2", "R2adj")

for(i_scen in 1:length(myscenarios))
{
  scenario <- myscenarios[i_scen]
  
  gdp_scen <- myscenarios[i_scen]
  pop_scen <- myscenarios[i_scen]
  z_scen <- myscenarios[i_scen]
  
  for(i_food in 1:dim(myfoodlist)[1])
  {
    foodgroup <- myfoodlist[i_food,2]
    parent <- myfoodlist[i_food,1]
    
    for(i_func in 1:length(myfunctions))
    {
      functional_form_income <- as.character(myfunctions[[i_func]][3])
      
      a_row <- c(version, scenario,
                 foodgroup, parent,
                 functional_form_income, functional_form_z,
                 functional_merging_add, z,
                 gdp_scen,pop_scen, z_scen,
                 calibration_type, calibration_start, calibration_end,
                 para_1,para_2,para_3,para_4,para_5,para_6,
                 R2, R2adj)
      all_rows <- rbind(all_rows,a_row)
    }
  }
}
all_rows <- cbind(Nr=c(1:dim(all_rows)[1]),all_rows)
rownames(all_rows) <- c()

filename <- paste0(file.path(Sys.getenv("USERPROFILE"),"Desktop"),"/scenario_database.csv")
write.csv(all_rows,filename, row.names = FALSE)