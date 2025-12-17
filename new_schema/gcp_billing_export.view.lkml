include: "/views/gcp_billing_export.view.lkml"
view: +gcp_billing_export {

  dimension: consumption_model_type {
    type: string
    description: "Indicates if the usage is 'Default' (On-Demand) or covered by a CUD."
    sql: ${TABLE}.consumption_model.description ;;
    group_label: "CUD Analysis"
  }

  dimension: list_price {
    type: number
    description: "The gross list price of the SKU."
    sql: ${TABLE}.price.list_price ;;
    value_format_name: decimal_4
  }

  measure: cost_before_credits {
    description: "The cost associated to an SKU. Note: Under the new CUD model, this reflects LIST PRICE for committed usage."
  }

  measure: total_list_cost {
    description: "The total gross cost before any credits or discounts are applied."
    type: sum
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }

  measure: total_cost {
    description: "The Net Cost. Includes: Usage Cost (List) + CUD Fees - CUD Offsets - Discounts."
    type: number
    sql: ${cost_before_credits} + ${gcp_billing_export_credits.total_credit} ;;
    value_format_name: decimal_2
  }


}
