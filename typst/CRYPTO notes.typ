#import "snippets/note.typ": *
#show: template.with("Crypto")

= TODO
- Substitution Techniques
- Transposition Techniques
- Encryption & Decryption
- Symmetric & Asymmetric key Cryptography
- Key Range & Key Size

#pagebreak()

= DIFFERENCES
== active vs passive attack
== threat vs attack

#pagebreak()

== Cryptography vs Cryptanalysis

#table(
  columns: (20%, auto, auto),
  align: (auto, auto, auto),
  table.header([Aspect], [Cryptography], [Cryptanalysis]),
  table.hline(),
  [Definition],
  [Ensures secure communication through encryption],
  [Involves breaking cryptographic systems],

  [Objective],
  [Protects data confidentiality and integrity],
  [Reveals plaintext or decryption keys],

  [Process],
  [Converts plaintext to ciphertext],
  [Analyzes and deciphers ciphertext],

  [Tools and Techniques],
  [Encryption algorithms, keys],
  [Brute force attacks, frequency analysis],

  [Goal],
  [Maintain data security and privacy],
  [Identify weaknesses and vulnerabilities],
  [Focus],
  [Prevents unauthorized access to plaintext],
  [Focuses on deciphering ciphertext to access plaintext],

  [Role],
  [Ensures secure communication and information protection],
  [Challenges cryptographic systems for vulnerabilities],

  [Importance],
  [Crucial for securing sensitive information],
  [Essential for evaluating and improving cryptographic systems],

  [Impact],
  [Mitigates risks of data breaches and unauthorized access],
  [Poses a threat to data security if successful],
)

#pagebreak()

== AES vs DES

#table(
  columns: 2,
  align: (auto, auto),
  table.header([AES], [DES]),
  table.hline(),
  [AES stands for Advanced Encryption Standard],
  [DES stands for Data Encryption Standard],

  [The date of creation is 2001.], [The date of creation is 1977.],
  [Byte-Oriented.], [Bit-Oriented.],
  [The design rationale for AES is open.], [The design rationale for DES is closed.],
  [It is faster than DES.], [It is slower than AES.],
  [It is flexible.], [It is not flexible.],
  [AES can encrypt 128 bits of plaintext.], [DES can encrypt 64 bits of plaintext.],

  [Key length can be 128-bits, 192-bits, and 256-bits.],
  [The key length is 56 bits in DES.],

  [Number of rounds depends on key length: 10(128-bits), 12(192-bits), or
    14(256-bits)],
  [DES involves 16 rounds of identical operations],

  [The structure is based on a substitution-permutation network.],
  [The structure is based on a
    #link("https://www.geeksforgeeks.org/python/feistel-cipher/")[Feistel]
    network.],

  [The selection process for this is secret but accepted for open public comment.],
  [The selection process for this is secret.],

  [AES is more secure than the DES cipher and is the de facto world standard.],
  [DES can be broken easily as it has known vulnerabilities. 3DES(Triple DES) is a
    variation of DES which is secure than the usual DES.],

  [The rounds in AES are: Byte Substitution, Shift Row, Mix Column and Key Addition],
  [The rounds in DES are: Expansion, XOR operation with round key, Substitution and
    Permutation],

  [It can generate Ciphertext of 128, 192, 256 bits.],
  [It generates Ciphertext of 64 bits.],

  [AES cipher is derived from an aside-channel square cipher.],
  [DES cipher is derived from Lucifer cipher.],

  [AES was designed by Vincent Rijmen and Joan Daemen.], [DES was designed by IBM.],

  [No known crypt-analytical attacks against AES but side channel attacks against AES
    implementations possible. Biclique attacks have better complexity than brute
    force but still ineffective.],
  [Known attacks against DES include Brute-force, Linear crypt-analysis, and
    Differential crypt-analysis.],

  [It is efficient with both hardware and software.],
  [It is efficient only with hardware.],
)

#pagebreak()

== monoalphabatic vs polyalphabetic

