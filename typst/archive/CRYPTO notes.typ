#import "/typst/snippets/note.typ": *
#show: template.with("Crypto")

#pagebreak()

= CRYPTOGRAPHY VS CRYPTANALYSIS

#table(
  columns: (20%, auto, auto),
  [Aspect], [Cryptography], [Cryptanalysis],

  [Definition],
  [Ensures secure communication through encryption],
  [Involves breaking cryptographic systems],

  [Objective],
  [Protects data confidentiality and integrity],
  [Reveals plaintext or decryption keys],

  [Process], [Converts plaintext to ciphertext], [Analyzes and deciphers ciphertext],

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
  [AES], [DES],

  [AES stands for Advanced Encryption Standard],
  [DES stands for Data Encryption Standard],

  [The date of creation is 2001], [The date of creation is 1977],
  [Byte-Oriented], [Bit-Oriented],
  [The design rationale for AES is open], [The design rationale for DES is closed],
  [It is faster than DES], [It is slower than AES],
  [It is flexible], [It is not flexible],
  [AES can encrypt 128 bits of plaintext], [DES can encrypt 64 bits of plaintext],

  [Key length can be 128-bits, 192-bits, and 256-bits],
  [The key length is 56 bits in DES],

  [Number of rounds depends on key length: 10(128-bits), 12(192-bits), or
    14(256-bits)],
  [DES involves 16 rounds of identical operations],

  [The structure is based on a substitution-permutation network],
  [The structure is based on a Feistel network],

  [The selection process for this is secret but accepted for open public comment],
  [The selection process for this is secret],

  [AES is more secure than the DES cipher and is the de facto world standard],
  [DES can be broken easily as it has known vulnerabilities. 3DES(Triple DES) is a
    variation of DES which is secure than the usual DES],

  [The rounds in AES are: Byte Substitution, Shift Row, Mix Column and Key Addition],
  [The rounds in DES are: Expansion, XOR operation with round key, Substitution and
    Permutation],

  [It can generate Ciphertext of 128, 192, 256 bits],
  [It generates Ciphertext of 64 bits],

  [AES cipher is derived from an aside-channel square cipher],
  [DES cipher is derived from Lucifer cipher],

  [AES was designed by Vincent Rijmen and Joan Daemen], [DES was designed by IBM],

  [No known crypt-analytical attacks against AES but side channel attacks against AES
    implementations possible. Biclique attacks have better complexity than brute
    force but still ineffective],
  [Known attacks against DES include Brute-force, Linear crypt-analysis, and
    Differential crypt-analysis],

  [It is efficient with both hardware and software],
  [It is efficient only with hardware],
)

#pagebreak()

== MONOALPHABATIC VS POLYALPHABETIC CIPHER

// https://www.geeksforgeeks.org/computer-networks/difference-between-monoalphabetic-cipher-and-polyalphabetic-cipher/

#table(
  columns: (50%, 50%),
  align: center,
  [MONOALPHABETIC CIPHER], [POLYALPHABETIC CIPHER],

  [A monoalphabetic cipher is one where each symbol in plain text is mapped to a
    fixed symbol in cipher text],
  [Polyalphabetic cipher is any cipher based on substitution, using multiple
    substitution alphabets],

  [The relationship between a character in the plain text and the characters in the
    cipher text is one-to-one],
  [The relationship between a character in the plain text and the characters in the
    cipher text is one-to-many],

  [Each alphabetic character of plain text is mapped onto a unique alphabetic
    character of a cipher text],
  [Each alphabetic character of plain text can be mapped onto 'm' alphabetic
    characters of a cipher text],

  [A stream cipher is a monoalphabetic cipher if the value of key does not depend on
    the position of the plain text character in the plain text stream],
  [A stream cipher is a polyalphabetic cipher if the value of key does depend on the
    position of the plain text character in the plain text stream],

  [It includes additive, multiplicative, affine and monoalphabetic substitution
    cipher],
  [It includes autokey, Playfair, Vigenere, Hill, one-time pad, rotor, and Enigma
    cipher],

  [It is a simple substitution cipher], [It is multiple substitutions cipher],

  [Monoalphabetic Cipher is described as a substitution cipher in which ~the same
    fixed mappings from plain text to cipher letters across the entire text are
    used],
  [Polyalphabetic Cipher is described as substitution cipher in which plain text
    letters in different positions are enciphered using different cryptoalphabets],

  [Monoalphabetic ciphers are not that strong as compared to polyalphabetic cipher],
  [Polyalphabetic ciphers are much stronger],
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

= CRYPTANALYSIS <B1>

== Definition
- Cryptology has two parts: Cryptography and Cryptanalysis
- The person is called a Cryptanalyst
- tries to break the security
- simulation of real attack
- helps finding any weak point
- To determine the weak points of a cryptographic system
- it is important to attack the system to assess hardening
- This attacks are called Cryptanalytic attacks.
- The attacks rely on nature of the algorithm and also knowledge of the general
  characteristics of the plaintext,

== Types of Attacks (text based)

- / Ciphertext-only attack: cryptanalyst has access to the ciphertext and attempts to
    deduce the plaintext
- / Known-plaintext attack: cryptanalyst has access to both the plaintext and the
    corresponding ciphertext, and attempts to deduce the encryption key
- / Chosen-plaintext attack: cryptanalyst can choose the plaintext to be encrypted
    and has access to the corresponding ciphertext, and attempts to deduce the
    encryption key
- / Side-channel attack: The cryptanalyst exploits information about the
    implementation of the encryption algorithm, such as timing or power consumption,
    to deduce the encryption key

== Types of Attacks (Active and Passive) <C6>

=== Passive Attacks

In a passive attack, the hacker's goal is strictly to obtain information. They do not
alter data, inject malicious code, or disrupt the system's normal operation.

Because they leave no footprint and don't trigger system alerts (since everything
continues to function normally), passive attacks are notoriously difficult to detect.

/ Primary Goal: Data theft, espionage, or reconnaissance.
/ Common Examples:
  / Eavesdropping / Packet Sniffing: Intercepting unencrypted network traffic to
    steal passwords, emails, or financial data.
  / Traffic Analysis: Even if the data is encrypted, attackers can monitor the
    frequency, size, and destination of data packets to guess what is happening
    (e.g., detecting a sudden spike in traffic between a CEO and a merger &
    acquisition firm).
/ Best Defense: Since detection is so hard, defense relies on prevention, primarily
  through strong encryption (like HTTPS, VPNs, and end-to-end encryption). If an
  attacker intercepts encrypted data, they cannot read it.

== Active Attacks

In an active attack, the hacker attempts to alter system resources, modify data, or
affect the operation of a network.

Because they actively change things or flood systems with traffic, they usually leave
a digital trail (like error logs, modified files, or crashed servers), making them
easier to detect than passive attacks.

