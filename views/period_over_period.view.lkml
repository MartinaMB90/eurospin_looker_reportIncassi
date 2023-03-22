view: period_over_period {
  extension: required

  filter: settimana_confronto_filtro {
    view_label: "Settimana confronto"
    type: string
    suggest_dimension: negozio_calendario.settimana
  }

  filter: anno_confronto_filtro {
    view_label: "Anno confronto"
    type: string
    suggest_dimension: negozio_calendario.anno
  }

  dimension: ac_vs_ap {
    hidden: yes
    #view_label: "Data confronto"
    type: string
    sql: CASE
          WHEN {% condition settimana_confronto_filtro %} ${negozio_calendario.settimana} {% endcondition %} and {% condition anno_confronto_filtro %} ${negozio_calendario.anno} {% endcondition %} THEN 'AC'
          WHEN {% condition settimana_confronto_filtro %} ${negozio_calendario.settimana} {% endcondition %} and {% condition anno_confronto_filtro %} cast(cast(${negozio_calendario.anno} as int64) + 1 as string) {% endcondition %} THEN 'AP'
         END;;
  }

}