// https://www.geeksforgeeks.org/computer-networks/difference-between-monoalphabetic-cipher-and-polyalphabetic-cipher/
#table(
  columns: (50%, 50%),
  align: center,
  table.header([Monoalphabetic Cipher], [Polyalphabetic Cipher]),
  [A monoalphabetic cipher is one where each symbol in plain text is mapped to a
    fixed symbol in cipher text.],
  [Polyalphabetic cipher is any cipher based on substitution, using multiple
    substitution alphabets.],

  [The relationship between a character in the plain text and the characters in the
    cipher text is one-to-one.],
  [The relationship between a character in the plain text and the characters in the
    cipher text is one-to-many.],

  [Each alphabetic character of plain text is mapped onto a unique alphabetic
    character of a cipher text.],
  [Each alphabetic character of plain text can be mapped onto 'm' alphabetic
    characters of a cipher text.],

  [A stream cipher is a monoalphabetic cipher if the value of key does not depend on
    the position of the plain text character in the plain text stream.],
  [A stream cipher is a polyalphabetic cipher if the value of key does depend on the
    position of the plain text character in the plain text stream.],

  [It includes additive, multiplicative, affine and monoalphabetic substitution
    cipher.],
  [It includes autokey, Playfair, Vigenere, Hill, one-time pad, rotor, and Enigma
    cipher.],

  [It is a simple substitution cipher.], [It is multiple substitutions cipher.],

  [Monoalphabetic Cipher is described as a substitution cipher in which ~the same
    fixed mappings from plain text to cipher letters across the entire text are
    used.],
  [Polyalphabetic Cipher is described as substitution cipher in which plain text
    letters in different positions are enciphered using different cryptoalphabets.],

  [Monoalphabetic ciphers are not that strong as compared to polyalphabetic cipher.],
  [Polyalphabetic ciphers are much stronger.],
)

#pagebreak()

= CRYPTOGRAPHY

== Core Principles of Cryptography [TODO: uniq]

- / Data Confidentiality: Confidentiality ensures that information is accessible only
    to authorized individuals or systems. It is usually enforced through encryption
    techniques and confidentiality agreements.
- / Data Integrity: Data integrity ensures that information remains accurate,
    complete, and unchanged throughout its lifecycle. Any unauthorized modification
    of data can be detected.
- / Authentication: Authentication verifies the identity of a user or system and
    confirms that the data being claimed actually belongs to the sender.
- / Non-Repudiation: Non-repudiation guarantees that a sender cannot deny sending a
    message or signing a document. It provides proof of origin and delivery of data.

- / Confidentiality: Information can only be accessed by the person for whom it is
    intended and no other person except him can access it.
- / Non-repudiation: The creator/sender of information cannot deny his intention to
    send information at a later stage.
- / Integrity: Information cannot be modified in storage or transition between sender
    and intended receiver without any addition to information being detected.
- / Adaptability: Cryptography continuously evolves to stay ahead of security threats
    and technological advancements.
- / Interoperability: Cryptography allows for secure communication between different
    systems and platforms.
- / Authentication: The identities of the sender and receiver are confirmed. As well
    destination/origin of the information is confirmed.

== Types of Cryptography

- / Symmetric-Key Cryptography: \ Uses a single shared key for both encryption and
    decryption Fast and efficient Requires secure key exchange Example: AES, DES
- / Asymmetric-Key Cryptography: \ Uses a pair of keys: public key and private key
    Public key encrypts data, private key decrypts it More secure but slower than
    symmetric cryptography Example: RSA
- / Hash Functions: \ Convert data of any size into a fixed-length output Used to
    verify data integrity One-way function (cannot be reversed) Example: SHA-256

== Applications of Cryptography

- / Secure Online Transactions: Protects sensitive data in online banking and
    e-commerce
- / Digital Signatures: Verifies authenticity and integrity of digital documents
    Password
- / Protection: Encrypts stored passwords to prevent theft
- / Military and Intelligence: Secures classified information and communication
    channels

#pagebreak()

= CRYPTANALYSIS

== Types of Attacks (broad categories)

- / Passive Attacks:
    Attackers silently monitor or intercept data No modification of data occurs
    Examples: Eavesdropping, traffic analysis
- / Active Attacks:
    Attackers modify, delete, or disrupt data Can cause serious damage to systems
    Examples: Data modification, denial-of-service attacks

== Types of Attacks (detailed)

- / Known-Plaintext Analysis (KPA): In this type of attack, some plaintext-ciphertext
    pairs are already known. Attacker maps them in order to find the encryption key.
    This attack is easier to use as a lot of information is already available.
- / Chosen-Plaintext Analysis (CPA): In this type of attack, the attacker chooses
    random plaintexts and obtains the corresponding ciphertexts and tries to find the
    encryption key. Its very simple to implement like KPA but the success rate is
    quite low.
- / Ciphertext-Only Analysis (COA): In this type of attack, only some cipher-text is
    known and the attacker tries to find the corresponding encryption key and
    plaintext. Its the hardest to implement but is the most probable attack as only
    ciphertext is required.
