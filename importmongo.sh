source ./env.rc

source ./commonproc.sh

importmongo() {
    local -r table=$1
    shift
    log "Import $MONGODIR/$table.txt"
    cat $MONGODIR/$table.txt | tr ";" "\t"  | mongoimport --type tsv --db=$DATABASE --collection=$table --ignoreBlanks --uri=$URI --drop  -v --mode insert $@
    [ $? -ne 0 ] && logfail "Failed while importing mongo collection $table"

}

importall() {

  importmongo agents --headerline 
  importmongo company --headerline 
  importmongo customer --headerline 
  importmongo daysorder --columnsHaveTypes  --fields="cust_code.string(),ord_amount.decimal(),ord_num.decimal(),advance_amount.decimal(),agent_code.string(),ord_date.date(2006-01-02),ord_description.string()"
  importmongo despatch --columnsHaveTypes  --fields="agent_code.string(),des_amount.decimal(),des_date.date(2006-01-02),des_num.string(),ord_amount.decimal(),ord_date.date(2006-01-02),ord_num.decimal()"
  importmongo foods --headerline 
  importmongo listofitem --headerline  
  importmongo orders --columnsHaveTypes  --fields="advance_amount.decimal(),agent_code.string(),cust_code.string(),ord_amount.decimal(),ord_date.date(2006-01-02),ord_description.string(),ord_num.decimal()"
  importmongo student --headerline  
  importmongo studentreport --headerline  
}

importall