/ Primary Goal: Disruption, extortion, unauthorized access, or data corruption.
/ Common Examples:
  / Denial of Service (DoS) / DDoS: Flooding a server with fake traffic so legitimate
    users cannot access it.
  / Man-in-the-Middle (MitM) Attacks: Intercepting a conversation between two parties
    and actively altering the messages before passing them along.
  / Malware & Ransomware: Injecting malicious code to lock files, steal data, or
    destroy system architecture.
  / Spoofing: Impersonating a legitimate device or user to gain access to a network.
/ Best Defense: A combination of prevention and active detection. This includes
  Firewalls, Intrusion Detection Systems (IDS), Multi-Factor Authentication (MFA),
  and endpoint antivirus software.

== Difference between (Active and Passive)

#table(
  columns: (17%, auto, auto),

  [Feature], [Passive Attacks], [Active Attacks],

  [Objective],
  [Steal information or monitor activity.],
  [Disrupt, modify, or destroy systems/data.],

  [Impact on System],
  [None. Normal operations continue.],
  [High. Systems may crash, slow down, or show altered data.],

  [Detectability],
  [Very difficult (leaves almost no trace).],
  [Easier (creates anomalies, logs, and disruptions).],

  [Primary Defense],
  [Encryption (make the data unreadable).],
  [Firewalls & IDS (block and detect intruders).],

  [Analogy],
  [Reading someone's mail through an envelope.],
  [Tearing up the mail or writing a fake letter.],
)

== Methods of Attacks

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

#table(
  columns: 6,
  [Feature], [DES], [3DES], [AES], [RSA], [IDEA],
  [Key Size], $64-8=56$, [112 or 168], [128, 192, or 256], [2048, 4096], [128],
  [Block Size], [64], [64], [128], [], [64],
  [Theory], [Feistel], [Feistel], [], [Prime], [Lai-Massey],
  [Security], [Insecure], [Secure but legacy], [Secure], [Secure], [],
  [Speed], [Fast in hardware], [Slow], [Very], [Slow], [],
  [Status], [Deprecated], [Deprecated], [Current Standard], [Current Standard], [],
)

#pagebreak()

= DES #emoji.star <C1>

== Characteristics
- DES is an implementation of a Feistel Cipher
- older encryption algorithm
- 64-bit plaintext data -> 48-bit encrypted ciphertext
/ Feistel Network Architecture: The algorithm divides the 64-bit data block into two
  32-bit halves and processes them through multiple identical stages (rounds).
/ Key: is 64bit out of which 8bits are used for parity
/ Subkeys: A key schedule algorithm generates sixteen distinct 48-bit subkeys from
  the original 56-bit key one for each round.
/ Block Cipher: processes in chunks of 64bits and produces 64bit ciphertext
/ symmetric key: both encryption and decryption are done by same key
/ Rounds: It executes 16 identical rounds of processing for each block of data.
/ Cipher technique: Transposition and substitution cipher is used: This algorithm
  uses both transposition cipher and substitution cipher technique.
/ Building block: DES technique acts as a building block for other cryptographic
  algorithms.
/ Avalanche Effect: A minor change in either the plaintext or the key results in a
  drastic change in the ciphertext, making statistical analysis difficult.
/ Easier Implementation: DES was designed for hardwares rather than software and
  shows efficiency and fast implementation in hardwares.
/ Obsolescence: DES is no longer considered secure for modern applications.
/ Vulnerability: Its primary weakness is its short 56-bit key length, making it
  highly vulnerable to brute-force attacks (exhaustively searching all $2^56$
  possible keys).
/ Successors: Because of these vulnerabilities, it was initially adapted into Triple
  DES (3DES), which applies the algorithm three times, and was eventually permanently
  superseded by the Advanced Encryption Standard (AES).

/ Substitution and Permutation: The core encryption relies on alternating processes:
  - S-boxes (Substitution): The non-linear component of DES that provides confusion
    by substituting input bits with different output bits.
  - P-boxes (Permutation): The linear component that provides diffusion by
    rearranging the bits.

== Applications

- Legacy financial systems are a big one. Older ATMs and Point-of-Sale terminals were
  built with hardware chips that only spoke DES or 3DES. Upgrading them means
  replacing physical machines. That takes time and money.
- You also see it in protocol compatibility. Some industrial control systems running
  on legacy tech still need these older cipher suites to communicate with each other.
- Random number generators used to use DES as a mixing function, too. It effectively
  scrambled the numbers, making them unpredictable.

== Algorithm

#img("assets/des.webp")
#img("assets/des_depth.webp")

#pagebreak()

= AES

== Characteristics

- symmetric block cipher algorithm
- / Many key sizes: Three key sizes available: 128, 192, and 256 bits
  - AES-128 uses 10 rounds
  - AES-192 uses 12 rounds
  - AES-256 uses 14 rounds
- / Security: Strong security measures to protect against threats
- / Versatile: It is versatile because it can be used for both hardware and software
- / Wide applications: Widely adopted in various applications, including:Google
    Cloud, Facebook and Password managers.

== Applications

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

== Algorithm

#img("assets/aes.png")

#pagebreak()

= RSA #emoji.star

/ Asymmetric Cryptography: RSA uses a pair of mathematical keys. A public key (which
  can be shared with anyone) is used to encrypt data, and a matching private key
  (kept strictly secret) is used to decrypt it.
/ Mathematical Foundation: Its security relies heavily on the "Integer Factorization
  Problem." It is very easy for a computer to multiply two large prime numbers
  together, but it is incredibly difficult and time-consuming to take that resulting
  massive number and figure out what the original two prime numbers were.
/ Block Cipher: RSA encrypts data in distinct chunks (blocks) rather than as a
  continuous stream of bits.
/ Key Length: Because computing power constantly increases, RSA requires very large
  key sizes to remain secure. Today, 2048-bit or 4096-bit keys are the standard.

== Applications

/ Key Exchange (Hybrid Encryption): Because RSA is slow, it is rarely used to encrypt
  massive files directly. Instead, it is used to securely transmit a much faster
  "symmetric key" (like AES) between two computers. Once both computers have the
  symmetric key, they use that for the heavy lifting. This is how the "S" in HTTPS
  works (TLS/SSL protocols).
/ Digital Signatures: RSA can operate in reverse to verify identity. If you encrypt a
  document's fingerprint (hash) with your private key, anyone can use your public key
  to decrypt it. If it works, it proves absolutely that you (and only you) sent the
  message and that it hasn't been tampered with.
/ Secure Email: Protocols like PGP (Pretty Good Privacy) rely on RSA to encrypt
  emails and verify the sender's identity.
