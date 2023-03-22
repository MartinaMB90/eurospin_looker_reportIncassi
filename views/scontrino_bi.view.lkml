view: scontrino_bi {
  sql_table_name: `eur-cdp-prd-prj.REZ_BI.SCONTRINO_BI`
    ;;

  dimension: key {
    primary_key: yes
    hidden: yes
    type:  string
    sql: ${anno} || ${settimana} || ${ente_destinatario} || ${codice_merceologia} ;;
  }

  dimension: anno {
    type: number
    sql: ${TABLE}.Anno ;;
  }

  dimension: codice_merceologia {
    type: string
    sql: ${TABLE}.Codice_Merceologia ;;
  }

  dimension: ente_destinatario {
    type: number
    sql: ${TABLE}.Ente_Destinatario ;;
  }

  dimension: num_clienti {
    type: number
    sql: ${TABLE}.num_clienti ;;
  }

  dimension: settimana {
    type: number
    sql: ${TABLE}.Settimana ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
