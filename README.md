# SQL Server Learning Journey 📚
Welcome to my repository dedicated to exploring and mastering **SQL Server**! I have already covered the basics and some advanced topics, and this repo is my ongoing documentation as I dive deeper into the **intermediate** and **advanced** areas of the SQL Server platform.

## 🔍 Purpose of this Repository
- **Building on the Basics:** While I’ve already mastered the foundational aspects, I’m now focusing on advanced concepts and real-world scenarios.
- **Deep Dive Exploration:** This repo is my space to explore and experiment with more complex topics, performance optimizations, and advanced data management techniques.
- **Open Notes:** The notes and resources shared here are intended to help others who want to go beyond the basics and tackle the next level of SQL Server.

## 👏 Acknowledgment & Credits
A big thank you to **Barra Salkini** for the insightful videos and notes that have been instrumental in my learning journey. If you're starting out or want to revisit the basics, I highly recommend checking out his channel:

👉 [Data with Barra YouTube Channel](https://youtu.be/SSKVgrwhzus?si=ozHvEIsNu2xXt2H7)

## 📝 Repository Contents
Here’s what you’ll find in this repo:
- **Intermediate and Advanced Topics**: In-depth exploration of performance tuning, advanced indexing, query optimization, and more.
- **Real-world Scenarios**: Examples and hands-on exercises to solidify concepts.
- **Notes (by Barra)**: Summaries, key takeaways, material prepared by Barra.

## 🚀 How to Use This Repo
- Dive into the **intermediate and advanced topics** directly.
- Use the notes and examples as references or supplements for your own learning.
- Adapt the material to your own real-world use cases or testing environments.

## 💡 Contributions
This is primarily a personal learning project, but feel free to open issues or suggest improvements!

## 📢 License
Please respect the original content creators (like Barra) and their work. This repo is **for educational purposes only**, and all credit goes to the respective authors.

---

Happy learning and exploring! 🌟

---

# 📘 Intermediate SQL Notes – SQL Server

*Study Source: [Data with Baraa – YouTube Channel](https://www.youtube.com/@DataWithBaraa)*

This document outlines all the intermediate-level SQL Server concepts I studied to enhance my understanding of SQL, focusing on functions, window operations, ranking, and use cases. Each concept includes syntax, use cases, and examples for practical understanding.

---

## 1. SQL Functions

### 1.1 String Functions

#### 1.1.1 Manipulations

* **`CONCAT(str1, str2, ...)`**
  Joins two or more strings together.

  ```sql
  SELECT CONCAT('Data', 'Verse'); -- Output: DataVerse
  ```

* **`UPPER(string)`**
  Converts all letters to uppercase.

  ```sql
  SELECT UPPER('anish'); -- Output: ANISH
  ```

* **`LOWER(string)`**
  Converts all letters to lowercase.

  ```sql
  SELECT LOWER('SQL'); -- Output: sql
  ```

* **`TRIM(string)`**
  Removes leading and trailing spaces.

  ```sql
  SELECT TRIM(' SQL '); -- Output: SQL
  ```

#### 1.1.2 String Extractions

* **`LEFT(string, n)`**
  Extracts the first `n` characters.

  ```sql
  SELECT LEFT('Dataverse', 4); -- Output: Data
  ```

* **`RIGHT(string, n)`**
  Extracts the last `n` characters.

  ```sql
  SELECT RIGHT('Dataverse', 4); -- Output: erse
  ```

* **`SUBSTRING(string, start, length)`**
  Extracts part of a string starting from `start` with `length` characters.

  ```sql
  SELECT SUBSTRING('Dataverse', 5, 3); -- Output: ver
  ```

#### 1.1.3 Calculations

* **`LEN(string)`**
  Returns the length of the string.

  ```sql
  SELECT LEN('Data'); -- Output: 4
  ```

---

### 1.2 Date and Time Functions

#### 1.2.1 Part Extraction Functions

* **`DAY(date)`**, **`MONTH(date)`**, **`YEAR(date)`**
  Extract respective parts from a date.

  ```sql
  SELECT DAY('2024-06-01'), MONTH('2024-06-01'), YEAR('2024-06-01');
  ```

* **`DATEPART(part, date)`**
  Extracts numeric part (e.g. month, year, quarter).

  ```sql
  SELECT DATEPART(QUARTER, '2024-06-18'); -- Output: 2
  ```

* **`DATENAME(part, date)`**
  Returns the name of the part (e.g. Monday, June).

  ```sql
  SELECT DATENAME(MONTH, '2024-06-18'); -- Output: June
  ```

* **`EOMONTH(date)`**
  Returns the last date of the month.

  ```sql
  SELECT EOMONTH('2024-06-18'); -- Output: 2024-06-30
  ```

#### 1.2.2 Format and Casting

* **`CAST(expression AS datatype)`**
  Converts data from one type to another.

  ```sql
  SELECT CAST(123 AS VARCHAR); -- Output: '123'
  ```

* **`CONVERT(datatype, expression, style)`**
  Converts and optionally formats date/time.

  ```sql
  SELECT CONVERT(VARCHAR, GETDATE(), 103); -- Output: dd/mm/yyyy
  ```

* **`FORMAT(value, format)`**
  Formats the output using .NET-style format strings.

  ```sql
  SELECT FORMAT(GETDATE(), 'dd-MM-yyyy'); -- Output: 18-06-2025
  ```

#### 1.2.3 Calculations

* **`DATEADD(part, number, date)`**
  Adds or subtracts time.

  ```sql
  SELECT DATEADD(DAY, 10, '2024-06-01'); -- Output: 2024-06-11
  ```

* **`DATEDIFF(part, start_date, end_date)`**
  Calculates difference between two dates.

  ```sql
  SELECT DATEDIFF(DAY, '2024-06-01', '2024-06-18'); -- Output: 17
  ```

---

### 1.3 NULL Handling

* **`IS NULL / IS NOT NULL`**
  Filters NULL values.

  ```sql
  SELECT * FROM users WHERE email IS NULL;
  ```

* **`ISNULL(value, replacement)`**
  Replaces NULL with a default.

  ```sql
  SELECT ISNULL(NULL, 'N/A'); -- Output: N/A
  ```

---

## 2. Window Functions

* Allow performing calculations across a set of rows **related to the current row**, **without collapsing** the result.

### 2.1 `OVER()` Clause

Defines the window or the set of rows to perform a function on.

### 2.2 `PARTITION BY`

Divides the result set into groups (like GROUP BY but does not reduce rows).

```sql
SUM(sales) OVER (PARTITION BY region)
```

### 2.3 Frame Clause

Defines row range relative to the current row.

* **`CURRENT ROW`**: Current row.
* **`n PRECEDING`**: `n` rows before.
* **`n FOLLOWING`**: `n` rows after.

```sql
SUM(sales) OVER (ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
```

---

## 3. Window Aggregate Functions

These perform aggregate calculations but **keep row context**.

* **`SUM()`**
* **`AVG()`**
* **`MIN()`**
* **`MAX()`**
* **`COUNT()`**

```sql
SELECT 
  employee_id,
  salary,
  SUM(salary) OVER (PARTITION BY department_id) AS total_dept_salary
FROM employees
```

---

## 4. Window Function Use Cases

### 4.1 Running Total

```sql
SUM(sales) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
```

### 4.2 Rolling Total (e.g., last 3 months)

```sql
SUM(sales) OVER (ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
```

### 4.3 Data Quality Checks

Using `ROW_NUMBER()` to detect duplicate records.

```sql
SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS row_num FROM users;
```

---

## 5. Window Rank Functions

Used to assign rank to rows based on order.

### 5.1 Integer-Based Ranking

* **`ROW_NUMBER()`**: Unique row number.
* **`RANK()`**: Tied ranks get the same number, but next ranks are skipped.
* **`DENSE_RANK()`**: No skipped ranks.
* **`NTILE(n)`**: Divides rows into `n` approximately equal groups.

```sql
SELECT 
  name,
  salary,
  RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
```

### 5.2 Percentage-Based Ranking

* **`CUME_DIST()`**: Cumulative distribution.
* **`PERCENT_RANK()`**: Relative percentile rank between 0 and 1.

```sql
SELECT 
  name,
  salary,
  CUME_DIST() OVER (ORDER BY salary) AS cum_dist
FROM employees;
```

---

## 6. Window Value Functions

### 6.1 `LEAD(column, offset)`

Returns a value from the next row.

```sql
LEAD(salary, 1) OVER (ORDER BY joining_date)
```

### 6.2 `LAG(column, offset)`

Returns a value from the previous row.

```sql
LAG(salary, 1) OVER (ORDER BY joining_date)
```

### 6.3 `FIRST_VALUE(column)`

Returns the first value in the partition.

```sql
FIRST_VALUE(salary) OVER (PARTITION BY dept ORDER BY joining_date)
```

### 6.4 `LAST_VALUE(column)`

Returns the last value in the partition.

```sql
LAST_VALUE(salary) OVER (PARTITION BY dept ORDER BY joining_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
```

### 6.5 Use Case: Customer Retention Analysis

Check if a customer placed an order in the following month:

```sql
SELECT 
  customer_id,
  order_month,
  LAG(order_month, 1) OVER (PARTITION BY customer_id ORDER BY order_month) AS previous_order
FROM orders;
```

---