/ Network Security: RSA is widely used in establishing Secure Shell (SSH) connections
  and Virtual Private Networks (VPNs) to authenticate servers and users.

== Advantages

/ Security: RSA algorithm is considered to be very secure and is widely used for
  secure data transmission.
/ Solves the Key Distribution Problem: In symmetric encryption, two parties must
  figure out how to securely share a secret key before they can talk. RSA eliminates
  this, you can broadcast your public key to the world without risking your security.
/ Dual Functionality: It is highly versatile, providing both data confidentiality
  (through encryption) and non-repudiation/authenticity (through digital signatures).
/ Time-Tested Reliability: Having been introduced in 1977, RSA has been subjected to
  decades of intense cryptanalysis. When implemented correctly with large keys, it
  remains highly secure against modern classical computers.

== Disadvantages

/ Extremely Slow: The complex mathematics (exponentiation with massive numbers) makes
  RSA 100 to 1,000 times slower than symmetric algorithms like AES.
/ Resource Intensive: Generating keys and encrypting/decrypting data requires
  significant CPU power and memory. This makes RSA less ideal for low-power devices,
  like smart cards or tiny Internet of Things (IoT) sensors.
/ Vulnerability to side-channel attacks: RSA algorithm is vulnerable to side-channel
  attacks, which means an attacker can use information leaked through side channels
  such as power consumption, electromagnetic radiation, and timing analysis to
  extract the private key.
/ Large key size: RSA algorithm requires large key sizes to be secure, which means
  that it requires more computational resources and storage space.
/ Strict Implementation Rules: Standard, "textbook" RSA is vulnerable to specific
  mathematical attacks. It must be implemented using complex padding schemes (like
  RSA-OAEP) to ensure attackers cannot manipulate the ciphertext.
/ Complexity: The RSA algorithm is a sophisticated mathematical technique that some
  individuals may find challenging to comprehend and use.
/ The Quantum Threat: RSA is highly vulnerable to future quantum computers. A
  sufficiently powerful quantum computer running "Shor's Algorithm" could factor the
  underlying prime numbers in minutes, instantly breaking the encryption.

== Example [TODO] <C3>

== RSA Numerical <C4>

// https://engineering.purdue.edu/kak/compsec/NewLectures/Lecture12.pdf

The computational steps for key generation are
1. Generate two different primes $p$ and $q$
2. Calculate the modulus \
  $n = p × q$
3. Calculate the totient \
  $phi.alt(n) = (p − 1) × (q − 1)$
4. Select for public exponent an integer e such that \
  $1 < e < phi.alt(n)$ and $gcd(phi.alt(n), e) = 1$
5. Calculate for the private exponent a value for d such that \
  $(d times e) mod (phi.alt(n)) = 1$ \
6. Public Key = $[e, n]$
7. Private Key = $[d, n]$

- ENCRYPTION: $C = M^e mod phi.alt(n)$
- DECRYPTION: $M = C^d mod phi.alt(n)$

#pagebreak()

= SHA

SHA is used to generate unique fixed-length digital fingerprints of input data known
as hashes. SHA variations such as SHA-2 and SHA-3 are commonly used to ensure data
integrity and authenticity. The tiniest change in input data drastically modifies the
hash output, indicating a loss of integrity. Hashing is the process of storing key
value pairs with the help of a hash function into a hash table.

== Characteristics

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

= IDEA #emoji.star <C2>

== Characteristics

/ Symmetric-Key Cipher: IDEA uses the same 128-bit key for both the encryption and
  decryption processes.
/ Block Size: It operates on fixed 64-bit blocks of plaintext and ciphertext.
/ Key Length: It utilizes a 128-bit key, making it significantly more resistant to
  brute-force attacks compared to DES.
/ Structure: It relies on a Lai-Massey scheme rather than the traditional Feistel
  network used by DES.
/ No S-Boxes: Unlike many other block ciphers, IDEA completely avoids the use of
  Substitution boxes (S-boxes) or lookup tables.
/ Mixed Algebraic Groups: To create confusion and diffusion, IDEA relies on
  interleaving three distinct, mathematically "incompatible" operations on 16-bit
  words. These operations are:
  - Bitwise Exclusive-OR ($xor$)
  - Addition modulo $2^16$ (denoted by $plus.square$)
  - Multiplication modulo $2^16 + 1$ (denoted by $dot.o$)
  - / Confusion: The ciphertext should rely on the plaintext and key in a complex and
      effective manner. The goal is to make it more difficult to determine how the
      ciphertext statistics relate to the plaintext statistics. IDEA achieves this
      purpose by three distinct actions, as discussed subsequently. This contrasts
      with DES, which is based primarily on the XOR operation and small nonlinear
      S-boxes.
  - / Diffusion: Each plaintext bit should impact every ciphertext bit, just as each
      key bit should influence every ciphertext bit. The dispersion of a single
      plaintext bit over multiple ciphertext bits obscures the plaintext\'s
      statistical structure. IDEA is highly effective in this aspect.

== Applications

Because of its high security and the expiration of its patents making it completely
free for commercial and non-commercial use, IDEA has been utilized in various fields:

/ Email Privacy: IDEA was famously adopted as the default symmetric cipher in early
  versions of Pretty Good Privacy (PGP) v2.0 to encrypt email content. It remains an
  optional algorithm in the OpenPGP standard.
/ Financial Services: Used to secure sensitive financial data and banking
  transactions.
/ Broadcasting: Employed in the encryption of audio and video data for pay-TV, cable
  television, and secure video conferencing.
/ Government & Military: Historically used by various organizations to secure data
  transmission and storage due to its resistance to differential cryptanalysis.

+ Secure Communications
  - Virtual Private Networks
  - Encrypted messaging systems
  - Secure email protocols
+ Data Protection
  - File encryption
  - Database security
  - Storage encryption
+ Financial Security
  - Electronic payment systems
  - Banking applications
  - Transaction security
+ / Secure communication: IDEA can be used to encrypt data transmitted over
    communication networks such as the internet, providing confidentiality and
    protecting against unauthorized access. + / Financial transactions: IDEA can be
    used to secure financial transactions such as online banking and credit card
    transactions, helping to prevent identity theft and fraud.
+ / Electronic voting systems: IDEA can be used to encrypt votes in electronic voting
    systems, providing secure and confidential voting.
+ / File encryption: IDEA can be used to encrypt files and folders on a computer or
    other storage device, protecting them from unauthorized access.
+ / Password protection: IDEA can be used to encrypt passwords and other sensitive
    information stored on a computer or network, helping to prevent unauthorized
    access and data breaches.

== Algorithm

CORE OPERATIONS:
+ Bitwise XOR (^)
+ Addition modulo 2^4 (+)
+ Multiplication modulo (2^4+1) (\*)

=== 1. Key Generation (Key Schedule)