- / Man-In-The-Middle (MITM) attack: In this type of attack, attacker intercepts the
    message/key between two communicating parties through a secured channel.
- / Adaptive Chosen-Plaintext Analysis (ACPA): This attack is similar CPA. Here, the
    attacker requests the cipher texts of additional plaintexts after they have
    ciphertexts for some texts.
- / Birthday attack: This attack exploits the probability of two or more individuals
    sharing the same birthday in a group of people. In cryptography, this attack is
    used to find collisions in a hash function.
- / Side-channel attack: This type of attack is based on information obtained from
    the physical implementation of the cryptographic system, rather than on
    weaknesses in the algorithm itself. Side-channel attacks include timing attacks,
    power analysis attacks, electromagnetic attacks, and others.
- / Brute-force attack: This attack involves trying every possible key until the
    correct one is found. While this attack is simple to implement, it can be
    time-consuming and computationally expensive, especially for longer keys.
- / Differential cryptanalysis: This type of attack involves comparing pairs of
    plaintexts and their corresponding ciphertexts to find patterns in the encryption
    algorithm. It can be effective against block ciphers with certain properties.

#pagebreak()

= CLASSICAL CRYPTOGRAPHY

The roots are cryptography are found in Roman and Egyptian civilizations. Below are
some of the ancient types of cryptography:

1. / Hieroglyphs Cryptography: The earliest known use of Cryptography can be dated
    back to 1900 BCE during the time of the Old Kingdom of Egypt in form of
    non-standard hieroglyphs.
    - Hieroglyphs were a secret form of communication that the Egyptians used to
      communicate with one another.
    - This secret text was known only to the scribes of the kings who used to
      transmit messages on their behalf.

2. / Caesar Cipher: The ancient Greeks were well known for the use of Ciphers. The
    Caesar Cipher or Shift Cipher is one of the earliest and simplest well-known
    cryptographic techniques. It is a form of Substitution Cipher where each
    character in a word is replaced by a fixed number of positions. For example with
    a shift of 3, A is replaced by D, B by E, and so on.

3. / Vigenere Cipher: During the 16th century, Vigenere designed a cipher in which
    the encryption key is repeated multiple times spanning the entire message, and
    then the cipher text is generated by adding the message character with key
    character modulo 26. This approach is also vulnerable to attacks, where the
    secrecy of the message depends on the secrecy of the encryption key.

4. / Hebern rotating machine: At the start of the 19th century, Hebern designed a
    Hebern rotating machine. In this machine, a single rotor is used where the secret
    key is embedded in the rotating disc and the key has an embedded substitution
    table. Each key press from the keyboard resulted in the output of cipher text.
    This code is broken by using the letter frequencies.

5. / Enigma machine: Cryptography played a vital in the victory of Allied forces
    during World War I and World War II. World War II prominently saw the use of
    electromechanical cipher machines. The story of the Allied victory over the
    Germans by cracking the world-famous Enigma machine is well known. Like all rotor
    machines, Enigma is a combination of electro-mechanical subsystems. It consisted
    of somewhat three to five rotors. Whenever a key was pressed, one or more rotors
    rotated on the spindle, and accordingly, the key was scrambled to something else.
    The Enigma cipher was broken by Poland.

#pagebreak()

= TYPES OF CRYPTOGRAPHIC ALGORITHMS

== 1. Advanced Encryption Standard (AES)

AES (Advanced Encryption Standard) is a popular encryption algorithm which uses the
same key for encryption and decryption It is a symmetric block cipher algorithm with
block size of 128 bits, 192 bits or 256 bits. AES algorithm is widely regarded as the
replacement of DES (Data encryption standard) algorithm, which we will learn more
about later in this article.

There are many types of AES depending on the rounds:

- AES-128 uses 10 rounds
- AES-192 uses 12 rounds
- AES-256 uses 14 rounds

The more rounds there are, the safer the encryption. This is why AES-256 is
considered the safest encryption.

#image("./assets/aes.png", width: 70%)

=== Characteristics of AES Algorithm

- / Many key sizes: Three key sizes available: 128, 192, and 256 bits
- / Security: Strong security measures to protect against threats
- / Versatile: It is versatile because it can be used for both hardware and software
- / Wide applications: Widely adopted in various applications, including:Google
    Cloud, Facebook and Password managers.

=== Applications of AES

- / Wireless security: AES is used in securing wireless networks, such as Wi-Fi
    networks, to ensure data confidentiality and prevent unauthorized access.
