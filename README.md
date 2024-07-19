# BSCA
The Basically Shenanigans Certificate Authority (“BSCA”) is a general purpose CA designed to provide x509 services within lab projects.

This project is not code.  This project is a collection of configurations and procedures to implement the stunning and spectacular work done by [The OpenSSL Project](https://www.openssl.org/).

The project includes two – very permissive – certificate and signing request `templates`: (**i**) a TLS Server, suitable for pretty much any TLS host and (**ii**) a Generic client certificate, suitable for a wide variety of user applications. The `help` section also includes guides to (**i**) Setup the CA, (**ii**) Generate Server/Client CSRs, (**iii**) Sign a CSR.

# Disclaimer

**No warranties are given**

As the name suggests, BSCA is not suitable for production use.  It is an excellent option to spin up quickly for a project within a lab, however it is not at all suitable to protect communications of any value in production.  For example, BSCA does not include any mechanism by which to distribute a revocation list, therefore every signed certificate is valid until its expiration date. If you don’t know exactly what this means, you should not use BSCA outside of a closed and trusted network.

# License
BSCA is licensed with Creative Commons Attribution-NonCommercial-ShareAlike.

In summary, Elevated Posture Incorporated (“The licensor”) grants you freedom to share, copy, and redistribute the material in any medium or format. The licensor cannot revoke these freedoms as long as you follow the license terms. Under the following terms: (**i**) **Attribution** - You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use. (**ii**) **NonCommercial** - You may not use the material for commercial purposes. (**iii**) **NoDerivatives** - If you remix, transform, or build upon the material, you may not distribute the modified material without approval. (**iv**) **No additional restrictions** — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

The full license can be obtained from Creative Commons here: https://creativecommons.org/licenses/by-nc-nd/4.0.

# Quick Start

- Build a Ubuntu Server

- Download the BSCA Installer Script and chmod it
```
curl -o /tmp/install-bsca.sh https://raw.githubusercontent.com/elevatedposture/bsca/main/install-bsca.sh; chmod 0700 /tmp/install-bsca.sh;
```

- Kick off the install
```
sudo /tmp/install-bsca.sh
```

- Follow the instructions in `/opt/bsca/help`