IDEA requires 52 subkeys (each 16 bits long) to complete its process (6 keys for each
of the 8 rounds, plus 4 keys for the final half-round).

+ The initial 128-bit key is divided into eight 16-bit subkeys ($K_1$ to $K_8$).
+ Once these 8 subkeys are extracted, the original 128-bit key is subjected to a
  circular left shift of 25 bits.
+ The newly shifted 128-bit key is again divided to extract the next eight 16-bit
  subkeys.
+ This shifting and extraction process is repeated until all 52 subkeys are
  generated.

=== 2. The Encryption Process (Rounds 1 to 8)

The 64-bit plaintext block is divided into four 16-bit sub-blocks:
$P_1, P_2, P_3, "and" P_4$. Each of the 8 rounds takes these four sub-blocks and six
16-bit subkeys to perform the following exact sequence of 14 steps:

#grid(
  columns: 2,
  img("assets/idea.svg"),
  [
    + Multiply $P_1$ and $K_1$.
    + Add $P_2$ and $K_2$.
    + Add $P_3$ and $K_3$.
    + Multiply $P_4$ and $K_4$.
    + XOR the results of Step 1 and Step 3.
    + XOR the results of Step 2 and Step 4.
    + Multiply the result of Step 5 by $K_5$.
    + Add the results of Step 6 and Step 7.
    + Multiply the result of Step 8 by $K_6$.
    + Add the results of Step 7 and Step 9.
    + XOR the results of Step 1 and Step 9.
    + XOR the results of Step 3 and Step 9.
    + XOR the results of Step 2 and Step 10.
    + XOR the results of Step 4 and Step 10.
  ],
)

Before passing the outputs to the next round, the middle two blocks (the results from
steps 12 and 13) are swapped.

=== 3. Output Transformation (Half-Round)

After the 8th round, a final transformation is applied using the last four subkeys
($K_49, K_50, K_51, K_52$) and the four resulting blocks from Round 8 (let's call
them $R_1, R_2, R_3, R_4$).

+ Multiply $R_1$ and $K_49$.
+ Add $R_2$ and $K_50$.
+ Add $R_3$ and $K_51$.
+ Multiply $R_4$ and $K_52$.

The concatenation of these four 16-bit results forms the final 64-bit ciphertext.

=== Decryption

The decryption process in IDEA is structurally identical to the encryption process.
The only difference is that the subkeys are reversed and inverted (using additive
inverses for the addition operations and multiplicative inverses for the
multiplication operations).

== Issues

+ / Key size: While IDEA uses a 128-bit key size, which is generally considered
    secure, it is still theoretically possible to brute-force the key if an attacker
    has enough computing power. This is why longer key sizes are often used in modern
    encryption algorithms.
+ / Patents: IDEA was originally patented, which limited its availability and
    adoption in certain countries. While the patent has since expired, this could
    still be a consideration for some organizations.
+ / Block size: IDEA has a fixed block size of 64 bits, which can limit its
    effectiveness in certain applications where larger block sizes are required.
+ / Implementation issues: Like any encryption algorithm, IDEA can be vulnerable to
    implementation issues such as side-channel attacks or implementation flaws. This
    highlights the importance of using best practices and careful implementation when
    using any encryption algorithm.
+ / Availability: While IDEA is still considered to be a strong and effective
    encryption algorithm, it has been largely replaced by newer algorithms such as
    AES in modern applications. This means that support and availability of IDEA
    implementations may become more limited over time

#pagebreak()

= DoS ATTACK <B2>

- malicious actor attempts to make a service unavailable to its intended users
- like a massive traffic jam on a highway
- servers have a process limit
- flooding the target with an overwhelming amount of junk data or artificial requests
- processing fake traffic uses up all of its resources

== Common Types of DoS Attacks

/ Volume-Based Attacks: The attacker attempts to consume all the available bandwidth
  between the target and the larger internet. It is purely a numbers game,
  overwhelming the system with sheer volume.
/ Protocol Attacks: These consume actual server resources or intermediate
  communication equipment like firewalls and load balancers. They exploit weaknesses
  in how network connections are initiated (eg: a SYN flood, where the attacker
  repeatedly starts a connection handshake but never finishes it, leaving the server
  "hanging" and wasting its resources).
/ Application Layer Attacks: These are more sophisticated and target specific
  applications. They often mimic legitimate user behavior, such as repeatedly
  refreshing a resource-heavy webpage or submitting complex search queries, which
  quickly exhausts the server's backend database or processing power.

== DoS vs. DDoS: What is the Difference?

/ DoS: The attack originates from a single source (one computer and one internet
  connection). These are generally easier to stop because the target's security
  systems can simply identify and block the single IP address sending the malicious
  traffic.
/ DDoS: The attack is distributed across multiple sources. Attackers usually use a
  "botnet," which is a vast network of thousands or millions of malware-infected
  computers and smart devices (IoT) around the world. Because the attack traffic
  comes from everywhere at once, it is much harder to distinguish from normal traffic
  and much more difficult to block.

== Why Do Attackers Do This?

/ Extortion: Threatening to launch an attack or starting a small one and demanding a
  ransom payment to stop it.
/ Hacktivism: Taking down a website or service to make a political or social
  statement.
/ Business Sabotage: Disrupting a competitor's online store or services, especially
  during a major event like a holiday sale.
/ Smokescreen: Creating chaos to distract a company's security team while a more
  insidious attack (like data theft or network infiltration) happens in the
  background.

#pagebreak()

= STREAM AND BLOCK CIPHERS #emoji.star

== Stream Cipher <B3>
A stream cipher encrypts data continuously, one binary digit (bit) or byte at a time.
It works by taking a secret key and an initialization vector (IV) to generate a
continuous, pseudorandom sequence of bits called a keystream. This keystream is then
combined with the plaintext data, typically using an Exclusive-OR (XOR) mathematical
operation, to create the ciphertext. Because they encrypt data on the fly, stream
ciphers are highly efficient for real-time applications where the total amount of
data might not be known in advance, such as secure video or audio streaming.
/ Example: ChaCha20 (widely used in modern web traffic), RC4 (historically used but
  now considered insecure).

== Block Cipher <B4>
A block cipher breaks the plaintext data down into fixed-size chunks, or "blocks"
(commonly 64 or 128 bits long), and encrypts each block one at a time. If the data
being encrypted isn't perfectly divisible by the block size, the final block is
"padded" with extra bits to make it fit. Because encrypting the exact same block of
text with the same key will always produce the exact same ciphertext, block ciphers
use "modes of operation" (like CBC or GCM) to mix data from previous blocks into the
current one, ensuring patterns in the data are hidden.
/ Example: AES (Advanced Encryption Standard, the global standard for secure data),
  DES (older, insecure standard).

