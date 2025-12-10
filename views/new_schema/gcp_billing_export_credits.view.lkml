view: gcp_billing_export_credits {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: id ;;
  }
  dimension: amount {
    type: number
    sql: amount ;;
  }
  dimension: full_name {
    type: string
    sql: full_name ;;
  }
  dimension: gcp_billing_export__credits {
    type: string
    hidden: yes
    sql: gcp_billing_export__credits ;;
  }
  dimension: name {
    type: string
    sql: name ;;
  }
  dimension: type {
    type: string
    sql: type ;;
  }
}
