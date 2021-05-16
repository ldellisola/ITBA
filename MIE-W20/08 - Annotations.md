# Annotations

## Microformats

Microformats are a way to embed data in HTML, XHTML, Atom and XML. They can be as data, such as *vCard*, *vResume* or  as microformat *hCard* or *hResume*. The main idea of this is that browsers will display the HTML while crawlers can access the data with the same easiness.

There are other ways to do this, such as POSH. In theory these are very similar, but the difference is that data in POSH is not in a standard format.

Microformats are different from Atom feeds. Microformats require only a single HTML file without a significant increase of the size of the document and it doesn't require any data representation.

Microformats follows design patters to embed data in HTML elements or attributes. The patterns used depend on the microformat specification.

### Issues

Microformats have a lot of issues, mainly concerning namespaces and scalability. It doesn't have any support for namespace, so adding different microformats will inevitably lead to breaking compatibility with many tools.

There are also no formal semantics or reasoning support. The only semantics that were defined where in XMDP profiles, which now-a-days are no longer supported, and even then they didn't provide any formal basis and lack compatibility with RDF/RDFa.

### Current uses

Currently there are more than 2 billion pages annotated with hCard and they are used to support Google's rich snippet preview for websites on their search result. Facebook also uses hCalendar and hCard for events.

## Microdata

Microdata is part of the HTML 5 specification thanks to Google. This spec includes Microdata vocabulary and Global Attributes. The idea is similar to microformats, but with a few changes:

- The items now have IDs, defined as URIs
- There is now an official description of items that are interchangeable with RDF.
- Data formats are not directly based on formats such as vCard or vCalendar, they define their own "simple" vocabulary  

### Global Attributes

Global attributes are attributes that can be on any HTML element, for example:

- `Itemscope`: It identifies an element which descendants contain some properties.
- `Itemtype`: A pointer to a vocabulary that describes the item and it properties.
- `Itemid`: A global identifier for the item.
- `Itemprop`: A term for the vocabulary which value is in the element's content.
- `Itemref`: A reference to other item within the same document.

### Improvements from Microformats

Microdata is simpler and can be easily extensible without any breaking changes, this allows microdata to be a lot more scalable. Another big improvement is that microdata is part of the HTML5 standard.

## RDF and RDFa

Resource Description Framework (RFD) is a framework for describing resources on the web. The RDF statement is a 3-tuple:
$$
\bold{\text{subject - predicate - object}}
$$
 Where the subject is the thing the statement will describe, the predicate is a specific property of the object and the object represents the value of the property.

There are different ways to represent RDF statements:

- Using **graph notations** where the subjects and objects are the nodes, and the predicates are edges.
- Using **identifiers** to identify subject predicate and object.
- Using **Machine processable language** in the form of serialized triplets.

### Structured Property Values

In order to structure complex objects, it is better to define them as resources with an URIref:

<img src="Resources/08 - Annotations/image-20210514163656974.png" alt="image-20210514163656974" style="zoom:33%;" />

The property values can be typed or untyped. If there is no type assigned the program must have knowledge of how to interpret the value, on the other hand, typed literals provide a URIref that defines a particular datatype. While RDF does not define any external data types, it uses the basic ones from XML schema such as integer, string and date.

### Encoding RDF in XML

We can take the RDF statement an implement it inside of XML or HTML. For this we can say that the XML element name is the predicate, the value of the element is the object and the URIref is an attribute value.

```
ex:index.html ext:creation-date "Aug 16, 1999" .
ex:index.html dc:language "en" .
ex:index.html ext:rank "3"^^xsd:decimal .
ex:index.html dc:creator <http://www.vitvar.com#me> .
```

We can translate this list of statements into XML

```xml
<?xml version="1.0"?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     	xmlns:dc="http://purl.org/dc/elements/1.1/"
     	xmlns:ext="http://www.example.org/terms/">
     <rdf:Description rdf:about="http://www.example.org/index.html">
         <ext:creation-date>
             August 16, 1999
         </ext:creation-date>
         <dc:language>
             en
         </dc:language>
         <ext:rank rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal">
         	3
         </ext:rank>
         <dc:creator rdf:resource="http://www.vitvar.com#me"/>
     </rdf:Description>
</rdf:RDF>
```

### RDFa

We can also embed RDF data into XHTML with a set of extension attributes. RDFa defines a property extension attribute called `property` that will store the predicate of the triplet. It also allows us to use the same datatypes as in the normal version, but this time with the attribute `datatype`. Another attribute added  is the `Content` attribute, that allows us to put another, more machine readable, version of the object value.

Here is an example: 

```
<http://blog.vitvar.com/?p=107> dc:creator "Tomas" 
```

```xml
<div xmlns:dc="http://purl.org/dc/elements/1.1/">
	<h3 property="dc:creator">Tomas<h3>
</div>
```

RDFa also defines types with the `typeof` attribute. They can be custom data types.

## OpenGraph Protocol

The OpenGraph protocol, thought the **Global Social Graph** defines metadata for pages' description so that is can be easily included in a global graph connecting people and pages through "likes". 

OpenGraph also defines some main properties such as:

- `og:title` as the title of the page
- `og:type` as the type of content
- `og:image` as the URL of the image for the page
- `og:url` as the canonical URL of the page to be used as its permanent ID in the graph.





