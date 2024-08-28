# The name of this view in Looker is "Fact Spends"
view: fact_spends {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "BANKING"."FACT_SPENDS" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}."PAYMENT_TYPE" ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}."SPEND" ;;
  }

  #measure: total_spend {
  #  type: sum
   # sql: ${spend}/ 1000000 ;;
    #}

  measure: average_spend {
    type: average
    sql: ${spend} ;;
    }
    measure: Avg_income_utilisation{
      type: number
      sql: ${average_spend}/${dim_customers.avg_income1}*100 ;;
    }
  measure: Total_spend {
    type: sum
    sql: ${spend} ;;
  }

}
