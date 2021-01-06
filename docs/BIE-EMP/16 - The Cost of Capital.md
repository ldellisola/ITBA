# The Cost of Capital

Firms need capital to finance the increase of assets necessary for their operations. The items of the balance sheet that represent debt, equity and stock are called **capital components**. Any increase in total assets must be financed by an increase in capital components.

Debt is usually raised by issuing bonds or borrowing money, while equity is obtained issuing new common stock or by retaining earnings.

## Optimal Capital Structure

Each firm has its own optimal capital structure, defined as the mix of debt, preferred stock and common equity that causes the stock price to be maximized. The target proportions of debt $(w_d)$, preferred stock $(w_p)$ and equity $(w_s)$ along with the costs of those components make up the firm's **Weighted Average Cost of Capital (WACC)**:
$$
\text{WACC} = w_d r_d(1-\text{tax}) + w_pr_p + w_sr_s
$$


### Cost of Debt

The cost of debt is the interest rate minus tax savings and it is calculated as:
$$
\text{Cost of Debt} = r_d(1-T)
$$
 Where $r_d$ is the interest rate on debt and $T$ is the tax rate

### Cost of Preferred Stock

The cost of preferred stock is the preferred dividend yield and it is calculated with the following formula:
$$
\text{Cost of preferred stock} = r_p = \frac{D_p}{P_p}
$$
Where $D_p$ is the preferred dividend and $P_p$  is the current price of the preferred stock. No tax adjustments are made because preferred dividends are not deductible.

### Cost of Equity

The costs of equity is based on the rate of return investors require on the company's common stock, and it can be modifies by issuing more common stock or retaining earnings. Equity raised by issuing stock has a higher cost for the company, so after the start-up stage most companies obtain all their equity by retaining earnings.

The actual value of the cost of equity can be calculated using 2 different metrics:

1. **Capital Asset Pricing Model (CAPM)**: This approach requires to follow some steps:

   1. Estimate the risk-free rate $r_{RF}$

   2. Estimate the stock's beta coefficient $\beta$

   3. Estimate the expected market risk premium ($r_M$) as the difference between the return that investors require to hold an average stock ($r_{RF}$) and the risk free rate.

   4. Calculate the cost of retained earnings:
      $$
      r_s = r_{RF} + \beta \times (r_M - r_{RF})
      $$
      Where 

   The problem with this approach is the difficulty to estimate $\beta$ and $r_M$

2. **Discounted Cash Flow (DCF)**: For companies that are expected to go on indefinitely, the cash flows are the dividends and so the price should reflect the NPV of the dividends stream:
   $$
   P_0 = \sum_{t=1}^{+\infty} \frac{D_t}{(1+r_s)^t}
   $$
   If we can assume that the dividends grow at a fixed rate $g$, we can express $P_0$ as:
   $$
   P_0 = \frac{D_1}{r_s - g}
   $$
   and we can obtain the cost of retained earnings as:
   $$
   r_s = \frac{D_1} {P_0 + g}
   $$
   We still have to estimate $g$, and we can do it with the return on equity:
   $$
   g = \text{Retention rate} \times \text{ROE} = (1- \text{Payout rate}) \times \text{ROE}
   $$
   This expresses that the company growth is proportional to reinvested retained earnings.

3. Our third option is to add the risk premium to the bond yield:
   $$
   r_s = \text{Bond yield} + \text{Risk premium}
   $$
   Empirically it has been determined that the risk premium over its own stock generally ranges between 3% and 5%

