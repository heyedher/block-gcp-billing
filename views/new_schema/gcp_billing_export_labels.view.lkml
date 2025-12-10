view: gcp_billing_export_labels {

  dimension: gcp_billing_export__labels {
    type: string
    hidden: yes
    sql: gcp_billing_export__labels ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}
