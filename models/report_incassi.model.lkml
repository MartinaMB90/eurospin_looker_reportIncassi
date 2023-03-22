connection: "eurospin_semantic_layer"

# include all the views
include: "/views/**/*.view"

datagroup: report_incassi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: report_incassi_default_datagroup

explore: negozio_calendario {

  join: negozio_bi {
    type: full_outer
    relationship: one_to_many
    sql_on: ${negozio_calendario.key_completa} = ${negozio_bi.key} ;;
  }

  join: movimento_magazzino_bi {
    type: full_outer
    relationship: one_to_many
    sql_on: ${negozio_calendario.key_completa} = ${movimento_magazzino_bi.key} ;;
  }

  join: scontrino_bi {
    type: full_outer
    relationship: one_to_many
    sql_on: ${negozio_calendario.key_completa} = ${scontrino_bi.key} ;;
  }

  join: budget_consolidato_bi {
    type: full_outer
    relationship: one_to_one
    sql_on: ${negozio_calendario.key_completa} = ${budget_consolidato_bi.key} ;;
  }

  join: ore_lavorate_bi {
    type: full_outer
    relationship: one_to_many
    sql_on: ${negozio_calendario.key_ore} = ${ore_lavorate_bi.key} ;;
  }

  join: negozio_produttivita_obiettivo_bi {
    type: full_outer
    relationship: one_to_many
    sql_on: ${negozio_calendario.key_produttivita} = ${negozio_produttivita_obiettivo_bi.key} ;;
  }
}
