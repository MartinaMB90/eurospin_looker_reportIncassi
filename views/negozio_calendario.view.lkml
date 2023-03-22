include: "period_over_period.view.lkml"
view: negozio_calendario {
  sql_table_name: `eur-cdp-prd-prj.REZ_BI.NEGOZIO_CALENDARIO`
    ;;

  extends: [period_over_period]

  dimension: key {
    primary_key: yes
    hidden: yes
    type:  string
    sql: ${anno} || ${settimana} || ${ente_destinatario} || coalesce(${codice_reparto}, "") ;;
  }

  dimension: key_completa {
    hidden: yes
    type:  string
    sql: ${anno} || ${settimana} || ${ente_destinatario} || coalesce(${codice_reparto}, "") ;;
  }

  dimension: key_budget {
    hidden: yes
    type:  string
    sql: ${anno} || ${ente_destinatario} || coalesce(${codice_reparto}, "") ;;
  }

  dimension: key_produttivita {
    hidden: yes
    type:  string
    sql: ${anno} || ${ente_destinatario} ;;
  }

  dimension: key_ore {
    hidden: yes
    type:  string
    sql: ${anno} || ${settimana} || ${ente_destinatario} ;;
  }

  dimension: anno {
    type: string
    sql: cast(${TABLE}.Anno as string) ;;
  }

  dimension: codice_reparto {
    type: string
    sql: ${TABLE}.Codice_Reparto ;;
  }

  dimension: ente_destinatario {
    type: number
    sql: ${TABLE}.Ente_Destinatario ;;
  }

  dimension: settimana {
    type: string
    sql: cast(${TABLE}.Settimana as string) ;;
  }
}
