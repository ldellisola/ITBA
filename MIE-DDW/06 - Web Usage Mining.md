# Web Usage Mining

There are 3 stages of web user mining:

- **Data Collection and Preprocessing**: It gathers information, cleans it and structures it.
- **Pattern Discovery**: It detects hidden patterns using statistical, database, and machine learning operations.
- **Pattern Analysis**: It filters and aggregates data to generate rules and patterns.

## Data Collection

Usage data is the primary source of information for this process. It feeds of web and application server logs and it contains the following information: time, IP address, resource + parameters, status, HTTP method, User-Agent and sometimes cookies.

All of this is aggregated by pageview (collection of resources representing one user-action) and session (sequence of pageviews during one visit). 

The data can be collected in two ways:

- **Explicitly**: This is the simplest method, where the user fills forms and ratings. This has potentially very high quality data, but users are less likely to fill in the forms.

- **Implicitly**: This is a non-invasive way where the websites track the actions of the users across many channels and then they have to try to interpret the users actions. The most common way of collecting this data is either with web logs or with client-side JavaScript trackers. There is also support within CSS to inject content into HTML elements or to change the style after a user performs an action.

  

### Data Structure

The data collected is split into 3 main categories, user data, content data, and structure data.

The **content data** obtained is usually textual data and multimedia, along with some metadata and domain ontology, such as page categories. For **structure data** we refer to content organization within the site, mainly the hyperlink structure. From the user we can also obtain some **user data** such as registration form, demographics, user rating and historical data among others.

## Preprocessing

Preprocessing can be split in different stages. Fist we must **clean the data** by removing irrelevant items, log entries produced by crawlers or errors. Then we have to **identify pageviews**. This is heavily dependent on the way of collecting data, for example if it is by log entries or JS trackers.

**User identification** consists on assigning an unique user identifier to all entries coming from one user, this can be done wither by client-side cookies, IP address or fingerprints. The next step is **session  identification**, where we group log entries to sequences related to one user visit. This can be done either with time entries or with navigation heuristics. Sometimes some entries may be missing sue to caching or errors, in those cases we have to perform **path completion** to keep track of the following entries.

## Pattern Discovery

After preprocessing our data we would have a set of pageviews:
$$
P=\{p_1,\dots,p_n\}
$$
This pageviews are then weighted in different ways:

- **Binary**
- **In function of duration**
- **Order of pageview**
- **Combination of Heuristics**

Then we have transactions, which are a set of pageviews with their weights:
$$
T = \{t_1,\dots,t_m\}\\
t_i = \left<(p_1, w(p_1)),\dots,(p_n,w(p_n))\right>
$$
We also have a **User-Pageview matrix (UPM)** defined as:
$$
t=(w_{p_1},\dots,w_{p_n})
$$
This matrix works best for situation where the order of pageviews is not relevant. Usually the columns represent pageviews with unique identifiers.

### Sematic Information Integration

PageView Representation has an issue with granularity, because the URI identifier does not provide any information. But it is still useful, the pageview may contain semantic descriptions as keywords, product prices, categories, etc.

Another important feature of the pageview is the classification that it has, whether it is product detail, navigation, general,etc. Each feature is assigned during the data collecting phase or linked from an internal knowledge-base.

There are several representations of the pageview:

- **Pageview-Feature Matrix (PFM)**: It is composed by pages and the weight of their features in the pageview:
  $$
  p = [fw(f_1),\dots,fw(f_t)]
  $$
  Where $fw$ is the weight of the feature in the pageview. The matrix will look like this:

  <img src="Resources/06 - Web Usage Mining/image-20210515115853919.png" alt="image-20210515115853919" style="zoom:33%;" />

- **Transaction-Feature Matrix (TFM)**: It is obtained by crossing data from the User-Pageview matrix (UPM) with the Pageview-feature Matrix:
  $$
  \text{TFM} = \text{UPM} \times \text{PFM}
  $$
  <img src="Resources/06 - Web Usage Mining/image-20210515120703355.png" alt="image-20210515120703355" style="zoom:33%;" />

### Clustering

We can create **User clusters** or **Page clusters** with an algorithm like k-means. The most common task is clustering of users, and the goal is to fund clusters that exhibits similar browsing patterns. We can also **cluster by semantic features**.

### Association Analysis

With association analysis we can find groups of items or pages that are commonly accessed together. **Association Rule Mining** is a fundamental part of this task, its objective is to find all co-occurrence relationships called associations and it uses the Apriori Algorithm.

For an association rule:
$$
A \implies B
$$
There are two main metrics:

- **Support**: It is the fraction of transactions that contain both $A$ and $B$
- **Confidence**: It measures how often items in $B$ appears in transactions that contain $A$.

The Apriori algorithm allows us to calculate these two metrics for all elements in a set, we just need to give our minimum acceptable support of rules (minsup) and the minimum acceptable confidence of rules (minconf). The algorithm goes as follows:

1. Generate all frequent itemsets, meaning itemsets that have a transaction support above our minimum threshold.
2. Generate all confident association rules from the frequent itemset.

### Sequential and Navigational Patterns

This process is similar to association rules but it also involves the order of the pageviews. This representation can be created using Markov models.

## Web Analytics

Web Analytics concerns mostly about general access pattern tracking to understand the overall behavior of users. There are two main categories, **Traffic Analysis** and **E-Commerce Analysis**.

The conversion funnel refers to the journey a consumer takes through an e-commerce website and finally converting to a sale

