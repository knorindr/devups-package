FROM centos:7
MAINTAINER James Wade <jpswade@gmail.com>

ADD http://pkg.jenkins-ci.org/redhat/jenkins.repo /etc/yum.repos.d/jenkins.repo
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key && \
    yum install -y deltarpm && yum upgrade -y && yum update -y && yum install -y initscripts php-intl phpunit java jenkins ant wget php-pear git --nogpgcheck
RUN pear install PHP_CodeSniffer && \
    wget https://phar.phpunit.de/phploc.phar && chmod +x phploc.phar && mv phploc.phar /usr/local/bin/phploc && \
    wget https://github.com/pdepend/pdepend/releases/download/2.8.0/pdepend.phar --no-check-certificate && chmod +x pdepend.phar && mv pdepend.phar /usr/local/bin/pdepend && \
    wget https://github.com/phpmd/phpmd/releases/download/2.8.2/phpmd.phar --no-check-certificate && chmod +x phpmd.phar && mv phpmd.phar /usr/local/bin/phpmd && \
    wget https://phar.phpunit.de/phpcpd.phar && chmod +x phpcpd.phar && mv phpcpd.phar /usr/local/bin/phpcpd && \
    wget http://phpdox.de/releases/phpdox.phar && chmod +x phpdox.phar && mv phpdox.phar /usr/bin/phpdox

ADD setup.sh /setup.sh
ADD example.xml /example.xml
RUN sh /setup.sh

EXPOSE 8080

CMD service jenkins start && tail -f /var/log/jenkins/jenkins.log
