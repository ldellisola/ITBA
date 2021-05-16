# Recommender Systems

Users have too much information available and this can overload them, for this reason we need systems that can recommend information for us, based on our habits. Recommender systems can be used to recommend movies, musing, songs and anything else, they help enhance the user's experience and reduce search time.

Recommender Systems use information from different sources:

- Browsing and searching habits.
- Purchase data.
- Explicit feedback provided by users.
- Comments on products.
- Demographic data.

These systems need to adapt to individual's needs and accommodate the differences between individuals according to their preferences. The main assumptions of these systems are:

- If users $A$ and $B$ are similar, then in the future user $A$ might be interested in items from user $B$.
- If user $A$ is interested in item $I$, in the future user $A$ might be interested in items similar to $I$.

## Types of Recommender Systems

There are several different types of recommender systems:

<img src="Resources/07 - Recommender Systems/image-20210515201527619.png" alt="image-20210515201527619" style="zoom:33%;" />

- **Collaborative Filtering**: It analyses the user-item interactions for each user, and recommends items from similar users.
- **Content-based Filtering**: It analyses the content of the items and recommends similar content.
- **Knowledge-based**: This is used when the information available is limited and it has some knowledge of which item should be recommended in which context.
- **Hybrid**: It mixes different approaches into one.

## Collaborative Filtering

It works under the assumption that users with similar taste in the past will have similar taste in the future. It analyses the interaction of the users with the content, without analyzing the content itself and it produce recommendations by computing the similarity between a user's preferences and the preferences of other people.

The approach can be **user-based** if it finds similar users to me and recommends what they liked, or **item-based** when it find similar items to those I have previously liked. 

This method takes a list of users and items, with their associations such as purchases and ratings and runs the following algorithm:

1. **Identify relevant input data**: It collects user-item interaction from users.
2. **Identify the set of users most similar**: It computes user-to-user similarity based on the interactions.
3. **Identify items for these similar users**
4. **Generate a prediction**

The main challenge here is how to compute the similarity between users:

- **Cosine Similarity**: Cosine similarity is based on the difference in the angle from the vectors generates from previous user-item interactions. It is calculated as:
  $$
  \text{similarity} = \cos(\theta) = \frac{A \times B}{||A||\times||B||} = \frac{\sum_{i=1}^n A_i \times B_i}{\sqrt{\sum_{i=1}^nA_i^2}
  \times \sqrt{\sum_{i=1}^nB_i^2}}
  $$

- **Pearson Similarity**: It computes how correlated two vectors are within a range of $[-1,1]$. 
  $$
  \text{corr}(i,j) = \frac{\sum_{i=u}^U(R_{ui}-R_i)(R_{uj}-R_j)}{\sqrt{\sum_{i=u}^U {(R_{ui}-R_i)}^2} \times \sqrt{\sum_{i=u}^U {(R_{uj}-R_j)}^2}}
  $$
  

  <img src="Resources/07 - Recommender Systems/image-20210515203135871.png" alt="image-20210515203135871" style="zoom:33%;" />

### User-Based Collaborative Filtering

In order to calculate the similarity between users, this method will do:

1. For the active user, find the top similar users
2. Detect ratings of neighbors for unrated items
3. Compute average ratings
4. Recommend items with highest predicted ratings

<img src="Resources/07 - Recommender Systems/image-20210515202606983.png" alt="image-20210515202606983" style="zoom:33%;" />

To find user-to-user similarity, we can use Pearson-weighted average of ratings and then apply one of the following formulas:

- **Raw Rating Prediction**:
  $$
  \text{pred}(a,b) = \frac{\sum_{n\in N}\text{sim}(a,n)\times r_b}{\sum_{n\in N}\text{sim}(a,n)}
  $$

- **Mean-centered Prediction**:
  $$
  \text{pred}(a,b) = r_a + \frac{\sum_{n\in N}\text{sim}(a,n)\times (r_{bp} - r_b)}{\sum_{n\in N}\text{sim}(a,n)}
  $$

### Item-Based Collective Filtering

This method computes similarity between items to predict ratings. It is more computationally efficient, because there is usually a lot less products than users. The prediction is calculated in the same way as in the user-based method.

### Matrix Factorization Collective Filtering

This is a model-based recommendation. The idea is to discover latent factors of users or items and use them for recommendations. The main assumption here is that ratings can be inferred from a model put together from a smaller number of parameters.

**Latent factors** are features that describe recommended items or users and they can be discovered automatically, for example categories of movies. There are two main approaches:

- **Matrix Factorization**
- **Singular Value Decomposition (SVD)**

### Issues with Collaborative Filtering

Collaborative filtering has some big problems:

