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

  measure: corrispettivi_03_AC {
    label: "Corrispettivi (Rep. 03) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "03"]
  }

  measure: inc_corrispettivi_03_AC {
    label: "Incidenza corrispettivi (Rep. 03) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_03_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_03 {
    label: "Variazione budget % (Rep. 03)"
    type: number
    sql: safe_divide(${corrispettivi_03_AC} - ${budget_consolidato_bi.budget_03_AC}, ${budget_consolidato_bi.budget_03_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_03_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "03"]
  }

  measure: inc_corrispettivi_03_AP {
    #label: "Incidenza corrispettivi 03 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_03_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_03 {
    label: "Differenza incidenza (Rep. 03)"
    type: number
    sql: ${inc_corrispettivi_03_AC} - ${inc_corrispettivi_03_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_03 {
    label: "Var. corrispettivi (Rep. 03)"
    type: number
    sql: safe_divide(${corrispettivi_03_AC} - ${corrispettivi_03_AP}, ${corrispettivi_03_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_03_AC {
    label: "Spesa media (Rep. 03) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_03_AC}, ${scontrino_bi.num_clienti_03_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_03_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_03_AP}, ${scontrino_bi.num_clienti_03_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_03 {
    label: "Var. Spesa media (Rep. 03)"
    type: number
    sql: safe_divide(${spesa_media_03_AC} - ${spesa_media_03_AP}, ${spesa_media_03_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 04 ##################################

  measure: corrispettivi_04_AC {
    label: "Corrispettivi (Rep. 04) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "04"]
  }

  measure: inc_corrispettivi_04_AC {
    label: "Incidenza corrispettivi (Rep. 04) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_04_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_04 {
    label: "Variazione budget % (Rep. 04)"
    type: number
    sql: safe_divide(${corrispettivi_04_AC} - ${budget_consolidato_bi.budget_04_AC}, ${budget_consolidato_bi.budget_04_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_04_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "04"]
  }

  measure: inc_corrispettivi_04_AP {
    #label: "Incidenza corrispettivi 04 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_04_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_04 {
    label: "Differenza incidenza (Rep. 04)"
    type: number
    sql: ${inc_corrispettivi_04_AC} - ${inc_corrispettivi_04_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_04 {
    label: "Var. corrispettivi (Rep. 04)"
    type: number
    sql: safe_divide(${corrispettivi_04_AC} - ${corrispettivi_04_AP}, ${corrispettivi_04_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_04_AC {
    label: "Spesa media (Rep. 04) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_04_AC}, ${scontrino_bi.num_clienti_04_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_04_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_04_AP}, ${scontrino_bi.num_clienti_04_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_04 {
    label: "Var. Spesa media (Rep. 04)"
    type: number
    sql: safe_divide(${spesa_media_04_AC} - ${spesa_media_04_AP}, ${spesa_media_04_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 01 ##################################

  measure: corrispettivi_01_AC {
    label: "Corrispettivi (Rep. 01) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "01"]
  }

  measure: inc_corrispettivi_01_AC {
    label: "Incidenza corrispettivi (Rep. 01) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_01_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_01 {
    label: "Variazione budget % (Rep. 01)"
    type: number
    sql: safe_divide(${corrispettivi_01_AC} - ${budget_consolidato_bi.budget_01_AC}, ${budget_consolidato_bi.budget_01_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_01_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "01"]
  }

  measure: inc_corrispettivi_01_AP {
    #label: "Incidenza corrispettivi 01 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_01_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_01 {
    label: "Differenza incidenza (Rep. 01)"
    type: number
    sql: ${inc_corrispettivi_01_AC} - ${inc_corrispettivi_01_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_01 {
    label: "Var. corrispettivi (Rep. 01)"
    type: number
    sql: safe_divide(${corrispettivi_01_AC} - ${corrispettivi_01_AP}, ${corrispettivi_01_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_01_AC {
    label: "Spesa media (Rep. 01) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_01_AC}, ${scontrino_bi.num_clienti_01_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_01_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_01_AP}, ${scontrino_bi.num_clienti_01_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_01 {
    label: "Var. Spesa media (Rep. 01)"
    type: number
    sql: safe_divide(${spesa_media_01_AC} - ${spesa_media_01_AP}, ${spesa_media_01_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 02 ##################################

  measure: corrispettivi_02_AC {
    label: "Corrispettivi (Rep. 02) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "02"]
  }

  measure: inc_corrispettivi_02_AC {
    label: "Incidenza corrispettivi (Rep. 02) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_02_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_02 {
    label: "Variazione budget % (Rep. 02)"
    type: number
    sql: safe_divide(${corrispettivi_02_AC} - ${budget_consolidato_bi.budget_02_AC}, ${budget_consolidato_bi.budget_02_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_02_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "02"]
  }

  measure: inc_corrispettivi_02_AP {
    #label: "Incidenza corrispettivi 02 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_02_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_02 {
    label: "Differenza incidenza (Rep. 02)"
    type: number
    sql: ${inc_corrispettivi_03_AC} - ${inc_corrispettivi_03_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_02 {
    label: "Var. corrispettivi (Rep. 02)"
    type: number
    sql: safe_divide(${corrispettivi_02_AC} - ${corrispettivi_02_AP}, ${corrispettivi_02_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_02_AC {
    label: "Spesa media (Rep. 02) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_02_AC}, ${scontrino_bi.num_clienti_02_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_02_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_02_AP}, ${scontrino_bi.num_clienti_02_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_02 {
    label: "Var. Spesa media (Rep. 02)"
    type: number
    sql: safe_divide(${spesa_media_02_AC} - ${spesa_media_02_AP}, ${spesa_media_02_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 05 ##################################

  measure: corrispettivi_05_AC {
    label: "Corrispettivi (Rep. 05) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "05"]
  }

  measure: inc_corrispettivi_05_AC {
    label: "Incidenza corrispettivi (Rep. 05) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_05_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_05 {
    label: "Variazione budget % (Rep. 05)"
    type: number
    sql: safe_divide(${corrispettivi_05_AC} - ${budget_consolidato_bi.budget_05_AC}, ${budget_consolidato_bi.budget_05_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_05_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "05"]
  }

  measure: inc_corrispettivi_05_AP {
    #label: "Incidenza corrispettivi 05 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_05_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_05 {
    label: "Differenza incidenza (Rep. 05)"
    type: number
    sql: ${inc_corrispettivi_05_AC} - ${inc_corrispettivi_05_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_05 {
    label: "Var. corrispettivi (Rep. 05)"
    type: number
    sql: safe_divide(${corrispettivi_05_AC} - ${corrispettivi_05_AP}, ${corrispettivi_05_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_05_AC {
    label: "Spesa media (Rep. 05) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_05_AC}, ${scontrino_bi.num_clienti_05_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_05_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_05_AP}, ${scontrino_bi.num_clienti_05_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_05 {
    label: "Var. Spesa media (Rep. 05)"
    type: number
    sql: safe_divide(${spesa_media_05_AC} - ${spesa_media_05_AP}, ${spesa_media_05_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 07 ##################################

  measure: corrispettivi_07_AC {
    label: "Corrispettivi (Rep. 07) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "07"]
  }

  measure: inc_corrispettivi_07_AC {
    label: "Incidenza corrispettivi (Rep. 07) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_07_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_07 {
    label: "Variazione budget % (Rep. 07)"
    type: number
    sql: safe_divide(${corrispettivi_07_AC} - ${budget_consolidato_bi.budget_07_AC}, ${budget_consolidato_bi.budget_07_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_07_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "07"]
  }

  measure: inc_corrispettivi_07_AP {
    #label: "Incidenza corrispettivi 07 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_07_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_07 {
    label: "Differenza incidenza (Rep. 07)"
    type: number
    sql: ${inc_corrispettivi_07_AC} - ${inc_corrispettivi_07_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_07 {
    label: "Var. corrispettivi (Rep. 07)"
    type: number
    sql: safe_divide(${corrispettivi_07_AC} - ${corrispettivi_07_AP}, ${corrispettivi_07_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_07_AC {
    label: "Spesa media (Rep. 07) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_07_AC}, ${scontrino_bi.num_clienti_07_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_07_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_07_AP}, ${scontrino_bi.num_clienti_07_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_07 {
    label: "Var. Spesa media (Rep. 07)"
    type: number
    sql: safe_divide(${spesa_media_07_AC} - ${spesa_media_07_AP}, ${spesa_media_07_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 08 ##################################

  measure: corrispettivi_08_AC {
    label: "Corrispettivi (Rep. 08) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "08"]
  }

  measure: inc_corrispettivi_08_AC {
    label: "Incidenza corrispettivi (Rep. 08) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_08_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_08 {
    label: "Variazione budget % (Rep. 08)"
    type: number
    sql: safe_divide(${corrispettivi_08_AC} - ${budget_consolidato_bi.budget_08_AC}, ${budget_consolidato_bi.budget_08_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_08_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "08"]
  }

  measure: inc_corrispettivi_08_AP {
    #label: "Incidenza corrispettivi 08 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_08_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_08 {
    label: "Differenza incidenza (Rep. 08)"
    type: number
    sql: ${inc_corrispettivi_08_AC} - ${inc_corrispettivi_08_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_08 {
    label: "Var. corrispettivi (Rep. 08)"
    type: number
    sql: safe_divide(${corrispettivi_08_AC} - ${corrispettivi_08_AP}, ${corrispettivi_08_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_08_AC {
    label: "Spesa media (Rep. 08) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_08_AC}, ${scontrino_bi.num_clienti_08_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_08_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_08_AP}, ${scontrino_bi.num_clienti_08_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_08 {
    label: "Var. Spesa media (Rep. 08)"
    type: number
    sql: safe_divide(${spesa_media_08_AC} - ${spesa_media_08_AP}, ${spesa_media_08_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 06 ##################################

  measure: corrispettivi_06_AC {
    label: "Corrispettivi (Rep. 06) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "06"]
  }

  measure: inc_corrispettivi_06_AC {
    label: "Incidenza corrispettivi (Rep. 06) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_06_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_06 {
    label: "Variazione budget % (Rep. 06)"
    type: number
    sql: safe_divide(${corrispettivi_06_AC} - ${budget_consolidato_bi.budget_06_AC}, ${budget_consolidato_bi.budget_06_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_06_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "03"]
  }

  measure: inc_corrispettivi_06_AP {
    #label: "Incidenza corrispettivi 06 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_06_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_06 {
    label: "Differenza incidenza (Rep. 06)"
    type: number
    sql: ${inc_corrispettivi_06_AC} - ${inc_corrispettivi_06_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_06 {
    label: "Var. corrispettivi (Rep. 06)"
    type: number
    sql: safe_divide(${corrispettivi_06_AC} - ${corrispettivi_06_AP}, ${corrispettivi_06_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_06_AC {
    label: "Spesa media (Rep. 06) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_06_AC}, ${scontrino_bi.num_clienti_06_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_06_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_06_AP}, ${scontrino_bi.num_clienti_06_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_06 {
    label: "Var. Spesa media (Rep. 06)"
    type: number
    sql: safe_divide(${spesa_media_06_AC} - ${spesa_media_06_AP}, ${spesa_media_06_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 11 ##################################

  measure: corrispettivi_11_AC {
    label: "Corrispettivi (Rep. 11) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "11"]
  }

  measure: inc_corrispettivi_11_AC {
    label: "Incidenza corrispettivi (Rep. 11) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_11_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_11 {
    label: "Variazione budget % (Rep. 11)"
    type: number
    sql: safe_divide(${corrispettivi_11_AC} - ${budget_consolidato_bi.budget_11_AC}, ${budget_consolidato_bi.budget_11_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_11_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "11"]
  }

  measure: inc_corrispettivi_11_AP {
    #label: "Incidenza corrispettivi 11 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_11_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_11 {
    label: "Differenza incidenza (Rep. 11)"
    type: number
    sql: ${inc_corrispettivi_11_AC} - ${inc_corrispettivi_11_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_11 {
    label: "Var. corrispettivi (Rep. 11)"
    type: number
    sql: safe_divide(${corrispettivi_11_AC} - ${corrispettivi_11_AP}, ${corrispettivi_11_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_11_AC {
    label: "Spesa media (Rep. 11) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_11_AC}, ${scontrino_bi.num_clienti_11_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_11_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_11_AP}, ${scontrino_bi.num_clienti_11_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_11 {
    label: "Var. Spesa media (Rep. 11)"
    type: number
    sql: safe_divide(${spesa_media_11_AC} - ${spesa_media_11_AP}, ${spesa_media_11_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 10 ##################################

  measure: corrispettivi_10_AC {
    label: "Corrispettivi (Rep. 10) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "10"]
  }

  measure: inc_corrispettivi_10_AC {
    label: "Incidenza corrispettivi (Rep. 10) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_10_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_10 {
    label: "Variazione budget % (Rep. 10)"
    type: number
    sql: safe_divide(${corrispettivi_10_AC} - ${budget_consolidato_bi.budget_10_AC}, ${budget_consolidato_bi.budget_10_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_10_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "10"]
  }

  measure: inc_corrispettivi_10_AP {
    #label: "Incidenza corrispettivi 10 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_10_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_10 {
    label: "Differenza incidenza (Rep. 10)"
    type: number
    sql: ${inc_corrispettivi_10_AC} - ${inc_corrispettivi_10_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_10 {
    label: "Var. corrispettivi (Rep. 10)"
    type: number
    sql: safe_divide(${corrispettivi_10_AC} - ${corrispettivi_10_AP}, ${corrispettivi_10_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_10_AC {
    label: "Spesa media (Rep. 10) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_10_AC}, ${scontrino_bi.num_clienti_10_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_10_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_10_AP}, ${scontrino_bi.num_clienti_10_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_10 {
    label: "Var. Spesa media (Rep. 10)"
    type: number
    sql: safe_divide(${spesa_media_10_AC} - ${spesa_media_10_AP}, ${spesa_media_10_AP}) ;;
    value_format: "0.00%"
  }

################################### REPARTO 52 ##################################

  measure: corrispettivi_52_AC {
    label: "Corrispettivi (Rep. 52) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AC", codice_reparto: "52"]
  }

  measure: inc_corrispettivi_52_AC {
    label: "Incidenza corrispettivi (Rep. 52) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_52_AC}, ${corrispettivi_AC}) ;;
    value_format: "0.00%"
  }

  measure: var_budget_52 {
    label: "Variazione budget % (Rep. 52)"
    type: number
    sql: safe_divide(${corrispettivi_52_AC} - ${budget_consolidato_bi.budget_52_AC}, ${budget_consolidato_bi.budget_52_AC}) ;;
    value_format: "0.00%"
  }

  measure: corrispettivi_52_AP {
    #label: "Corrispettivi {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: sum
    sql: ${corrispettivo} ;;
    value_format: "#,##0"
    filters: [negozio_calendario.ac_vs_ap: "AP", codice_reparto: "52"]
  }

  measure: inc_corrispettivi_52_AP {
    #label: "Incidenza corrispettivi 52 {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_52_AP}, ${corrispettivi_AP}) ;;
    value_format: "0.00%"
  }

  measure: diff_inc_corrispettivi_52 {
    label: "Differenza incidenza (Rep. 52)"
    type: number
    sql: ${inc_corrispettivi_52_AC} - ${inc_corrispettivi_52_AP} ;;
    value_format: "0.00%"
  }

  measure: var_corrispettivi_52 {
    label: "Var. corrispettivi (Rep. 52)"
    type: number
    sql: safe_divide(${corrispettivi_52_AC} - ${corrispettivi_52_AP}, ${corrispettivi_52_AP}) ;;
    value_format: "0.00%"
  }

  measure: spesa_media_52_AC {
    label: "Spesa media (Rep. 52) {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_52_AC}, ${scontrino_bi.num_clienti_52_AC}) ;;
    value_format: "#,##0.00"
  }

  measure: spesa_media_52_AP {
    #label: "Spesa media {{_filters['negozio_calendario.anno_confronto_filtro']}}"
    type: number
    sql: safe_divide(${corrispettivi_52_AP}, ${scontrino_bi.num_clienti_52_AP}) ;;
    value_format: "#,##0.00"
  }

  measure: var_spesa_media_52 {
    label: "Var. Spesa media (Rep. 52)"
    type: number
    sql: safe_divide(${spesa_media_52_AC} - ${spesa_media_52_AP}, ${spesa_media_52_AP}) ;;
    value_format: "0.00%"
  }

}
