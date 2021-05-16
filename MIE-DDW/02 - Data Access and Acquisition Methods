# Data Access and Acquisition Methods

## Crawling

There are different types of crawlers depending on our needs:



The crawler acts as a web client, sending HTTP requests to a server hosting the website and receiving the response. 

After obtaining our response we have to parse it, in this step we extract content for indexing, extracting links to be added to the frontier and more. Often we find HTML code with invalid markup, which can be in the form of included elements, unencoded special characters and missing required attributes. For those cases we must use a preprocessing step to clean it up.

**URL Normalization** is also important and all relative URLs parsed need to be normalized. For this we will evaluate the following cases:

- <u>Case Normalization</u>: The URI scheme and the protocol should be normalized to lowercase and hexadecimal digits with percentage-encoding triplets should be normalized to uppercase.
- <u>Percent-Encoding Normalization</u>: We must correct some encodings that are allowed in URLs, such as hyphens, period, underscores and tildes.
- 



## Algorithms

### Basic Crawling Algorithm

The algorithm is a breadth-first search that takes as input a list of seed pages. The algorithm is as follows:

```python
while url_queue is not empty:
    url = url_queue.Head()
    page = fetch(url)
    new_links = extract_links(page)
    
    for link in new_links:
        if not url_queue.Contains(link) and not crawled_pages.Contains(link):
            url_queue.push(link)
```

### Backlink Based Crawling

In this algorithm we try to use heuristics to select the next URL for crawling. With this method we give more priority to the website with more links redirecting to it.

```python
while url_queue is not empty:
    url = url_queue.Head()
    page = fetch(url)
    new_links = extract_links(page)
    
    for link in new_links:
        if not url_queue.Contains(link) and not crawled_pages.Contains(link):
            url_queue.push(link)
            
	for url in url_queue:
        backlink_count[url]
        sort url_queue by backlink_count[url]
```

## Robot Exclusion Protocol

This protocol is a non-standard protocol that is widely adopted by the web. It consists in a text file called `robots.txt` that must be accessible via HTTP and present in the top-level directory. It can contain one or more records separated by one or more blank lines and each lines has the following format:

```
<field>:<optionalspace><value><optionalspace>
```

A record start with one or more `User-agent` lines, followed by one or more `Disallow` lines:

- The `User-agent` field says for which robot the records is describing the access policy for. At least one `User-agent` field should be present.
- The `Disallow` field shows partial URLs that cannot be accessed by the robots. If it is not present, then the robots can access everywhere. 

 ### Extensions of the protocol

There are some extensions that are not present in the standard but also a large amount of websites use them:

- `Crawl-delay`: It specifies the number of seconds to wait between visits.
- `Allow`: It indicates what specific paths are allowed and maybe useful for bots.
- `Sitemap`: It indicates the URL of the sitemap file. It should be absolute.
- `Host`: It shows the preferred domain for websites with multiple mirrors.

## Page-Level Indexing Configuration

Inside the actual pages we can also include metadata to help the bots and crawlers. This can be achieved with a meta element in the HTML file or within the HTTP response header.

```html
<!DOCTYPE html>
<html>
    <head>
        <meta name="robots" content="noindex"/>
        (...)
    </head>
    <body>
        (...)
    </body>
</html>
```

We can use the following directives:

- `noindex`: Do not show this page in search results.
- `noarchive`: Do not show a "cached" link in the search results.
- `none`: Same as `noindex`.
- `nosnippet`: Do not show a snippet in the search results for this page.
- `notranslate`: Do not offer translation of this page in search results.
- `all`: no restrictions for indexing or serving.
- `nofollow`: Do not follow the links in the page.
- `noimageindex`: Do not index images on this page.
- `unavailable_after`: Do not show this page in search results after a specified date.

## HTTP Header Configuration

Here we can also use the same directives as in the previous section but we can do it on the header of the HTTP request instead. In the header we can specify them as:

```
< X-Robots-Tag: noimageindex
< X-Robots-Tag: unavailable_after: 22 Apr 2014 23:59:59 PST
```

Or we can use multiple directives in the same line:

```
<X-Robots-Tag: noimageindex, unavailable_after: 22 Apr 2014 23:59:59 PST
```

Here we don't specify the User-agent because we know the user that made the request and we can send the response accordingly.

## Sitemaps

The sitemap file is an XML file with a list of URLs and metadata available for crawling. There are two types of sitemap documents:

- **Sitemap Index Document**: It provides an aggregation of multiple sitemap files, together with their location and their last modification timestamp.
- **Sitemap Document**: It represents a single sitemap document containing a list of URLs offered for crawling.

## Well-Known URIs

This directory of a server contains a list of site-wide metadata. It is found on the directory `/.well-known/` and it contains metadata about author, copyright or contact for security vulnerabilities.

