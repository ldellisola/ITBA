# Text Mining

Text mining is primarily aimed at extracting information and knowledge previously unknown to the user from text. This information may not even be known by the writer. This process involves several steps:

- Assemble a large number of documents

- <u>Preprocess those documents</u>:

  The main idea of this step is to convert the raw text file into a well-defines sequence of linguistically-meaningful units. It is usually split into sentences or tokens (words). 

  For Tokenization we usually split the text into sentences or words using characters such as whitespace or punctuation symbols. This process is t

- Perform text transformation and feature generation

- Select only some features that are important to you

- Pattern recognition

- Interpret the patterns

## Issues

There are a lot of issues with this process:

- High Dimensionality
- Different terms for the same concept
- The same term can identify more than one concept
- The text is not structured

## Applications

Text mining has a lots of applications, the most general uses are information retrieval for recommendation systems and information extraction. Among other uses we can find customer profile and social media analysis, document classifying and clustering, and  spam filtering or fraud detection.

### Text Processing

Text needs to be preprocessed to be machine understandable. This is done by converting a raw text file into a well defined sequence of linguistically-meaningful units, basically splitting the string into tokens (words) and handling special symbols such as dots, and whitespaces.

After this initial transformation, we may still need to process the text in many stages, such as part-of-speech tagging or Named Entity Recognition.

#### Tokenization

Tokenization involves grouping sequences of characters into logical elements called tokens. The system that handles this process is known as a **tokenizer**. This process is trivial for a person familiar with the language structure but it is more complicated for a computer program as it is language-dependent.

#### Frequency Analysis

This is a basic way to analyze textual data and it is focused on computing the frequency distribution as a ranked list of terms.

#### Stemming and Lemmatization

The goal of this process is to reduce the dimensionality by converting each token to a standard form. **Lemmatization** tries to find the canonical form for a given words, for example, *"are, is, was, were"* are all part of the lemma *"be"*.

**Stemming** does a similar thing by finding the root word from which suffixes can be attached. A good example of this is the word *"waiting"*, that comes the the root *"wait"*.

We can also use other techniques to reduce the dimensionality of a dataset. The easiest way is to remove tokens that do not provide anything to the context, such as *"a, the, it, they"*. Another method similar to lemmatization is to remove tokens using synonyms and antonyms.

#### Sentence Splitting

Identifying sentences in a txt is not a trivial process and heuristics can be used to improve it. This heuristics usually imply keeping track of words that are usually in the first or last position of sentences.

#### N-Grams

N-Grams are a set of co-occurring words within a given window.

#### Part-of-Speech Tagging

This is a linguistical analysis that assigns categories to words in a text. It cannot be 100% accurate because some words can be multiple things depending on the context. Here we can see a list of possible categories:

<img src="Resources/03 - Text Mining/image-20210510144138206.png" alt="image-20210510144138206" style="zoom:33%;" />

#### Phrase Detection

We can use tokens and extra information acquired from PoS tagging of group tokens into **chunks**. The PoS data is very important as it allows you to use more specific chunking methods, such as **Noun Phrase Chunking**. This method is based on chunk grammar and it represents a set of rules that indicate how sentences should be chunked, for example a determiner should be follower by a number or adjective, and terminated by a noun.

### Named Entity Recognition (NER)

This process tries to turn verbose text data into a more compacted structural form, and it uses a special kind of phrase detection. Among its subtasks we can find:

- <u>Recognition</u>: Spotting text fragments with entity mentions
- <u>Classification</u>: Assigning class to an entity mention
- <u>Disambiguation via Linking</u>: Assigning an URI describing the entity, usually a Wikipedia link.

NER systems are usually trained on a large corpus and are based on previously defined rules or lists of  proper nouns.

The result has significantly lower dimension and it is richer thanks to the disambiguation.

### Relation Extraction

This refers to extracting semantic relations between entities, for example saying a person lives in a place. Naïve approaches don't work well here, we have to use linguistic analysis. 

## Opinion Mining

Opinion mining studies opinions, sentiments, emotions and related topics, and it is interested in identifying it in a text. This has a lot of practical applications, such as reviews, political opinion or influences over the stock market. 

This process can be summarized in 3 stages:

- **Opinion Extraction**: Extract the text that expresses an opinion
- **Sentiment Analysis**: Identify the polarity of an opinion
- **Opinion Summarization**: Identify the overall opinion.

### Sentiment Analysis

There are several types of sentiment analysis:

