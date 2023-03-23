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

  measure: num_clienti_rep_AC {
    label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }

  measure: num_clienti_rep_AP {
    #label: "N. clienti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${num_clienti_reparto} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP"]
  }

  measure: var_clienti_rep {
    label: "Var. nr clienti"
    type: number
    sql: safe_divide(${num_clienti_rep_AC} - ${num_clienti_rep_AP}, ${num_clienti_rep_AP}) ;;
    value_format: "0.00%"
  }
}
