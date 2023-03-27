view: budget_consolidato_bi {
  sql_table_name: `REZ_BI.BUDGET_CONSOLIDATO_BI`
    ;;

  dimension: key {
    primary_key: yes
    hidden: yes
    type:  string
    sql: ${anno} || ${settimana} || ${ente_destinatario} || coalesce(${codice_reparto}, "") ;;
  }

  dimension: anno {
    type: number
    sql: ${TABLE}.Anno ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: codice_reparto {
    type: string
    sql: ${TABLE}.Codice_Merceologia ;;
  }

  dimension: ente_destinatario {
    type: number
    sql: ${TABLE}.Ente_Destinatario ;;
  }

  dimension: settimana {
    type: number
    sql: ${TABLE}.Settimana ;;
  }

  measure: budget_AC {
    label: "Budget {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }

  ################################### REPARTO 03 ##################################

  measure: budget_03_AC {
    label: "Budget (Rep. 03) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "03"]
  }

  ################################### REPARTO 04 ##################################

  measure: budget_04_AC {
    label: "Budget (Rep. 04) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "04"]
  }

  ################################### REPARTO 01 ##################################

  measure: budget_01_AC {
    label: "Budget (Rep. 01) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "01"]
  }

  ################################### REPARTO 02 ##################################

  measure: budget_02_AC {
    label: "Budget (Rep. 02) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "02"]
  }

  ################################### REPARTO 05 ##################################

  measure: budget_05_AC {
    label: "Budget (Rep. 05) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "05"]
  }

  ################################### REPARTO 07 ##################################

  measure: budget_07_AC {
    label: "Budget (Rep. 07) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "07"]
  }

  ################################### REPARTO 08 ##################################

  measure: budget_08_AC {
    label: "Budget (Rep. 08) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "08"]
  }

  ################################### REPARTO 06 ##################################

  measure: budget_06_AC {
    label: "Budget (Rep. 06) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "06"]
  }

  ################################### REPARTO 11 ##################################

  measure: budget_11_AC {
    label: "Budget (Rep. 11) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "11"]
  }

  ################################### REPARTO 10 ##################################

  measure: budget_10_AC {
    label: "Budget (Rep. 10) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "10"]
  }

  ################################### REPARTO 52 ##################################

  measure: budget_52_AC {
    label: "Budget (Rep. 52) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${budget} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "52"]
  }

}
