# MFA (OTP / WebAuthn)

## MFA en entreprise (pratique)
- OTP (TOTP) : rapide à mettre en place
- WebAuthn/FIDO2 : plus robuste (phishing-resistant)

## Où ça se configure
- Authentication flows : ajouter une étape OTP/WebAuthn
- Policies : “required actions”, règles conditionnelles

## Tests minimum
- Enrollment OTP
- Login “step-up” (exiger MFA pour certaines apps)
