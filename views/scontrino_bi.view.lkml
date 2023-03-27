view: scontrino_bi {
  sql_table_name: `REZ_BI.SCONTRINO_BI`
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

  dimension: codice_reparto {
    type: string
    sql: ${TABLE}.Codice_Reparto ;;
  }

  dimension: ente_destinatario {
    type: number
    sql: ${TABLE}.Ente_Destinatario ;;
  }

  dimension: num_clienti {
    hidden: yes
    type: number
    sql: ${TABLE}.num_clienti ;;
  }

  dimension: num_clienti_reparto {
    hidden: yes
    type: number
    sql: ${TABLE}.num_clienti_reparto ;;
  }

  dimension: settimana {
    type: number
    sql: ${TABLE}.Settimana ;;
  }

  measure: num_clienti_AC {
    label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: max
    sql: ${num_clienti} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }

  measure: num_clienti_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: max
    sql: ${num_clienti} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP"]
  }

  measure: var_clienti {
    label: "Var. nr clienti"
    type: number
    sql: safe_divide(${num_clienti_AC} - ${num_clienti_AP}, ${num_clienti_AP}) ;;
    value_format: "0.00%"
  }

  #measure: num_clienti_rep_AC {
  #  label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
  #  type: sum
  #  sql: ${num_clienti_reparto} ;;
  #  value_format: "#,##0"
  #  filters: [negozio_calendario.ac_vs_ap: "AC"]
  #}
#
  #measure: num_clienti_rep_AP {
  #  #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
  #  type: sum
  #  sql: ${num_clienti_reparto} ;;
  #  value_format: "#,##0"
  #  filters: [negozio_calendario.ac_vs_ap: "AP"]
  #}
#
  #measure: var_clienti_rep {
  #  label: "Var. nr clienti"
  #  type: number
  #  sql: safe_divide(${num_clienti_rep_AC} - ${num_clienti_rep_AP}, ${num_clienti_rep_AP}) ;;
  #  value_format: "0.00%"
  #}

  ################################### REPARTO 03 ##################################

  measure: num_clienti_03_AC {
    label: "N. clienti  (Rep. 03) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "03"]
  }

  measure: num_clienti_03_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "03"]
  }

  measure: var_clienti_03 {
    label: "Var. nr clienti (Rep. 03)"
    type: number
    sql: safe_divide(${num_clienti_03_AC} - ${num_clienti_03_AP}, ${num_clienti_03_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 04 ##################################

  measure: num_clienti_04_AC {
    label: "N. clienti  (Rep. 04) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "04"]
  }

  measure: num_clienti_04_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "04"]
  }

  measure: var_clienti_04 {
    label: "Var. nr clienti (Rep. 04)"
    type: number
    sql: safe_divide(${num_clienti_04_AC} - ${num_clienti_04_AP}, ${num_clienti_04_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 01 ##################################

  measure: num_clienti_01_AC {
    label: "N. clienti  (Rep. 01) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "01"]
  }

  measure: num_clienti_01_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "01"]
  }

  measure: var_clienti_01 {
    label: "Var. nr clienti (Rep. 01)"
    type: number
    sql: safe_divide(${num_clienti_01_AC} - ${num_clienti_01_AP}, ${num_clienti_01_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 02 ##################################

  measure: num_clienti_02_AC {
    label: "N. clienti  (Rep. 02) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "02"]
  }

  measure: num_clienti_02_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "02"]
  }

  measure: var_clienti_02 {
    label: "Var. nr clienti (Rep. 02)"
    type: number
    sql: safe_divide(${num_clienti_02_AC} - ${num_clienti_02_AP}, ${num_clienti_02_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 05 ##################################

  measure: num_clienti_05_AC {
    label: "N. clienti  (Rep. 05) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "05"]
  }

  measure: num_clienti_05_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "05"]
  }

  measure: var_clienti_05 {
    label: "Var. nr clienti (Rep. 05)"
    type: number
    sql: safe_divide(${num_clienti_05_AC} - ${num_clienti_05_AP}, ${num_clienti_05_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 07 ##################################

  measure: num_clienti_07_AC {
    label: "N. clienti  (Rep. 07) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "07"]
  }

  measure: num_clienti_07_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "07"]
  }

  measure: var_clienti_07 {
    label: "Var. nr clienti (Rep. 07)"
    type: number
    sql: safe_divide(${num_clienti_07_AC} - ${num_clienti_07_AP}, ${num_clienti_07_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 08 ##################################

  measure: num_clienti_08_AC {
    label: "N. clienti  (Rep. 08) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "08"]
  }

  measure: num_clienti_08_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "08"]
  }

  measure: var_clienti_08 {
    label: "Var. nr clienti (Rep. 08)"
    type: number
    sql: safe_divide(${num_clienti_08_AC} - ${num_clienti_08_AP}, ${num_clienti_08_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 06 ##################################

  measure: num_clienti_06_AC {
    label: "N. clienti  (Rep. 06) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "06"]
  }

  measure: num_clienti_06_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "06"]
  }

  measure: var_clienti_06 {
    label: "Var. nr clienti (Rep. 06)"
    type: number
    sql: safe_divide(${num_clienti_06_AC} - ${num_clienti_06_AP}, ${num_clienti_06_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 11 ##################################

  measure: num_clienti_11_AC {
    label: "N. clienti  (Rep. 11) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "11"]
  }

  measure: num_clienti_11_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "11"]
  }

  measure: var_clienti_11 {
    label: "Var. nr clienti (Rep. 11)"
    type: number
    sql: safe_divide(${num_clienti_11_AC} - ${num_clienti_11_AP}, ${num_clienti_11_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 10 ##################################

  measure: num_clienti_10_AC {
    label: "N. clienti  (Rep. 10) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "10"]
  }

  measure: num_clienti_10_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "10"]
  }

  measure: var_clienti_10 {
    label: "Var. nr clienti (Rep. 10)"
    type: number
    sql: safe_divide(${num_clienti_10_AC} - ${num_clienti_10_AP}, ${num_clienti_10_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 52 ##################################

  measure: num_clienti_52_AC {
    label: "N. clienti  (Rep. 52) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "52"]
  }

  measure: num_clienti_52_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "52"]
  }

  measure: var_clienti_52 {
    label: "Var. nr clienti (Rep. 52)"
    type: number
    sql: safe_divide(${num_clienti_52_AC} - ${num_clienti_52_AP}, ${num_clienti_52_AP}) ;;
    value_format: "0.00%"
  }

}
