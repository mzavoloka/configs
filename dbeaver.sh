pacman -Ss dbeaver
#Enable TLSv1, TLSv1.1, in java by editng  /etc/java-openjdk/security/java.security file:
#remove TLSv1, TLSv1.1, from the file:
jdk.tls.disabledAlgorithms=SSLv3, TLSv1, TLSv1.1, RC4, DES, MD5withRSA, \
    DH keySize < 1024, EC keySize < 224, 3DES_EDE_CBC, anon, NULL
