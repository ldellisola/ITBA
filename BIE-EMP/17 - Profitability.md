# Investment Profitability

A firm has to make an investment when it needs to replace capital to continue operations, reduce costs or expand their line of products. In all cases it has to be determined  whether such investment is profitable.

## Net Present Value

The **Net Present Value (NVP)** method is the primary capital budgeting decision criterion. It is a direct measure of the project's contribution to shareholder wealth. This method consists of finding the present value for each cash flow, including the initial cost and using the following formula:
$$
\text{NPV} = \sum_{t=0}^T \frac{CF_t}{(1+\text{WACC})^t}
$$
This measure tells us by how much the project should increase the shareholder wealth. If the $\text{NPV}$ is negative, it is not profitable, and the higher the $\text{NPV}$, the more profitable the project is. 

## Internal Rate of Return

There exists a maximal value of the cost of capital for which the $\text{NPV}$ is non-negative, this maximal value is called the **internal rate of return (IRR)**. This measure tells us how much a project yields over the cost of capital.

The IRR is defined as the discount rate that forces the project's NPV to be equal to 0:
$$
0 = \sum_{t=0}^T\frac{CF_t}{(1+IRR)^t}
$$
The project should only be accepted if:
$$
\text{IRR} > \text{WACC}
$$
The $\text{IRR}$ and $\text{NPV}$ criteria often give the same result, but they can also be in conflict.

## Payback Period

The Payback criterion tells us when we get our investment back. It tells us the number of years that will take for us to recover a project's costs from operating cash flows. The payback year is the year prior to a full recovery plus a fraction equal to the shortfall at the end of the year divided by the cash flow during the full recovery year. 

## Scenario Analysis

The scenario analysis is a technique that brings in the probabilities of changes in the key variables and it allows us to change more than one variable at a time. It is used to mitigate risk. The idea here is to estimate a bad scenario, our expected scenario and a good scenario for our project. 

We need to investigate the following input values:

- The collection and estimation of input data.
- The specification of depreciation schedule.
- Salvage value calculations.
- Cash flows predictions.
- Appraisals of the proposed project.

From this we will calculate the $\text{NPV}$ of each case and calculate the expected value and standard deviation:
$$
\text{E[NPV]} = p_1 \times NPV_1 + p_2 \times NPV_2 + p_3 \times NPV_3 \\
\sigma_{NPV} = \sqrt{p_1 \times \text{NPV}_1^2 + p_2 \times \text{NPV}_2^2 + p_3 \times \text{NPV}_3^2 -\text{E[NPV]}^2}
$$
The expected value tells us what is the value of $\text{NPV}$ that we are most likely to get from this project and the standard deviation will show us how big the risk is that the value of $\text{NPV}$ will deviate from our expectations. This analysis can be resumed into the **coefficient of variation**:
$$
CV_{NPV} = \frac{\sigma_{NPV}}{\text{E[NPV]}}
$$
