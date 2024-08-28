# The name of this view in Looker is "Dim Customers"
view: dim_customers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "BANKING"."DIM_CUSTOMERS" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age Group" in Explore.

  dimension: age_group {
    type: string
    sql: ${TABLE}."AGE_GROUP" ;;
  }

  dimension: avg_income {
    type: number
    sql: ${TABLE}."AVG_INCOME" ;;
    value_format: "$0.00"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_income {
    type: sum
    sql: ${avg_income} ;;  }
  measure: average_avg_income {
    type: average
    sql: ${avg_income} ;;  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}."MARITAL_STATUS" ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}."OCCUPATION" ;;
  }
  measure: count {
    type: count
  }
}
