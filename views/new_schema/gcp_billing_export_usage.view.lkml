view: gcp_billing_export_usage {

  ### Field description reference https://cloud.google.com/billing/docs/how-to/export-data-bigquery
### DIMENSIONS

  dimension: usage {
    group_label: "Resource Usage"
    description: "The quantity of usage units used"
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: unit {
    group_label: "Resource Usage"
    label: "Resource"
    description: "The base unit in which resource usage is measured."
    type: string
    sql: ${TABLE}.unit ;;
  }

  dimension: usage__amount {
    type: number
    sql: ${TABLE}.usage.amount ;;
    group_label: "Usage"
    group_item_label: "Amount"
  }
  dimension: usage__amount_in_pricing_units {
    type: number
    sql: ${TABLE}.usage.amount_in_pricing_units ;;
    group_label: "Usage"
    group_item_label: "Amount In Pricing Units"
  }
  dimension: usage__pricing_unit {
    type: string
    sql: ${TABLE}.usage.pricing_unit ;;
    group_label: "Usage"
    group_item_label: "Pricing Unit"
  }
  dimension: usage__unit {
    type: string
    sql: ${TABLE}.usage.unit ;;
    group_label: "Usage"
    group_item_label: "Unit"
  }
}