- Document and sentence subjectivity and sentiment classification: This type is usually uses polarity classification, trying to decide if the text is positive, negative or neutral.
- Feature/aspect sentiment identification: It determines the opinions or sentiments expressed on different features or aspects of entities.
- Opinion search and retrieval: It finds public opinions about a particular entity or an aspect of the entity.
- Opinion Spam Detection: detecting fake opinions or reviews

A **lexicon** is a list with opinion words used in sentiment classification tasks. The appearance of a word of the list in a text means that the text contains that sentiment. This is used in **lexicon-based sentiment**.

**Supervised Sentiment Learning** trains on annotated data such as reviews with ratings to categorize text whether as positive, negative or neutral. the learning is similar to classical document topic classification, the topic related words here are not important, but the sentiment is.

We can also do the same but without any supervision in **unsupervised sentiment learning**. For this type of learning we have to use PoS tagging to identify the context of the sentences, because isolated adjectives may not reveal the real opinion. 

There are situations where adjectives can be good or bad depending on the context. This is called **Sentiment Orientation of Phrases** and we can estimate the semantic orientation using pointwise mutual information (PMI), which indicates the degree of statistical dependence between them:
$$
\text{PMI}(\text{term}_1,\text{term}_2) = \log_2\left(\frac{Pr(\text{term}_1 \land \text{term}_2)}{Pr(\text{term}_1)Pr(\text{term}_2)}\right)
$$
Where $Pr(\text{term}_1 \land \text{term}_2)$ is the co-occurrence probability of both terms and $Pr(\text{term}_1)Pr(\text{term}_2)$ is the probability that the two co-occur if the are statistically independent.

The final formula is:
$$
\text{SO} = \text{PMI}(\text{phrase},\text{"excellent"}) - \text{PMI}(\text{phrase},\text{"poor"})
$$
There are other methods to calculate this, such as the following based on hits (number of matching documents):
$$
\text{SO} = \log_2\left(\frac{\text{hits}(\text{phrase NEAR "excellent"})\text{hits}(\text{"poor"})}{\text{hits}(\text{phrase NEAR "poor"})\text{hits}(\text{"excellent"})}\right)
$$
And the sentiment of a text is computed by averaging the sentiment of all extracted phrases.

#### Lexicon Expansion

As we have seen before, lexicons are sets of words that are usually associated with a sentiment. This section explains how the lists are created.

There are several approaches:

- <u>Manual Approach</u>: We have to manually populate the lexicon. This is usually combined with an automated approach.

- <u>Dictionary Based Approach</u>: We provide the initial seed of opinion words, and then we use a lexicon (such as WordNet) to expand the set of word. This is an iterative approach that recursively looks for new words based on the current set.

- <u>Corpus Based Approach</u>: This is based on syntactic or co-occurrence patterns. It uses a seed list of opinion words to find other opinion words in a large corpus. 

  This method will use the seed list in combination with linguistic constraints to identify new opinion words. This constraints can be *"AND"* or similar words, adding new words to our set that should be complementary of our seed set. 

### Aspect-Based Opinion Mining

Opinions are expressed on certain entity aspects, and these aspects are different for each context. For example, in the case of the following camera review:
$$
\text{"The picture quality of this camera is not great, but the battery life is long"}
$$
The aspects are *"Picture Quality"* and *"Battery"*.

In order to recognize these aspects, we need to :

1. <u>Mark opinion words and phrases</u>: We need to find the opinion words, such as *"Great"* in the example.
2. <u>Handle opinion shifters</u>: There are some words that change opinion orientation, such as *"No"*. If we find this type of words before the opinion words, then we have to mark it as negative.
3. <u>Handle BUT-clauses</u>: In English, the word *"but"* means contrary, so we must switch the orientation of the opinion before and after the *"but"* for its opposite.  

### Comparative Opinion Mining

Opinions can be expressed in comparative manner, from here we can extract **comparative expressions** and **superlative expressions**. The first one is represented with the comparative form of an adjective or adverb. In contrast, for the superlative expression we use superlative forms of adjectives or adverbs.

### Sarcasm

In discussions it is common for users to use sarcasm and say the opposite of what they mean. To combat this it is better to take a set of data where sarcasm is tagged, such as tweets with the hashtag *"sarcasm"* and train a machine learning model.

Even with this processing, it is hard to identify the individual sections of the text that contain sarcasm.

## Text Summarization

The goal of text summarization is to automatically reduce a text to its most important content. It is generally used to generate abstracts or to summarize articles or websites. There are also different types of text summarization:

