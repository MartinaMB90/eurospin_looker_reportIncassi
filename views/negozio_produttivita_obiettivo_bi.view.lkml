view: negozio_produttivita_obiettivo_bi {
  sql_table_name: `REZ_BI.NEGOZIO_PRODUTTIVITA_OBIETTIVO_BI`
    ;;

  dimension: key {
    primary_key: yes
    hidden: yes
    type:  string
    sql: ${anno} || ${ente_destinatario} ;;
  }

  dimension: anno {
    type: number
    sql: ${TABLE}.Anno ;;
  }

  dimension: ente_destinatario {
    type: number
    sql: ${TABLE}.Ente_Destinatario ;;
  }

  dimension: obiettivo {
    type: number
    sql: ${TABLE}.Obiettivo ;;
  }

  measure: obiettivo_AC {
    label: "Obiettivo {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${obiettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }
}
