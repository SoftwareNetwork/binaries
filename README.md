# SW binaries

SW documentation: https://software-network.org/client/sw.pdf

## Simple signature

Files are signed with ECDSA.

Public key is inside `public.pem` file.

To verify:

```
openssl dgst -sha512 -verify public.pem -signature archive.sha512.sig archive
```

## PGP signature

To be done...
