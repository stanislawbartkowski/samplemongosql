source ./env.rc

source ./commonproc.sh

exporttable() {
    required_var SCHEMA
    local -r TMP=`crtemp`
    local -r TABLE="'"$1"'"
    local -r MTXTFILE=$MONGODIR/$1.txt
    log "Create $MTXTFILE"
    # create a header line
    db2exportcommand $TMP "SELECT LOWER(c.COLNAME) FROM SYSCAT.COLUMNS c WHERE c.TABNAME = UPPER($TABLE) and c.TABSCHEMA=UPPER('$SCHEMA')"
    local HEADER=""
    local COLS=""
    while read line; do
      [[ -n $COLS ]] && COLS="$COLS,"
      COLS="$COLS$line"
      [[ -n $HEADER ]] && HEADER="$HEADER$DELIM"
      HEADER="$HEADER$line"
    done <$TMP
    echo $HEADER >$MTXTFILE
    db2exportcommand $TMP "SELECT $COLS FROM $1"
    cat $TMP >>$MTXTFILE
}

exporttabledate() {
  local -r TMP=`crtemp`
  local -r COLS="$2"
  local -r MTXTFILE=$MONGODIR/$1.txt
  db2exportcommand $MTXTFILE "SELECT $COLS FROM $1"
}

prepare() {
  usetemp
  required_var MONGODIR
  mkdir -p $MONGODIR
}

  
exportmongo() {
  db2connect
  exporttable agents
  exporttable company
  exporttable customer
  exporttabledate daysorder "cust_code,ord_amount,ord_num,advance_amount,agent_code,CHAR(ord_date),ord_description"
  exporttabledate despatch "agent_code,des_amount,char(des_date),des_num,ord_amount,char(ord_date),ord_num"
  exporttable foods
  exporttable listofitem
  exporttabledate orders "advance_amount,agent_code,cust_code,ord_amount,char(ord_date),ord_description,ord_num"
  exporttable student 
  exporttable studentreport

  db2terminate
}

prepare
exportmongo