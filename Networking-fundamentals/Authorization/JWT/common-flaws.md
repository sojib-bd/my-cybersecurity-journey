# Manipulating the alg Field
Sometimes applications fail to verify a token’s signature after it arrives at
the server. This allows an attacker to simply bypass the security mechanism
by providing an invalid or blank signature.
One way that attackers can forge their own tokens is by tampering with
the alg field of the token header, which lists the algorithm used to encode the
signature. If the application does not restrict the algorithm type used in the
JWT, an attacker can specify which algorithm to use, which could compro-
mise the security of the token.
JWT supports a none option for the algorithm type. If the alg field is set
to none, even tokens with empty signature sections would be considered valid.
Consider, for example, the following token:
```
eyAiYWxnIiA6ICJOb25lIiwgInR5cCIgOiAiSldUIiB9Cg.eyB1c2VyX25hbWUgOiBhZG1pbiB9Cg.
```
This token is simply the base64url-encoded versions of these two blobs,
with no signature present:
```
{ "alg" : "none", "typ" : "JWT" } { "user" : "admin" }
```
This feature was originally used for debugging purposes, but if not
turned off in a production environment, it would allow attackers to forge
any token they want and impersonate anyone on the site.

## Another common Flaw
Another way attackers can exploit the **alg** field is by changing the type
of algorithm used. The two most common types of signing algorithms used
for JWTs are **HMAC and RSA**. HMAC requires the token to be signed with
a key and then later verified with the same key. When using RSA, the token
would first be created with a private key, then verified with the correspond-
ing public key, which anyone can read. It is critical that the secret key for
HMAC tokens and the private key for RSA tokens be kept a secret.

Now let’s say that an application was originally designed to use RSA
tokens. The tokens are signed with a private key A, which is kept a secret
from the public. Then the tokens are verified with public key B, which is
available to anyone. This is okay as long as the tokens are always treated as
RSA tokens. Now if the attacker changes the alg field to HMAC, they might
be able to create valid tokens by signing the forged tokens with the RSA
public key, B. When the signing algorithm is switched to HMAC, the token
is still verified with the RSA public key B, but this time, the token can be
signed with the same public key too.


## Brute-Forcing the Key
It could also be possible to guess, or brute-force, the key used to sign a JWT.
The attacker has a lot of information to start with: the algorithm used to
sign the token, the payload that was signed, and the resulting signature. If

the key used to sign the token is not complex enough, they might be able
to brute-force it easily. If an attacker is not able to brute-force the key, they
might try leaking the secret key instead. If another vulnerability, like a
directory traversal, external entity attack (XXE), or SSRF exists that allows
the attacker to read the file where the key value is stored, the attacker can
steal the key and sign arbitrary tokens of their choosing. We’ll talk about
these vulnerabilities in later chapters.

## Reading Sensitive Information
Since JSON web tokens are used for access control, they often contain
information about the user. If the token is not encrypted, anyone can
base64-decode the token and read the token’s payload. If the token con-
tains sensitive information, it might become a source of information leaks.
A properly implemented signature section of the JSON web token provides
data integrity, not confidentiality.
