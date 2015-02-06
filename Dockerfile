FROM ubuntu:14.04                                                                                                                                  
ENV DEBIAN_FRONTEND noninteractive                                                                                                
RUN \                                                                                                                             
    apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A && \                                                          
    echo "deb http://repo.percona.com/apt `lsb_release -cs` main" > /etc/apt/sources.list.d/percona.list && \                         
    apt-get update && \                                                                                                               
    apt-get install -y percona-xtradb-cluster-56                                                                                      

COPY my.cnf /etc/mysql/my.cnf                                                                                                     
COPY mysqld.sh /mysqld.sh

RUN chmod 555 /mysqld.sh

# Define mountable directories.                                                                                                   
VOLUME ["/var/lib/mysql"]                                                                                                         

# Define default command.                                                                                                         
ENTRYPOINT ["/mysqld.sh"]                                                                                                             
