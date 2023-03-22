view: ore_lavorate_bi {
  sql_table_name: `REZ_BI.ORE_LAVORATE_BI`
    ;;

  dimension: key {
    primary_key: yes
    hidden: yes
    type:  string
    sql: ${anno} || ${settimana} || ${ente_destinatario} ;;
  }

  dimension: anno {
    type: number
    sql: ${TABLE}.Anno ;;
  }

  dimension: ente_destinatario {
    type: number
    sql: ${TABLE}.Ente_Destinatario ;;
  }

  dimension: settimana {
    type: number
    sql: ${TABLE}.Settimana ;;
  }

  measure: ore_lavorate_AC {
    label: "Ore lavorate {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${TABLE}.Ore_Lavorate ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }

  measure: ore_lavorate_AP {
    #label: "Ore lavorate {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${TABLE}.Ore_Lavorate ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP"]
  }
}