== Differences

#table(
  columns: (16%, auto, auto),
  [FEATURE], [STREAM CIPHER], [BLOCK CIPHER],

  [Data Processing],
  [Encrypts data continuously, 1 bit or 1 byte at a time.],
  [Encrypts data in fixed-size blocks (e.g., 64 or 128 bits).],

  [Speed],
  [Generally faster and requires less processing power.],
  [Slightly slower due to complex transformations on large blocks.],

  [Error Propagation],
  [A transmission error affecting one bit only corrupts that specific bit in the
    decrypted text.],
  [A single bit error during transmission will corrupt the entire block upon
    decryption.],

  [Memory Footprint],
  [Low. Requires very little memory, making it great for constrained hardware.],
  [Higher. Needs enough memory to store and process whole blocks of data at once.],

  [Padding],
  [Never requires padding since data is handled bit-by-bit.],
  [Requires padding if the final block of data is smaller than the required block
    size.],

  [Best Use Cases],
  [Real-time streams (video, audio, web traffic), low-hardware environments.],
  [Encrypting files, databases, and large amounts of static data.],

  [Modern Standard], [ChaCha20], [AES (Advanced Encryption Standard)],
)

#pagebreak()

= SYMMETRIC AND ASYMMETRIC KEY CRYPTOGRAPHY

== Symmetric Key Cryptography <B5>

Symmetric key cryptography is a method of digital encryption where the exact same
secret key is used to both encrypt and decrypt information. Because it uses a single
key and relatively straightforward mathematical operations, symmetric key
cryptography is extremely fast and computationally efficient. This makes it the ideal
choice for securing large volumes of data. Whenever you encrypt the hard drive on
your computer, protect files in a massive database, or stream a secure video,
symmetric encryption is usually doing the heavy lifting. The Advanced Encryption
Standard (AES) is currently the most widely used and trusted symmetric encryption
algorithm globally.

However, the primary challenge with this method is known as the "key distribution
problem." For two parties to communicate securely, they must first share that secret
key. If a malicious actor intercepts this key while it is being shared over the
internet, the entire encryption system is compromised the attacker can now read all
the messages. Because of this vulnerability in sharing the key initially, symmetric
cryptography is often paired with asymmetric cryptography (which uses a separate
public and private key) to safely exchange the secret key first, before letting the
fast, symmetric encryption take over for the rest of the conversation.

/ Examples: AES, ChaCha20.

== Asymmetric Key Cryptography <B6>

Asymmetric key cryptography, also known as public-key cryptography, is a security
system that uses a mathematically linked pair of keys rather than a single shared
secret. This pair consists of a public key and a private key. Whatever is encrypted
by one key can only be decrypted by the other.

The primary advantage of this system is that it completely solves the "key
distribution problem" that plagues symmetric cryptography. Because your public key
can only encrypt data and cannot be used to decrypt it, you can share it openly on
the internet, via email, or on a public directory without any risk. You never have to
worry about securely transmitting a secret password to a stranger before talking to
them. As long as you keep your private key absolutely secret and safely stored on
your own device, your communications remain secure. The mathematical algorithms
behind this, such as RSA, rely on "one-way functions" like multiplying massive prime
numbers a process that is easy to do in one direction but virtually impossible for
modern computers to reverse-engineer to figure out the private key.

In the real world, asymmetric cryptography is the foundation of trust on the
internet. It is what allows your web browser to securely connect to a bank or
shopping site (the "https" protocol) without someone intercepting your data along the
way. It is also used to create digital signatures, which prove that a file or message
genuinely originated from you and hasn't been tampered with in transit. However,
because the complex math makes it much slower and more computationally heavy than
symmetric encryption, the two methods are almost always used together. Systems
typically use asymmetric cryptography just long enough to securely introduce the two
parties and safely exchange a fast, temporary symmetric key, which then handles the
heavy lifting of encrypting the actual data stream.

Asymmetric cryptography solves the key distribution problem by using two
mathematically linked keys: a Public Key and a Private Key.

What one key locks, only the other key can unlock.

/ Examples: RSA, ECC (Elliptic Curve Cryptography).

== Differences

#table(
  columns: (20%, auto, auto),
  [FEATURE], [SYMMETRIC CRYPTOGRAPHY], [ASYMMETRIC CRYPTOGRAPHY],
  [Number of Keys], [1: A single shared secret key], [2: one Public, one Private],

  [Speed & Efficiency],
  [*Fast* Uses simpler math],
  [*Slow* Uses complex mathematics like prime factorization],

  [Key Distribution],
  [*Difficult* requires a secure channel to share the key initially],
  [*Easy* the Public Key is meant to be shared openly],

  [Function],
  [The exact same key is used to both encrypt and decrypt the data],
  [The Public key encrypts data, and only the Private key can decrypt it],

  [Key Distribution],
  [*Challenging* The secret key must be securely shared between parties before
    communication begins If intercepted, the system is compromised],
  [*Simple* The Public key can be freely shared with anyone, anywhere The Private key
    simply stays hidden on the owner\'s device],

  [Applications],
  [Encrypting hard drives, securing databases, and encrypting the actual stream of
    data in web traffic or video calls],
  [Securely exchanging keys, creating digital signatures, and identity verification],

  [Examples], [AES, ChaCha20, DES], [Diffie-Hellman, ECC, RSA],
)

= THREAT VS ATTACK <B7>

== Threat

A threat is the possibility of a malicious event occurring. It is a danger that
exists, even if it hasn't happened yet and may never actually happen. Threats
represent the "who" or "what" that could potentially harm your systems, data, or
operations.

/ Example: A known vulnerability in your software (like an unpatched bug), a newly
  discovered strain of malware, a specific group of hackers targeting your industry,
  or even a natural disaster that could destroy a data center.

== Attack

An attack is the actual execution or realization of a threat. It is a deliberate,
active event where someone or something attempts to exploit a vulnerability, breach a
system, steal data, or cause damage.

/ Example: A hacker actively exploiting that unpatched software bug to enter your
  network, a user downloading and running that new strain of malware, or a
  Distributed Denial of Service (DDoS) event crashing your website.

== Summary Comparison

#table(
  columns: (15%, auto, auto),
  [FEATURE], [CYBER THREAT], [CYBER ATTACK],

  [Nature],
  [A state of being; a potential danger.],
  [An event; an active, deliberate action.],

  [Timing],
  [Ongoing, looming, or future.],
  [Happening currently or occurred in the past.],

  [Focus],
  [Identifying what could go wrong (Risk Assessment).],
  [Responding to what is going wrong (Incident Response).],

  [Example],
  [Phishing emails are a common tactic used by cybercriminals.],
  [An employee receives a phishing email, clicks the link, and their credentials are
    stolen.],
)

