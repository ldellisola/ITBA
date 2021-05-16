# Accesing Services

In modern applications, it is common for websites to access more than one APIs to provide new value-added functionality. This can come in 3 types:

- **Data Mashup**: Aggregation of data
- **Service Mashup**: More sophisticated workflows
- **Visualization**: It involves UI from third parties displayed on your application. A good example of this is google maps.

## Security Mechanisms

### Same Origin Policy

The same origin policy protects users in from malicious javascript that may be calling websites on other domains. JavaScript code can only access resources on the same domain. Because it is still necessary to access other sites, two options were developed:

- **JSONP**
- **CORS**

### Scripting Attacks

#### Cross-site Request Forgery (CSRF)

This methods exploits a trust of a website in a user's browser. This attack forces an end user to execute unwanted actions on a web application in which they are currently authenticated.

#### Cross-site Scripting Attack (XSS)

this exploits the trust of a used in a website. It enables attackers to inject client-side scripts into web pages viewed by other users.

### Cross-Origin Resource Sharing Protocol (CORS)

This protocol allows for cross-site HTTP requests, meaning that REST calls can be made from different domains. This is implemented both on the front end and in the external resource, notifying them that calls from our domain re going to exists, if this is allowed, then the server will return the requested data.

This adds one header in the request and one in the response. For the request we add the header `Origin` with the domain of the site that requests it, and on the response we add `Access-Control-Allow-Origin` defining who can access the resource.

Some REST clients also do preflight queries, using the OPTIONS method, to know if they are allowed to make the request.

## JSONP

JSONP is a service the allows to specify a query string parameter for a wrapper function to load the data in JavaScript code. This is a workaround for the same origin policy but it only allows us to do GET requests.

To execute this request we do not need to use XHR, but to add them to a dynamic script tag inside the web.