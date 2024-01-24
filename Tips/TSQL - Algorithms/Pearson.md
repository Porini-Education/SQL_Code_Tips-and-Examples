# Pearsons Correlation

<https://www.red-gate.com/simple-talk/blogs/statistics-sql-pearsons-correlation/>

This SQL script is calculating the Pearson correlation coefficient, often referred to as "Pearson's r", between two sets of data. The Pearson correlation coefficient is a measure of the linear correlation between two variables, giving a value between +1 and −1, where 1 is total positive linear correlation, 0 is no linear correlation, and −1 is total negative linear correlation.

This formula calculates the covariance of `x` and `y` (the numerator), and divides it by the product of the standard deviations of `x` and `y` (the denominator). The result is the Pearson correlation coefficient, which is returned as the result of the query.

In the table variable `@OurData` the columns `x` and `y` hold the pairs of data points for which the correlation is to be calculated.

```SQL
DECLARE @OurData TABLE
 (
 x NUMERIC(18, 6) NOT NULL,
 y NUMERIC(18, 6) NOT NULL
 );

INSERT INTO @OurData
 (x, y)
VALUES
 (10, 7),
 (9, 13),
 (13, 11),
 (9, 8),
 (12, 13),
 (9, 11),
 (10, 11),
 (10, 12),
 (9, 8),
 (11, 9),
 (13, 13),
 (10, 11),
 (14, 15),
 (11, 13),
 (8, 8),
 (13, 13),
 (13, 11),
 (12, 10),
 (10, 12),
 (12, 7),
 (10, 12),
 (10, 12),
 (7, 9),
 (10, 11),
 (11, 8);

SELECT ((SUM(x * y)- (SUM(x) * SUM(y)) / COUNT(*)
    )
   )
   / (SQRT(SUM(x * x)
           - (SUM(x) * SUM (x)) / COUNT(*)
          )
      * SQRT(SUM(y * y)
             - (SUM(y) * SUM(y)) / COUNT(*)
            )
     ) AS 'Pearsons r'
 FROM @OurData;

 -- oppure
 SELECT (Avg(x * y) - (Avg(x) * Avg(y))) / (StDevP(x) * StDevP(y)) AS 'Pearsons r'
 FROM @ourData;
```
