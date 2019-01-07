# springoauth2
Spring cloud OAuth2 with JWT MySQL - Authorization Server - Resource Server

Simple project on how to setup Spring Cloud OAuth2 authorization and Resources server with JWT tokens using Spring Boot 2, JPA, Hibernate and MySQL.

First we must generate a KeyStore file. To do that execute the following command:

keytool -genkeypair -alias jwt -keyalg RSA -keypass password -keystore jwt.jks -storepass password
(if you're under Windows go your Java install dir and there you'll find a jar named keytool)

The command will generate a file called jwt.jks which contains the Public and Private keys.

It is recommended to migrate to PKCS12. To do that execute the following command:

keytool -importkeystore -srckeystore jwt.jks -destkeystore jwt.jks -deststoretype pkcs12
Now let's export the public key:

keytool -list -rfc --keystore jwt.jks | openssl x509 -inform pem -pubkey

Copy the jwt.jks file to the Resources folder.

Copy from (including) -----BEGIN PUBLIC KEY----- to (including) -----END PUBLIC KEY----- and save it in a file. You'll need this later in your resource servers application.yml


Step Process :
1. Clone Repository 
git clone https://github.com/ahmedkabiru/springoauth2.git

2: Start Up Spring project 
mvn clean spring-boot:run

3: Launch PostMan to generate 

