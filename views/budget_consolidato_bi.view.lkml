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
}