#pagebreak()

= SUBSTITUTION <B8>

At its core, the substitution technique in cryptography is a method of encrypting
data by replacing units of plaintext (the original message) with ciphertext (the
hidden message), according to a fixed system or key.

Instead of scrambling the order of the letters (which is called transposition), a
substitution cipher changes the identity of the letters themselves.

In a substitution cipher, every letter or group of letters is swapped out for another
letter, number, or symbol. The rule that dictates how the swapping occurs is called
the key. If you know the key, you can easily reverse the process to read the original
message.

== Types of Substitution Ciphers

/ Monoalphabetic Substitution: Every instance of a specific letter in the plaintext
  is replaced by the same corresponding letter in the ciphertext. For example, if "A"
  becomes "D", then every "A" in the message will become a "D".
/ Polyalphabetic Substitution: A more complex version where the substitution rule
  changes throughout the message. An "A" might become a "D" the first time it
  appears, but an "X" the second time, usually dictated by a keyword. This makes it
  much harder to crack.

== The Classic Example: The Caesar Cipher

The most famous historical example is the Caesar Cipher, allegedly used by Julius
Caesar. It is a simple monoalphabetic substitution where the alphabet is simply
shifted by a certain number of spaces.

For example, with a shift of 3:
- A #math.arrow D
- B #math.arrow E
- C #math.arrow F
- #math.dots
- "HELLO" #math.arrow "KHOOR"

#pagebreak()

= TRANSPOSITION <B9>

While a substitution cipher changes the identity of the letters (like swapping 'A'
for 'D'), a transposition technique scrambles the positions of the letters. The
letters themselves remain exactly the same they are just rearranged according to a
specific rule.

