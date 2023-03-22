view: negozio_bi {
  sql_table_name: `eur-cdp-prd-prj.REZ_BI.NEGOZIO_BI`
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

  dimension: codice_azienda {
    type: string
    sql: ${TABLE}.Codice_Azienda ;;
  }

  dimension: codice_capo_area {
    type: string
    sql: ${TABLE}.Codice_Capo_Area ;;
  }

  dimension: codice_ispettore {
    type: string
    sql: ${TABLE}.Codice_Ispettore ;;
  }

  dimension: codice_paese {
    type: string
    sql: ${TABLE}.Codice_Paese ;;
  }

  dimension: codice_reparto {
    type: string
    sql: ${TABLE}.Codice_Reparto ;;
  }

  dimension: comune {
    type: string
    sql: ${TABLE}.Comune ;;
  }

  dimension: descrizione_magazzino {
    type: string
    sql: ${TABLE}.Descrizione_Magazzino ;;
  }

  dimension: descrizione_reparto {
    type: string
    sql: ${TABLE}.Descrizione_Reparto ;;
  }

  dimension: ente_destinatario {
    type: number
    sql: ${TABLE}.Ente_Destinatario ;;
  }

  dimension: flag_reparto_gastronomia {
    type: string
    sql: ${TABLE}.Flag_Reparto_Gastronomia ;;
  }

  dimension: flag_reparto_macelleria {
    type: string
    sql: ${TABLE}.Flag_Reparto_Macelleria ;;
  }

  dimension: flag_reparto_ortofrutta {
    type: string
    sql: ${TABLE}.Flag_Reparto_Ortofrutta ;;
  }

  dimension: flag_reparto_pane {
    type: string
    sql: ${TABLE}.Flag_Reparto_Pane ;;
  }

  dimension: flag_reparto_pescheria {
    type: string
    sql: ${TABLE}.Flag_Reparto_Pescheria ;;
  }

  dimension: id_magazzino_bo {
    type: string
    sql: ${TABLE}.ID_Magazzino_BO ;;
  }

  dimension: metratura {
    type: number
    sql: ${TABLE}.Metratura ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}.Nome ;;
  }

  dimension: parita_rete {
    type: yesno
    sql: ${TABLE}.Parita_Rete ;;
  }

  dimension: provincia {
    type: string
    sql: ${TABLE}.Provincia ;;
  }

  dimension: regione {
    type: string
    sql: ${TABLE}.Regione ;;
  }

  dimension: settimana {
    type: number
    sql: ${TABLE}.Settimana ;;
  }

  dimension: tipo_negozio {
    type: string
    sql: ${TABLE}.Tipo_Negozio ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
