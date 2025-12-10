# include: "/views/new_schema/**.view"

# explore: gcp_billing_export {
#   hidden: yes
#   join: gcp_billing_export_tags {
#     view_label: "Gcp Billing Unified Partitioned Table: Tags"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export.tags}) as gcp_billing_unified_partitioned_table__tags ;;
#     relationship: one_to_many
#   }

#   join: gcp_billing_export_labels {
#     view_label: "Gcp Billing Unified Partitioned Table: Labels"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export.labels}) as gcp_billing_unified_partitioned_table__labels ;;
#     relationship: one_to_many
#   }

#   join: gcp_billing_export_credits {
#     view_label: "Gcp Billing Unified Partitioned Table: Credits"
#     sql: LEFT JOIN UNNEST(${gcp_billing_export.credits}) as gcp_billing_unified_partitioned_table__credits ;;
#     relationship: one_to_many
#   }

#   join: gcp_billing_export_service {
#     view_label: "GCP Billing"
#     relationship: one_to_one
#     sql: LEFT JOIN UNNEST([${gcp_billing_export.service}]) AS gcp_billing_export_service ;;
#   }

#   # join: gcp_billing_export__project__labels {
#   #   view_label: "Gcp Billing Unified Partitioned Table: Project Labels"
#   #   sql: LEFT JOIN UNNEST(${gcp_billing_export.project__labels}) as gcp_billing_unified_partitioned_table__project__labels ;;
#   #   relationship: one_to_many
#   # }
#   # join: gcp_billing_export_project__ancestors {
#   #   view_label: "Gcp Billing Unified Partitioned Table: Project Ancestors"
#   #   sql: LEFT JOIN UNNEST(${gcp_billing_export.project__ancestors}) as gcp_billing_unified_partitioned_table__project__ancestors ;;
#   #   relationship: one_to_many
#   # }
# }