- Single document vs multi document
- Extractive vs abstractive
- Generic vs query-driven

This process is composed of 3 main stages:

- <u>Content Selection</u>: Select the sentences to extract
- <u>Information ordering</u>: Choose the order of the information
- <u>Sentence realization</u>: Clean up sentences

### Frequency-Based Summarization

This method uses PoS tagging and tokenization to split the text into sentences and then select them based on the frequency of the words.

### Baseline Single Document Summarization

This technique is used to create abstracts out of papers and it is based on filtering out sentences containing frequently occurring words that appear near one another. The algorithm goes as follows:

1. Detect the most important words in a text and use only the top N (*"WORDS"*). During this process we can remove stop words, punctuations and use lemmatization and convert stems to reduce the dimensionality of the text.

2. For each sentence find clusters of important words that are not far away from each other (*"DISTANCE"*)

3. The score of the sentence is the max score of its clusters, and the score of each cluster can be calculated as:
   $$
   \text{score} = \frac{|\text{significant words in cluster}|\times |\text{significant words in cluster}|}{\text{|cluster words|}}
   $$

4. Return the top sentences

## Text Models

We have a wide selection of **information retrieval models**. This type of models specify how a document and a query are represented and how the relevance of a document to a user query is defined. There are some common characteristic among all of them:

- **Bag of Words (BoW)**: A document or a query is represented as a bag of words

- **Vocabulary**: It is a set of distinct words/terms for the collection of documents:
  $$
  V = \{t_1,t_2,\dots,t_{|V|}\}
  $$

- **Term Vector**: It represents each document as a vector of weights $w_{ij}$
  $$
  d_j = (w_{1j},\dots,w_{|V|j})
  $$

### Boolean Model

It is the simplest model and it is based on Boolean algebra. It represents the documents as a term vector where the weights represent the presence or absence of the term. The queries are precise semantic using boolean operators such as `AND,OR,NOT`.

For retrieval, only exact matches are considered, the document will either be relevant or not. This can lead to poor results.

### Vector Space Model

this is one of the most widely used models. It uses any number to represent the weight in the term vector. There are some variations of the weighting schema, but the most common one is **TF-IDF**. 

This schema takes into account the **term frequency**, counting how many times the term appears in the document and normalizes it. It also takes into consideration **inverse document frequency**, measuring how common a word is among all documents.

Then we can create the matrix as:
$$
\text{TF-IDF} = \text{TF} \times \text{IDF}
$$

 ### Simple Scoring

We can measure the overlap of two sets to calculate the score of the results of the query. This is called the **Jaccard Coefficient** and it assigns a number from 0 to 1. The formula is as follows:
$$
\text{jaccard}(\text{docA},\text{docB}) = \frac{|\text{docA} \cap \text{docB}|}{|\text{docA} \cup \text{docB}|}
$$
The problem with this approach is that is doesn't consider term frequency and that it gives more important to more frequent terms, that are usually less informative.

### Euclidian Based Proximity Measure

Euclidean distance represents the query and document in a vector space model and computes the distance between them in a multi-dimensional space. Given tow vectors with $n$ dimensionality:
$$
\text{d}(p,q) = \sqrt{\sum_{i=1}^{n} (q_i - p_i)^2}
$$
This also has its own problems, mostly due to the fact that if a query term occurs more times in the documents, the distance will be larger, although the distribution of terms are similar.

### Cosine Based Proximity Measure

This method is similar to the previous one, as it represents the documents in a vector space. The difference is that here we are using the angle instead of the distance between 2 vectors. It can be calculated as:
$$
\text{similarity}(Q,D) = \frac{Q \cdot D}{||Q||||D||} = \frac{\sum_{i=1}^n Q_i \times B_i}{\sqrt{\sum_{i=1}^n (D_i)^2}  \times \sqrt{\sum_{i=1}^n (Q_i)^2}}
$$

## Word Embeddings

Word embeddings are based on distributional hypothesis, words that occur in similar contexts tend to have similar meaning. This modeling technique is sued for mapping words to vectors of real numbers. It allows words with similar meanings to have a similar representation and it can be generated with various methods, such as neural networks, co-occurrence matrix, etc.

**Word2Vec** is the most popular tool to learn word embeddings and it uses a shallow neural network. It contains a Continuous bag-of-words used to predict the current word based on the context, and continuous skip-gram, taht predicts teh surrounding words given the current word. 