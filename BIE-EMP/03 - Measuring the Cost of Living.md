# Measuring the Cost of Living

## The Consumer Price Index (CPI)

The Consumer Price Index measures the typical consumer's cost of living and it is the basis of cost of living adjustments in many contracts and in social security.

### How it is calculated

1. **Fix the Basket**: The government surveys consumers to determine what's in the typical consumer's "shopping basket".

2. **Find the Prices**: The government collects data on the prices of all the goods in the basket.

3. **Compute the Basket's Cost**: Calculate the total cost of the basket.

4. **Choose a base year and compute the index**: The CPI in any year is:
   $$
   100 \times \frac {\text{cost of basket in current year}} 
   {\text{cost of basket in base year}}
   $$

5. **Compute the inflation rate**: The inflation rate is calculated as the change in CPI from the preceding period:
   $$
   \text{inflation rate} = \frac {\text{CPI (this year)} - \text{CPI (last year)}} 
   {\text{CPI (last year)}} \times 100
   $$

### Problems with CPI

- **Substitution Bias**: Over time, some prices rise faster than others. This leads customers to  change goods towards the ones that are relatively cheaper, mitigating the effect of the price increases. The CPI misses this substitution because it uses a fixed basket of goods.
- **Introduction of New Goods**: The introduction of new goods increases variety, allowing consumers to find better products that more closely meet their needs. But again, the CPI misses this effect because the basket of goods doesn't change.
- **Unmeasured Quality Changes**: Improvements in the quality of goods in the basket increase the value of each dollar. The CPI tries to account for these changes but it is hard to measure quality.

## CPI vs GDP Deflator

The CPI and the GDP Deflator are both used to calculate the current inflation rate, but their approach is very different.

When it comes to *consumer goods*, they are included in the CPI, but not in the GDP deflator. In the case of *capital goods*, they are excluded from the CPI but included in the GDP deflator if they where produced domestically. 

## Correcting for Inflation

Inflation makes it harder to compare dollar amounts from different times. In order to compare them, we need to use the following formula:
$$
\text{today's dollars}=
\text{year $T$ dollars} \times
\frac {\text{price level today}}
{\text{price leve in year $T$}}
$$

### Indexation

A dollar amount is indexed for inflation if it is automatically corrected for inflation by law or contract.

### Real vs Nominal Interest Rates

Nominal interest rates are not corrected for inflation and represent the rate of growth in the dollar value of a deposit or debt.

On the other side, the real interest rate is corrected for inflation and measures the rate of growth in the purchasing power of a deposit or debit.

Real interest rate is calculated as:
$$
\text{real interest rate} = 
\text{ nominal interest rate}
-
\text{inflation rate}
$$


