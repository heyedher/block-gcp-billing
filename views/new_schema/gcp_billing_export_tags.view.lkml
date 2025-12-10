view: gcp_billing_export_tags {

  dimension: gcp_billing_export__tags {
    type: string
    hidden: yes
    sql: gcp_billing_export__tags ;;
  }
  dimension: inherited {
    type: yesno
    sql: inherited ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: namespace {
    type: string
    sql: namespace ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}
