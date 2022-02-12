FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install -y \
	binwalk \
	bsdmainutils \
	curl \
	default-mysql-client \
	enum4linux \
	exifprobe \
	exiv2 \
	exploitdb \
	ffuf \
	foremost \
	ftp \
	git \
	gobuster \
	golang \
	hash-identifier \
	hashcat \
	host \
	hydra \
	iputils-ping \
	john \
	jq \
	lynx \
	man-db \
	masscan \
	metasploit-framework \
	net-tools \
	netcat-traditional \
	nmap \
	openvpn \
	onesixtyone \
	perl-tk \
	php \
	python2 \
	seclists \
	smbmap \
	snmp \
	snmpcheck \
	sqlmap \
	steghide \
	telnet \
	traceroute \
	vim \
	virtualenv \
	wfuzz \
	wget \
	whatweb \
	whois \
	wordlists \
	wpscan \
	xxd \
	zip

WORKDIR /root

RUN sed -i 's/PROMPT_ALTERNATIVE=twoline/PROMPT_ALTERNATIVE=oneline/g' ~/.bashrc

RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
ENV PATH "$PATH:/root/go/bin"

RUN mkdir /opt/linpeas
RUN curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -o /opt/linpeas/linpeas.sh

CMD ["bash"]