- / Database Encryption: AES can be applied to encrypt sensitive data stored in
    databases. This helps protect personal information, financial records, and other
    confidential data from unauthorized access in case of a data breach.
- / Secure communications: AES is widely used in protocols such as internet
    communications, email, instant messaging, and voice/video calls. It ensures that
    the data remains confidential.
- / Data storage: AES is used to encrypt sensitive data stored on hard drives, USB
    drives, and other storage media, protecting it from unauthorized access in case
    of loss or theft.
- / Virtual Private Networks (VPNs): AES is commonly used in VPN protocols to secure
    the communication between a user's device and a remote server. It ensures that
    data sent and received through the VPN remains private and cannot be deciphered
    by eavesdroppers.
- / Secure Storage of Passwords: AES encryption is commonly employed to store
    passwords securely. Instead of storing plaintext passwords, the encrypted version
    is stored. This adds an extra layer of security and protects user credentials in
    case of unauthorized access to the storage.
- / File and Disk Encryption: AES is used to encrypt files and folders on computers,
    external storage devices, and cloud storage. It protects sensitive data stored on
    devices or during data transfer to prevent unauthorized access.

== 2. Data Encryption Standard (DES)

DES is an older encryption algorithm that is used to convert 64-bit plaintext data
into 48-bit encrypted ciphertext. It uses symmetric keys (which means same key for
encryption and decryption). It is kind of old by today's standard but can be used as
a basic building block for learning newer encryption algorithms.

=== Characteristics of DES

- / Same symmetric key: DES uses symmetric-key algorithm and therefore, encryption
    and decryption can be done by single key using same algorithm.
- / Easier Implementation: DES was designed for hardwares rather than software and
    shows efficiency and fast implementation in hardwares.
- / Cipher technique: Transposition and substitution cipher is used: This algorithm
    uses both transposition cipher and substitution cipher technique.
- / Building block: DES technique acts as a building block for other cryptographic
    algorithms.

== 3. RSA Algorithm (Rivest, Shamir, Adleman Algorithm)

So, RSA is an basic asymmetric cryptographic algorithm which uses two different keys
for encryption. The RSA algorithm works on a block cipher concept that converts plain
text into cipher text and vice versa.

RSA algorithm is an asymmetric cryptography algorithm. Asymmetric actually means that
it works on two different keys i.e. Public Key and Private Key. As the name describes
that the Public Key is given to everyone and the Private key is kept private.

=== Characteristics of RSA Algorithm

- / Security: Many consider the RSA method to be highly secure and widely used for
    transmitting data
- / Fast Speed: The RSA approach is known for its speed. Can be implemented swiftly
    when cryptography needs arise.
- / Different keys: In the RSA technique two separate keys are utilized for
    encrypting and decrypting data. The public key is used to encrypt the information
    while the private key is employed for decryption.
- / Key exchange: With the RSA method secure exchange can be achieved, enabling two
    parties to swap a key without transmitting it over the network.

== 4. Secure Hash Algorithm (SHA)

SHA is used to generate unique fixed-length digital fingerprints of input data known
as hashes. SHA variations such as SHA-2 and SHA-3 are commonly used to ensure data
integrity and authenticity. The tiniest change in input data drastically modifies the
hash output, indicating a loss of integrity. Hashing is the process of storing key
value pairs with the help of a hash function into a hash table.

=== Characteristics of Secure Hash Algorithm (SHA)

- / Security: The SHA 256 is highly recognized for its robust security features,
    among hashing algorithms. It effectively prevents collision attacks ensuring that
    different inputs do not produce the hash value. Websites prioritize user privacy
    by storing passwords in a format.
- / One-way hashing: Using SHA algorithms for one way hashing enables the storage of
    information like passwords. Data hashing into a fixed length output simplifies
    indexing and comparisons. Even a minor change in the message results, in a hash
    when using SHA algorithms facilitating the identification of corrupted data.
- / Avalanche effect: A small change in the input value, even a single bit,
    completely changes the resultant hash value. This is called the
- / Variable input length and fixed output length: SHA algorithm consits of a
    variable input length (meaning the length of input is dynamic) and a fixed output
    length.

#pagebreak()

= SYMMETRIC KEY CRYPTOGRAPHY [TODO]

Symmetrical Key Cryptography also known as conventional or single-key encryption was
the primary method of encryption before the introduction of public key cryptography
in the 1970s. In symmetric-key algorithms, the same keys are used for data encryption
and decryption.
