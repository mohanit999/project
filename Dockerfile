#FROM directive select base image for tomcat
FROM tomcat: alpine




#COPY Directive 
COPY . /usr/local/tomcat/webapps