If you were to count the frequency of letters in a transposition ciphertext, it would
perfectly match the frequency of the original language (e.g., lots of E's, T's, and
A's in English), which is a major clue for codebreakers trying to figure out which
type of cipher was used.

In a transposition cipher, the plaintext is written out in one format (like a grid or
a specific pattern) and then read back in a completely different format. It is
essentially a systematic anagram. The "key" is the specific path or pattern used to
write and read the message.

TYPES:

/ Columnar Transposition: The message is written out in a grid of a specific width
  (determined by a keyword). Then, the columns are read vertically, out of order
  (usually determined by the alphabetical order of the keyword), to create the
  ciphertext.
/ Reverse Cipher: The simplest transposition. The message is just written backwards.
  "HELLO" becomes "OLLEH".
/ Rail Fence Cipher: The message is written in a zig-zag pattern across a certain
  number of imaginary "rails" (rows), and then read off row by row.

EXAMPLE (RAIL FENCE CIPHER):

Let's look at the Rail Fence Cipher using 3 rails and the message "HELLO WORLD".
First, we typically remove the spaces: "HELLOWORLD".

Write it in a zig-zag:

```
Row 1:  H . . . O . . . L .
Row 2:  . E . L . W . R . D
Row 3:  . . L . . . O . . .
```

ciphertext: `HOLELWRDLO`

#pagebreak()

= DIGITAL SIGNATURE <B10>

A digital signature is the cryptographic equivalent of a handwritten signature or
stamped seal, but it offers far more inherent security. It is a mathematical
technique used to validate the authenticity and integrity of a digital message,
document, or software.

Digital signatures solve three major problems in digital communication:

/ Authentication: It proves that the sender is who they claim to be.
/ Integrity: It proves that the message has not been altered or tampered with in
  transit.
/ Non-repudiation: The sender cannot deny having sent the message later on.

== Mechanism

Digital signatures rely on two cryptographic concepts: Hashing (turning data into a
unique, fixed-length string of characters) and Asymmetric Cryptography (using a
paired Public Key and Private Key).

=== Phase 1: Signing the Message (The Sender)

+ / Hashing: The sender passes their message or document through a mathematical
    algorithm (a hash function). This creates a unique "digest" or hash of the
    document. Even changing a single comma in the document will completely change the
    hash.
+ / Encrypting (Signing): The sender then encrypts this hash using their own Private
    Key. This encrypted hash is the digital signature.
+ / Sending: The sender transmits the original message along with the digital
    signature.

=== Phase 2: Verifying the Message (The Receiver)

+ / Hashing the Received Message: The receiver gets the message and generates a hash
    from it using the same algorithm the sender used.
+ / Decrypting the Signature: The receiver takes the digital signature and decrypts
    it using the sender's Public Key (which is available to anyone). If the
    decryption is successful, it reveals the original hash generated by the sender.
+ / Comparing: The receiver compares their freshly generated hash (from Step 1) with
    the decrypted hash (from Step 2).
    - If they match exactly: The signature is valid. The message is authentic and
      hasn't been tampered with.
    - If they do not match: The signature is invalid. Either the message was altered
      in transit, or it was not signed by the person who owns the private key.

#pagebreak()

= MESSAGE DIGEST <B11>

A message digest is essentially a digital fingerprint for a piece of data. It is a
fixed-length string of characters generated by passing data (like a text file, an
image, or a password) through a mathematical algorithm called a cryptographic hash
function.

== Characteristics

+ / Deterministic (Always the Same): If you pass the exact same file or text through
    the exact same hash function a million times, you will always get the exact same
    message digest.
+ / The Avalanche Effect: This is a critical security feature. If you change even a
    single bit of the original data like changing "hello" to "Hello" (capital H) the
    resulting message digest will change so drastically that it looks completely
    unrelated to the first one.
+ / One-Way (Irreversible): It is computationally impossible to take a message digest
    and reverse-engineer it back into the original data. It is a one-way street. You
    can turn a cow into a hamburger, but you can't turn a hamburger back into a cow.
+ / Collision Resistant: It should be astronomically difficult (virtually impossible)
    to find two different files or pieces of data that result in the exact same
    message digest. When two different inputs produce the same output, it's called a
    "collision."

== Applications

/ Verifying Data Integrity: When you download a large software update, the developer
  will often provide the file's message digest (often called a "checksum") on their
  website. Your computer calculates the digest of the file it just downloaded. If
  your digest matches the developer's digest, you know the file downloaded perfectly
  and wasn't tampered with by a hacker.
/ Storing Passwords Safely: When you create an account on a website, they don't (and
  shouldn't!) save your actual password in their database. Instead, they run your
  password through a hash function and store the message digest. When you log in,
  they hash what you typed and compare it to the stored digest. This way, if the
  database is hacked, the hackers only steal useless, irreversible digests, not the
  actual passwords.
/ Digital Signatures: Message digests are foundational to signing digital documents
  and cryptocurrency transactions. They ensure that a contract hasn't been altered
  after it was digitally signed.

== Examples

/ SHA256: The current industry standard, used in everything from SSL certificates to
  Bitcoin.
/ MD5 & SHA-1: Older algorithms that are now considered broken and obsolete because
  computers became powerful enough to intentionally create "collisions."

#pagebreak()

= AUTHENTICATION <B12>

Authentication is the process of verifying the identity of a user, device, or system.
Whenever you log into an email account, unlock your phone, or use a keycard to enter
a building, you are going through an authentication process. To truly understand
authentication, it helps to look at the three main ways systems verify your identity,
often called the Factors of Authentication:

+ / Something you know (Knowledge Factor): This is the most common and traditional
    method. You prove who you are by providing a piece of secret information that
    theoretically only you should know.
    / Examples: A password, a PIN (Personal Identification Number), or answers to
      security questions (e.g., "What was the name of your first pet?").
+ / Something you have (Possession Factor): This requires you to possess a specific
    physical item or have access to a specific device.
    / Examples: A physical security key (like a YubiKey), a smartphone that receives
      a temporary code via SMS, an Authenticator app generating a time-based code, or
      an ID badge/smartcard.
+ / Something you are (Inherence Factor): This uses your unique physical or
    behavioral characteristics to verify your identity. This is known as biometrics.
    / Examples: A fingerprint scan, facial recognition (like Face ID), iris scans, or
      even voice recognition.

== Types <B13>

/ Password-Based Authentication: This is the oldest and most familiar method, relying
  entirely on the "knowledge factor." You enter a username and a secret string of
  characters.
  / Pros: Easy to implement and widely understood by users.
  / Cons: It is the weakest form of security. Passwords are easily forgotten, reused
    across multiple sites, guessed by automated software (brute-force attacks), or
    stolen via phishing.

/ Multi-Factor (MFA) and Two-Factor (2FA) Authentication: As mentioned earlier, MFA
  requires two or more methods from different categories to grant access.
  / SMS/Email Codes: You receive a one-time passcode (OTP) via text or email. (Note:
    SMS is becoming less secure due to tactics like SIM-swapping).
  / Authenticator Apps: Apps like Google Authenticator or Authy generate a new code
    every 30 seconds . These are much more secure than SMS because they aren't tied
    to your phone number.

/ Biometric Authentication: This method relies on the "inherence factor" by scanning
  your unique physical characteristics.
  / How it works: Fingerprint scanners, facial recognition (like Apple's Face ID),
    iris scanners, and voice recognition .
  / Pros: Highly convenient for the user (no passwords to remember) and very
    difficult for a remote hacker to steal or replicate.

/ Single Sign-On (SSO): SSO allows a user to log in with one single set of
  credentials and gain access to multiple different applications or websites.
  / How it works: When you click "Log in with Google" or "Log in with Apple" on a new
    website, that is a form of SSO. In the corporate world, companies use providers
    like Okta or Microsoft Entra so employees only have to log in once in the morning
    to access their email, HR software, and project management tools.
  / Pros: Reduces "password fatigue" and makes it easier for IT teams to manage
    access.

/ Hardware Token Authentication: This is a highly secure method relying on a physical
  possession factor.
  / How it works: You carry a physical device, like a USB security key (e.g., a
    YubiKey) or a smart card. To log in, you must plug the key into your computer or
    tap it against your phone via NFC.
  / Pros: Practically immune to phishing. Even if a hacker steals your password and
    tricks you into clicking a fake login link, they cannot access your account
    because they do not have your physical key.

/ Passwordless Authentication (The Future): The cybersecurity industry is actively
  trying to kill the password entirely because it is the weakest link. Passwordless
  methods include:
  / Magic Links: You enter your email, and the system sends you a unique link that
    logs you in automatically when clicked.
  / Passkeys: A relatively new standard backed by Apple, Google, and Microsoft.
    Instead of a password, your device creates a hidden cryptographic key. To log in,
    you just use your device's built-in biometrics (like your fingerprint or FaceID)
    to unlock that key.

== What is Multi-Factor Authentication (MFA)?

If a system only asks for a password, it uses Single-Factor Authentication (SFA).
Because passwords can be easily guessed, stolen, or leaked, relying solely on them is
a major security risk.

Multi-Factor Authentication (MFA) often called Two-Factor Authentication (2FA)
requires you to provide at least two different factors before granting access.

For example, when logging into your bank:

+ You enter your password (Something you know).
+ The bank sends a code to your phone, which you must also enter (Something you
  have).

Even if a hacker steals your password, they cannot access your account without also
stealing your physical phone.

#pagebreak()

= SSL #emoji.star <B14>

SSL, or Secure Sockets Layer, is an encryption-based Internet security protocol. It
was first developed by Netscape in 1995 for the purpose of ensuring privacy,
authentication, and data integrity in Internet communications. SSL is the predecessor
to the modern TLS encryption used today.

Whenever you see a padlock icon in your browser's address bar or a web address that
starts with "https" (the "s" stands for secure), you are looking at SSL in action.

- In order to provide a high degree of privacy, SSL encrypts data that is transmitted
  across the web. This means that anyone who tries to intercept this data will only
  see a garbled mix of characters that is nearly impossible to decrypt.
- SSL initiates an authentication process called a handshake between two
  communicating devices to ensure that both devices are really who they claim to be.
- SSL also digitally signs data in order to provide data integrity, verifying that
  the data is not tampered with before reaching its intended recipient.

Originally, data on the Web was transmitted in plaintext that anyone could read if
they intercepted the message. For example, if a consumer visited a shopping website,
placed an order, and entered their credit card number on the website, that credit
card number would travel across the Internet unconcealed.

SSL was created to correct this problem and protect user privacy. By encrypting any
data that goes between a user and a web server, SSL ensures that anyone who
intercepts the data can only see a scrambled mess of characters. The consumer's
credit card number is now safe, only visible to the shopping website where they
entered it.

SSL also stops certain kinds of cyber attacks: It authenticates web servers, which is
important because attackers will often try to set up fake websites to trick users and
steal data. It also prevents attackers from tampering with data in transit, like a
tamper-proof seal on a medicine container.

Without SSL, any computer between you and the server (like the Wi-Fi router at a
local coffee shop or your Internet Service Provider) could intercept your data in
"plaintext" and read exactly what you are typing. SSL provides three critical layers
of protection:

Encryption: Scrambling data so it cannot be read in transit. Authentication: Proving
the website you are connecting to is legitimate and not a fake site set up by a
hacker. Data Integrity: Ensuring the data is not modified or corrupted while
traveling across the internet.


== The Evolution: SSL vs. TLS

SSL is the direct predecessor of another protocol called TLS (Transport Layer
Security). In 1999 the Internet Engineering Task Force (IETF) proposed an update to
SSL. Since this update was being developed by the IETF and Netscape was no longer
involved, the name was changed to TLS. The differences between the final version of
SSL (3.0) and the first version of TLS are not drastic; the name change was applied
to signify the change in ownership.

Since they are so closely related, the two terms are often used interchangeably and
confused. Some people still use SSL to refer to TLS, others use the term "SSL/TLS
encryption" because SSL still has so much name recognition.

== SSL Handshake

SSL solves a massive problem: How do your computer and a bank's server securely agree
on a secret code over the open, insecure internet, without anyone eavesdropping? They
do this through a process called the SSL Handshake, which perfectly blends asymmetric
and symmetric cryptography.

+ / The Greeting (Client & Server Hello): Your browser says to the server, "I want to
    connect securely. Here are the encryption rules I understand." The server
    replies, "Great, let's use this specific set of rules."
+ / Identity Verification (The Certificate): The server sends the browser its SSL
    Certificate. Think of this as the website's digital passport. It contains the
    website's identity, an expiration date, and crucially, the server's Public Key
    (Asymmetric Cryptography).
+ / The Key Exchange: Your browser checks the certificate to make sure the website is
    who it claims to be. If it is trusted, your browser uses the server's Public Key
    to encrypt a brand new, randomly generated Session Key. It sends this locked
    Session Key back to the server.
+ / The Lock Opens: Because the server holds the matching Private Key, it is the only
    entity in the world that can unlock what your browser just sent. It unlocks it
    and retrieves the Session Key.
+ / Secure Communication (Symmetric Takeover): Both your browser and the server now
    hold the exact same secret Session Key. They abandon the slow asymmetric keys and
    use this single shared key (Symmetric Cryptography) to encrypt all the actual
    data like your passwords or credit card numbers for the rest of your visit.

#img("assets/ssl_hs.webp")

== Types of SSL certificates

One certificate can apply to a single website or several websites, depending on the
type:

- / Single-domain: A single-domain SSL certificate applies to only one domain (a
    "domain" is the name of a website, like www.cloudflare.com).
- / Wildcard: Like a single-domain certificate, a wildcard SSL certificate applies to
    only one domain. However, it also includes that domain's subdomains. For example,
    a wildcard certificate could cover www.cloudflare.com, blog.cloudflare.com, and
    developers.cloudflare.com, while a single-domain certificate could only cover the
    first.
- / Multi-domain: As the name indicates, multi-domain SSL certificates can apply to
    multiple unrelated domains.

SSL certificates also come with different validation levels. A validation level is
like a background check, and the level changes depending on the thoroughness of the
check.

- / Domain Validation: This is the least-stringent level of validation, and the
    cheapest. All a business has to do is prove they control the domain.
- / Organization Validation: This is a more hands-on process: The CA directly
    contacts the person or business requesting the certificate. These certificates
    are more trustworthy for users.
- / Extended Validation: This requires a full background check of an organization
    before the SSL certificate can be issued.

#pagebreak()

= CYBERCRIME <B15>

In the field of cybersecurity, cybercrime refers to any illegal activity that either
targets or uses a computer, a computer network, or a networked device.

If cybersecurity is the shield, cybercrime is the weapon. Cybersecurity professionals
spend their time building defenses, monitoring networks, and responding to incidents
specifically to stop cybercriminals from successfully executing these crimes.

== Crimes that Target Computers

In these attacks, the criminal's goal is to damage, disable, or gain unauthorized
access to a system or network.

/ Malware Attacks: Infecting systems with malicious software, such as viruses or
  spyware, to corrupt data or steal information.
/ Ransomware: A specific, highly damaging type of malware that locks a victim's data
  using encryption. The cybercriminal then demands a ransom (usually in
  cryptocurrency) to unlock it.
/ Denial-of-Service (DoS) and DDoS Attacks: Overwhelming a website, server, or
  network with a flood of fake traffic so that legitimate users cannot access it.

== Crimes that Use Computers as a Tool

In these instances, the computer is used to facilitate a more "traditional" crime,
but on a massive, digital scale.

/ Phishing and Social Engineering: Sending fraudulent emails or messages that appear
  to be from a trusted source (like a bank) to trick victims into handing over
  passwords, credit card numbers, or other sensitive data.
/ Identity Theft and Fraud: Stealing personal information from databases to open
  credit accounts, steal funds, or commit tax fraud in someone else's name.
/ Cyberstalking and Harassment: Using electronic communications to repeatedly harass,
  threaten, or extort an individual or organization.
/ Corporate Espionage: Hacking into a rival company's network to steal intellectual
  property, trade secrets, or confidential business strategies.

== The Cybercrime Ecosystem

Cybercrime is no longer just a lone hacker in a basement it is a highly organized,
multi-billion-dollar global industry. Some cybercriminal groups operate like
corporations, complete with customer service departments for their ransomware victims
and "Cybercrime-as-a-Service" (CaaS) models, where they rent out their hacking tools
to less-technical criminals.

#pagebreak()

= TLS [TODO] <C7>

Transport Layer Security (TLS) is a protocol which enables a client to communicate
securely with a server across an untrusted network. Most notably it's used to secure
HTTP connections on the web: the resulting protocol is called HTTPS. TLS secures a
network connection in three ways:

/ Encryption: the data exchanged between client and server is encrypted while in
  transit, so it can't be read by any attackers.
/ Integrity: an attacker can't secretly modify data (without detection) while it is
  in transit between client and server.
/ Authentication: client and server are each able to prove to the other party that
  they are the entity they claim to be. On the web, servers usually authenticate
  themselves to clients, but clients don't usually authenticate themselves to
  servers.

In particular, HTTPS is the defense against a manipulator in the middle (MITM)
attack, in which the attacker inserts themselves between the user's browser and the
server they are connecting to, and can read and modify the traffic exchanged.
Browsers consider pages delivered over HTTPS as providing a secure context. Many
powerful web APIs are only available to code running in a secure context. All
websites should serve all their pages and subresources over HTTPS, and implement
server authentication.

== TLS handshake

When a client connects to a server using TLS, an initial handshake sets the security
parameters for the protocol:

/ Client and server agree on which version of TLS to use: The current version of TLS
  is 1.3 and this is the most widely-used version. TLS 1.2 is still used by some
  websites, and TLS 1.1 and 1.0 should no longer be used.
/ Client and server agree on the cipher suite that they will use: this defines the
  algorithms that they will use for key agreement, authentication, encryption, and
  message authentication.
/ Optionally, client and server authenticate each other: Client authentication, in
  which the client proves who they are to the server, is rare on the web outside some
  specialized applications. However, server authentication, in which the server
  proves who they are to the client, is a fundamental part of web security.
/ Client and server agree on a secret key: that they will use to encrypt and decrypt
  messages.

After the handshake, client and server use the secret key to encrypt and decrypt any
messages, including HTTP headers as well as bodies.
