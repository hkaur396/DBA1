-- Assignment 1: Fetching Data from Single and Multiple Tables
-- database : ap
USE ap;

-- 1. Basic SELECT Statement
-- Fetch all columns from vendors table, ordered by vendor_id
SELECT *
FROM vendors
ORDER BY vendor_id;

-- 2. WHERE Clause
-- Fetch vendor_name, vendor_phone, and vendor_city for vendors in CA
SELECT vendor_name, vendor_phone, vendor_city
FROM vendors
WHERE vendor_state = 'CA'
ORDER BY vendor_name;

-- 3. Sorting Results
-- Fetch invoice_id, invoice_total, and invoice_date sorted by invoice_total DESC
SELECT invoice_id, invoice_total, invoice_date
FROM invoices
ORDER BY invoice_total DESC;
-- 4. Limiting Results
-- Fetch invoices with the 3rd to 9th lowest invoice_total
SELECT invoice_id, invoice_total
FROM invoices
ORDER BY invoice_total
LIMIT 2, 7; -- Skips first 2 rows, then fetches next 7 (3rd to 9th)

-- 5. Using Arithmetic
-- Fetch invoice_id, invoice_total, and remaining balance (invoice_total - payment_total)
SELECT invoice_id, invoice_total, 
       (invoice_total - payment_total) AS remaining_balance
FROM invoices
ORDER BY invoice_id;

-- 6. Inner Join
-- Fetch invoice_id, invoice_total, vendor_name, and vendor_phone using inner join
SELECT i.invoice_id, i.invoice_total, v.vendor_name, v.vendor_phone
FROM invoices i
JOIN vendors v ON i.vendor_id = v.vendor_id
ORDER BY i.invoice_id;

-- 7. Outer Join (LEFT JOIN)
-- Fetch all vendor names and invoice IDs, including vendors with no invoices
SELECT v.vendor_name, i.invoice_id
FROM vendors v
LEFT JOIN invoices i ON v.vendor_id = i.vendor_id
ORDER BY v.vendor_name;

-- 8. Outer Join 2 (RIGHT JOIN with ex database)
-- Fetch department names with employee last names, including employees with no department
USE ex;
SELECT d.department_name, e.last_name AS employee_last_name
FROM departments d
RIGHT JOIN employees e ON d.department_number = e.department_number
ORDER BY d.department_number;

-- 9. Using CONCAT
-- Combine contact first and last names with vendor names
USE ap;
SELECT CONCAT(vc.first_name, ' ', vc.last_name) AS contact_name, v.vendor_name
FROM vendor_contacts vc
JOIN vendors v ON vc.vendor_id = v.vendor_id
ORDER BY contact_name;

-- 10. UNION
-- Fetch unique first names from employees and sales_reps tables in ex database
USE ex;
SELECT first_name FROM employees
UNION
SELECT rep_first_name AS first_name FROM sales_reps
ORDER BY first_name;

-- 11. Complex Query with Multiple Joins
-- Fetch invoice_id, invoice_total, vendor_name, and terms_description
USE ap;
SELECT i.invoice_id, i.invoice_total, v.vendor_name, t.terms_description
FROM invoices i
JOIN vendors v ON i.vendor_id = v.vendor_id
JOIN terms t ON i.terms_id = t.terms_id
ORDER BY i.invoice_id;

