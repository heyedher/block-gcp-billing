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
    # Updated description to warn users about List Price behavior
    description: "The cost associated to an SKU. Note: Under the new CUD model, this reflects LIST PRICE for committed usage."
  }

# NEW MEASURE FOR CLARITY
  measure: total_list_cost {
    description: "The total gross cost before any credits or discounts are applied."
    type: sum
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }

# VERIFICATION OF TOTAL COST
  measure: total_cost {
    description: "The Net Cost. Includes: Usage Cost (List) + CUD Fees - CUD Offsets - Discounts."
    type: number
    # This logic holds true ONLY if gcp_billing_export_credits includes ALL credit types, which is our case for this block
    sql: ${cost_before_credits} + ${gcp_billing_export_credits.total_credit} ;;
    value_format_name: decimal_2
  }


}
