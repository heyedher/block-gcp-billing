project_name: "block-gcp-billing"

################ Constants ################

constant: CONNECTION_NAME {
  value: "bq-looker-marketplace"
  export: override_optional
}


constant: PROJECT_ID {
  value: "committed-use-discount-test"
  export: override_optional
}

constant: SCHEMA_NAME {
  value: "recommendations"
  export: override_optional
}

# Looks like it should just be a single table, so no _* notation
constant: BILLING_EXPORT_TABLE_NAME {
  value: "gcp_billing_export_resource_v1_016676_F7EDE9_45E9C2"
  export: override_optional
}
