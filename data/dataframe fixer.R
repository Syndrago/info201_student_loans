library(tidyverse)
dashboard <- read.csv("C:/Syndrago/UW/Year 3/Quarter 2/INFO 201/info201_student_loans/data/dashboardusableish.csv", stringsAsFactors=FALSE)
comma_remover <- function(chartable){
  fixedtable <- as.numeric(gsub(",", "", chartable, fixed = TRUE))
  return(fixedtable)
}
dollar_comma_remover <- function(dollartable){
  fixeddollartable <- gsub("$", "", dollartable, fixed = TRUE)
  nocomma <- comma_remover(fixeddollartable)
  return(nocomma)
}
dashboard$Subsidized.Recipients <- comma_remover(dashboard$Subsidized.Recipients)
dashboard$Subsidized.Num.of.Loans.Originated <- comma_remover(dashboard$Subsidized.Num.of.Loans.Originated)
dashboard$Subsidized.Dollars.of.Loans.Originated <- dollar_comma_remover(dashboard$Subsidized.Dollars.of.Loans.Originated)
dashboard$Subsidized.Num.of.Disbursements <- comma_remover(dashboard$Subsidized.Num.of.Disbursements)
dashboard$Subsidized.Dollars.of.Disbursements <- dollar_comma_remover(dashboard$Subsidized.Dollars.of.Disbursements)

dashboard$Unsubsidized.Undergrad.Recipients <- comma_remover(dashboard$Unsubsidized.Undergrad.Recipients)
dashboard$Unsubsidized.Undergrad.Num.of.Loans.Originated <- comma_remover(dashboard$Unsubsidized.Undergrad.Num.of.Loans.Originated)
dashboard$Unsubsidized.Undergrad.Dollars.of.Loans.Originated <- dollar_comma_remover(dashboard$Unsubsidized.Undergrad.Dollars.of.Loans.Originated)
dashboard$Unsubsidized.Undergrad.Num.of.Disbursements <- comma_remover(dashboard$Unsubsidized.Undergrad.Num.of.Disbursements)
dashboard$Unsubsidized.Undergrad.Dollars.of.Disbursements <- dollar_comma_remover(dashboard$Unsubsidized.Undergrad.Dollars.of.Disbursements)

dashboard$Unsubsidized.Graduate.Recipients <- comma_remover(dashboard$Unsubsidized.Graduate.Recipients)
dashboard$Unsubsidized.Graduate.Num.of.Loans.Originated <- comma_remover(dashboard$Unsubsidized.Graduate.Num.of.Loans.Originated)
dashboard$Unsubsidized.Graduate.Dollars.of.Loans.Originated <- dollar_comma_remover(dashboard$Unsubsidized.Graduate.Dollars.of.Loans.Originated)
dashboard$Unsubsidized.Graduate.Num.of.Disbursements <- comma_remover(dashboard$Unsubsidized.Graduate.Num.of.Disbursements)
dashboard$Unsubsidized.Graduate.Dollars.of.Disbursements <- dollar_comma_remover(dashboard$Unsubsidized.Graduate.Dollars.of.Disbursements)

dashboard$Parent.Plus.Recipients <- comma_remover(dashboard$Parent.Plus.Recipients)
dashboard$Parent.Plus.Num.of.Loans.Originated <- comma_remover(dashboard$Parent.Plus.Num.of.Loans.Originated)
dashboard$Parent.Plus.Dollars.of.Loans.Originated <- dollar_comma_remover(dashboard$Parent.Plus.Dollars.of.Loans.Originated)
dashboard$Parent.Plus.Num.of.Disbursements <- comma_remover(dashboard$Parent.Plus.Num.of.Disbursements)
dashboard$Parent.Plus.Dollars.of.Disbursements <- dollar_comma_remover(dashboard$Parent.Plus.Dollars.of.Disbursements)

dashboard$Grad.Plus.Recipients <- comma_remover(dashboard$Grad.Plus.Recipients)
dashboard$Grad.Plus.Num.of.Loans.Originated <- comma_remover(dashboard$Grad.Plus.Num.of.Loans.Originated)
dashboard$Grad.Plus.Dollars.of.Loans.Originated <- dollar_comma_remover(dashboard$Grad.Plus.Dollars.of.Loans.Originated)
dashboard$Grad.Plus.Num.of.Disbursements <- comma_remover(dashboard$Grad.Plus.Num.of.Disbursements)
dashboard$Grad.Plus.Dollars.of.Disbursements <- dollar_comma_remover(dashboard$Grad.Plus.Dollars.of.Disbursements)

write.csv(dashboard,"C:/Syndrago/UW/Year 3/Quarter 2/INFO 201/info201_student_loans\\dashboard_data.csv", row.names = TRUE)
