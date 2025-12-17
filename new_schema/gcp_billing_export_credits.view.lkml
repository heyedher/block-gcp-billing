include: "/views/gcp_billing_export_credits.view.lkml"

view: +gcp_billing_export_credits {

  dimension: credit_type {
    type: string
    description: "The type of credit (e.g., FEE_UTILIZATION_OFFSET, COMMITTED_USAGE_DISCOUNT)."
    sql: ${TABLE}.type ;;
  }

}