- **Cold Start**: The system needs to have enough users already in the system to find a match
- **Sparsity**: If there are many items to be recommended, even if there are many user, the user/ratings matrix is sparse and it is hard to find users that have rated the same items.

- **Popularity Bias**: It can't recommend items to someone with unique tastes and specific items are always popular.
- **Lack of Transparency**: Why an item was recommended to the user cannot be easily explained.

## Content Based Filtering

It produces recommendations by analyzing the content (metadata) of the items. This content can be metadata from the items or features extracted automatically using techniques such as text mining.

The approach is as follows:

1. **Build a representation** for each item, usually as a vector.
2. **Apply Content-based learning** for user profiles. This can be represented in many ways, such as a set of keywords, similar vector as for the items, or classification or regression models.
3. **Filter and generate recommendations**. For this we need to identify candidates, measuring their similarities with each item and the recommend the top-n most relevant items to the user.

### Advantages of Content Based Filtering

With this method, there is no cold start or sparsity problem because there is no need for data from other users. Also the taste of unique are met and recommendation of new and unpopular items works. this method also allows us to provide explanations on why an item was recommended to an specific user.

### Disadvantages of Content Based Filtering

Here, the content should be encoded as meaningful features and user tastes should be able to be represented as vectors. A big setback of this model is that it does not exploit collective intelligence information.

## Knowledge Based Recommender System

It is used to recommend expensive items with few purchases and little to no data. The time span may also be important, as the ratings may be time-sensitive. There are two main types of RS:

- **Constraint-based recommender system**: The users typically specify a requirements or constraints on the item attributes and domain-specific rules are used to match the user requirements. The process is interactively repeated until the user arrives at their desired result.
- **Case-Based Recommender System**: The specific cases are specified by the user as targets and similarity metrics are defined on the item attributes to retrieve similar items to these targets. There new results are often used as new target cases and the process will be interactive with input from the user until we have a final recommendation.

## Context-Sensitive Recommender System

Here the user will provide additional information that defines the context, meaning the specific situation under which recommendations are made. The context may contain among others:

- **Time**
- **Location**
- **Social Information**

## Hybrid Recommender System

There are many ways to combine recommender systems, here are some:

- **Weighted**: The score of several recommender systems are combined into a singles unifies score.
- **Switching**: It switches between various recommender systems depending on current needs
- **Cascade**: One recommender system refines the recommendation given by another.

- **Feature Augmentation**: The output of one recommender system us used to create input features for the next.

## Other Aspects

### Evaluation of Recommender Systems

It is very difficult to evaluate the performance pf RS, but there are 3 main approaches:

- **Off-Line**: It uses simulations of users and their behaviors to filter out inappropriate approaches. This method is prone to overfitting.
- **User-Studies**: A small group of users will use and test the systems, to later provide feedback on which one was better. This method is usually very costly.
- **On-line**: It runs different versions of the RS to real users online and then tries to infer which RS was better. This approach can be risky because it can turn users away from the platform.

As for the metrics, there are also a lot of ways to calculate them:

- **Root Mean Square Error**
- **Precision, Recall**
- **F-measure, Area Under the ROC Curve**
- **normalized Cumulative Discounted Gain**
- **Click-Through Rate**
- **Coverage-Novelty, Serendipity, Diversity**

### Attacks

Due to its nature, the most vulnerable RS to attacks is collaborative filtering. There are many reasons why someone would like to compromise the system, mainly to influence the ratings of products or to make the system unusable.

#### Type of Attacks

- **Random Attack**: It generates profiles with random values, usually used to make the system unusable.

- **Average Attack**: Its an effective attack on memory based systems, but it requires to know the global mean and mean for each item.
- **Bandwagon Attack**: It requires the attackers to know which items are popular and then improve their ratings massively, while putting random values to the rest of the products.
- **Segment Attack**: it inserts ratings for items in a specific segment and it is very effective against item-based collaborative filtering RS.
- **Love/Hate Attack**: The nuked item is set to the minimum rating value, whereas the other items are set to the maximum.
- **Reverse Bandwagon**: Widely disliked items are used as filler items to mount the attack.
- **Probe Attack**: A seed profile is created by the attacker, and the predictions generated by the RS are used to learn related items and their ratings.

#### Attack Detection

Attacks can be detected either with supervised or unsupervised detection algorithms. For **unsupervised attack detection**, ad hoc rules are used to detect fake profiles as well as analyzing if multiple profiles are identical.

For **supervised attack detection**, usually classification models are used, where the number of profiles to which a given user profile is identical can be used as a feature for that user profile.

In order to improve the security of this systems we can implement CAPTCHAs or advanced algorithms with metrics from the website.   