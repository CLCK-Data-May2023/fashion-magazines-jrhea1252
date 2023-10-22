SELECT 
    c.customer_name as Customer,
    PRINTF('$%.2f', SUM(s.price_per_month * s.subscription_length)) as "Amount Due"
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    subscriptions s ON o.subscription_id = s.subscription_id
WHERE 
    s.description = 'Fashion Magazine' AND o.order_status = 'unpaid'
GROUP BY 
    c.customer_name;