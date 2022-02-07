FROM kalilinux/kali-rolling


RUN apt-get update -y \
	&& apt-get upgrade -y

RUN apt-get install -y vim curl git wget iputils-ping net-tools masscan nmap wordlists seclists exploitdb ffuf \
	gobuster hydra vim john curl host traceroute wfuzz hashcat hash-identifier binwalk git zip jq bsdmainutils xxd \
	smbmap openvpn steghide whois sqlmap foremost exiv2 exifprobe enum4linux telnet metasploit-framework lynx wpscan \
	virtualenv python2 golang netcat-traditional man-db ftp php default-mysql-client whatweb

WORKDIR /root

RUN sed -i 's/PROMPT_ALTERNATIVE=twoline/PROMPT_ALTERNATIVE=oneline/g' ~/.bashrc

RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
ENV PATH "$PATH:/root/go/bin"

RUN mkdir /opt/linpeas
RUN curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -o /opt/linpeas/linpeas.sh

CMD ["bash"]
