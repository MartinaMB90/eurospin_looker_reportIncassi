view: movimento_magazzino_bi {
  sql_table_name: `REZ_BI.MOVIMENTO_MAGAZZINO_BI`
    ;;

  dimension: key {
    primary_key: yes
    hidden: yes
    type:  string
    sql: ${anno} || ${settimana} || ${ente_destinatario} || coalesce(${codice_reparto}, "");;
  }

  dimension: anno {
    type: number
    sql: ${TABLE}.Anno ;;
  }

  dimension: codice_reparto {
    type: string
    sql: ${TABLE}.Codice_Reparto ;;
  }

  dimension: corrispettivo {
    type: number
    sql: ${TABLE}.corrispettivo ;;
  }

  dimension: corrispettivo_progress {
    type: number
    sql: ${TABLE}.corrispettivo_progress ;;
  }

  dimension: ente_destinatario {
    type: number
    sql: ${TABLE}.Ente_Destinatario ;;
  }

  dimension: scarti {
    type: number
    sql: ${TABLE}.scarti ;;
  }

  dimension: settimana {
    type: number
    sql: ${TABLE}.Settimana ;;
  }

  measure: corrispettivi_AC {
    label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }

  measure: corrispettivi_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP"]
  }

  measure: variazione {
    label: "Variazione %"
    type: number
    sql: safe_divide(${corrispettivi_AC} - ${corrispettivi_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: var_budget {
    label: "Variazione budget %"
    type: number
    sql: safe_divide(${corrispettivi_AC} - ${budget_consolidato_bi.budget_AC}, ${budget_consolidato_bi.budget_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_progressivo_AC {
    label: "Corrispettivi progress {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo_progress} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }

  measure: corrispettivi_progressivo_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo_progress} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP"]
  }

  measure: variazione_progress {
    label: "Variazione progressivo %"
    type: number
    sql: safe_divide(${corrispettivi_progressivo_AC} - ${corrispettivi_progressivo_AP}, ${corrispettivi_progressivo_AP}) ;;
    value_format: "0.00%"
  }

  measure: scarti_AC {
    label: "Scarti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${scarti} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }

  measure: scarti_AP {
    #label: "Scarti {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${scarti} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP"]
  }

  measure: incidenza_scarti_AC {
    label: "Incidenza scarti % {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${scarti_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: incidenza_scarti_AP {
    #label: "Incidenza scarti % {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${scarti_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: prod_metro_quadro_AC {
    label: "Produzione per metro quadro {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_AC}, sum(distinct ${negozio_bi.metratura})) ;;
    value_format: "#,##0"
  }

  measure: prod_metro_quadro_AP {
    #label: "Produzione per metro quadro {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_AP}, sum(distinct ${negozio_bi.metratura})) ;;
    value_format: "#,##0"
  }

  measure: var_prod_metro_quadro {
    label: "Var. produzione per metro quadro"
    type: number
    sql: safe_divide(${prod_metro_quadro_AC} - ${prod_metro_quadro_AP}, ${prod_metro_quadro_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_AC {
    label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_AC}, ${scontrino_bi.num_clienti_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_AP}, ${scontrino_bi.num_clienti_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media {
    label: "Var. Spesa media"
    type: number
    sql: safe_divide(${spesa_media_AC} - ${spesa_media_AP}, ${spesa_media_AP}) ;;
    value_format: "0.00%"
  }

  ################################### REPARTO 03 ##################################

  measure: corrispettivi_03__AC {
    label: "Corrispettivi 03 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC"]
  }

  measure: corrispettivi_03_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP"]
  }
}
