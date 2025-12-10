include: "/views/gcp_billing_export.view"
view: +gcp_billing_export {

  derived_table: {
    sql:
      SELECT
        *,
        GENERATE_UUID() as pk
      FROM
        `@{PROJECT_ID}.@{SCHEMA_NAME}.@{BILLING_EXPORT_TABLE_NAME}`

      WHERE
        {% condition date_filter %} _PARTITIONTIME {% endcondition %};;

  }

  dimension: cost_at_effective_price_default {
    type: number
    sql: ${TABLE}.cost_at_effective_price_default ;;
    hidden: yes
  }

  dimension: consumption_model_id {
    type: string
    sql: ${TABLE}.consumption_model.id ;;
    group_label: "CUD Metadata (New Schema)"
  }


  dimension: subscription_instance_id {
    type: string
    sql: ${TABLE}.subscription.instance_id ;;
    group_label: "CUD Metadata (New Schema)"
  }


  dimension: cud_model_version_simulated {
    type: string
    sql: ${TABLE}.cud_model_version_simulated ;;
    hidden: yes
  }


  measure: cost_before_credits {
    type: sum
    sql: ${cost_at_effective_price_default} ;;
  }

  dimension: credit_name {
    sql: ${gcp_billing_export_credits.credit_name} ;;
  }

  measure: total_cost {
    type: number
    sql: SUM(${cost}) ;;
    fanout_on: "credit_name"
  }

  measure: total_cud_savings {
    label: "Total CUD Savings (New Model)"
    description: "Total savings from CUDs (Gross Cost - Net Cost)."
    type: number
    value_format_name: usd
    sql: ${cost_before_credits} - ${total_cost} ;;
  }

}
