# Security

To secure the client-server communication, we must implement two types of security:

- **Message-level security**
- **Transport-level security**

For this we need to verify the client's identify (**authentication**) and the rights to access the resources (**authorization**). We also have to maintain **message confidentiality and integrity**.

<img src="Resources/05 - Security/image-20210513171003345.png" alt="image-20210513171003345" style="zoom:33%;" />

## Authentication and Authorization

Authentication is used to verify the user's identity, while authorization checks that the user has the right to access a resource. There are standard ways to authenticate over HTTPS such as **Basic Access Authentication** or **Digest Access Authentication**, or we can do it in a proprietary way with cookies.

### Basic Access Authentication

The client hashes the user credentials in Base64 and then send it in the header every time it request something from the server. Even though this is encoded in Base64, this data is still public for everyone if SSL is not used.

<img src="Resources/05 - Security/image-20210513172125246.png" alt="image-20210513172125246" style="zoom:33%;" />

### Digest Access Authentication

This method requires the server to send the `WWW-Authenticate` header with the following data:

```
WWW-Authenticate: Digest 
	realm = "ProtectedArea",
	nonce="BbdQof3DBAA=a293ff3d724989371610f03015f2d23f3cd2c045", 
	algorithm=MD5, 
	domain="/", 
	qop="auth"
```

The client will then calculate a response hash using this realm, their username and password and the quality of protection (QoP), and use this value to request the data from the server with the following header:

```
Authorization: Digest 
	username="novak", 
	realm="ProtectedArea",
 	nonce="BbdQof3DBAA=a293ff3d724989371610f03015f2d23f3cd2c045", 
 	uri="/", 
 	algorithm=MD5, 
 	response="c4ea2293aeb318826d1e533f363efd90", 
 	qop=auth, 
 	nc=00000001, 
 	cnonce="531ee8ba7f2a8fd1"
```

## JSON Web Token

JSON web token is an open standard that aims to securely transmit information between parties as a JSON object. It is compact enough to be transmitted in the HTTP headers and the payload contains all the required user information.

JWT is used mostly in authentication, since now-a-days most Single Sing On services uses JWT or in information exchange, where the signature ensures senders are who they claim to be. The integrity of the message can also be verified as the signature is calculated using the header and the payload.

### Structure

The structure of this token is pretty simple:
$$
\text{<header>}. \text{<payload>}.\text{<signature>}
$$
The **header** contains two parts, the type of the token and the hashing algorithm used. The **payload** contains the claims, meaning the statements about an entity and it can be registered, public and private. 

The **signature** is obtained by hashing the encoded header and payload, with a secret.

## OAuth 2.0  

The trend is that SaaS are open and can be extended by 3^rd^ party developers through APIs. This extensions needed to access the user's data and this is how the standard was born. It allows users to grant access to third-party apps without exposing their users' credentials.

With this protocol, users can grant and revoke access to third-party application at anytime, and it supports client-side web apps, server-side web apps and native apps as well.

### Client-side Web Apps

Client-side web apps use a simplified version of the OAuth 2.0 protocol because the apps are running in a browser and they cannot easily remember the app state. In this version, there is no need for authorization code and the flow is as follows:

1. The client redirects a user to the authorization endpoint.
2. The resource owner grants access to the client or rejects the request.
3. Authorization server provides an access token to the client
4. The client access the resource using the access token
5. When the token expires, the client will request a new token

### Server-side Web Apps

Server-side apps can maintain the state and also allow for additional interactions. The flow is as follows:

1. The client redirects the user to the authorization point.
2. The resource owner grants or rejects access to the client.
3. The authorization server provides an authorization code to the client.
4. the client requests the access and refresh tokens from the authorization server.
5. The client access the resource with the access token
6. When the access token expires, the client refreshes the token with the refresh token.

In this case, the access token is not visible to clients, as they are stored at the server. It is also more secure because the client need to authenticate before they can get the tokens.

### Improvements from OAuth 1.0

The previous version of this protocol was not only less secure (it didn't use SSL) but it had a more complex algorithm that had to be done with every request and it wasn't suitable for JavaScript-based clients. OAuth 2.0 enforced SSL on all communication to generate the token and it supports various clients.

## OpenID

The OpenID protocol comes out of need of users, as before this was release, they needed to have one password for each service they used. This protocol allows apps to utilize an OpenID provide authentication services.