## This installation process involves the following applications :
<li>Juma</li>
<li>Juma API</li>
<li>Cube Visualizer</li>
<li>OLAP Browser</li>
<li>JSON QB API</li>
<li>Virtuoso</li>
<li>Moodle</li>
<li>RDF Conversion API</li>
<li>Data Visualization App</li>

### Server/System Information:
<li>Linode - Ubuntu 16.04LTS</li>
<li>Ram: 4GB</li>
<li>Intel(R) Xeon(R) CPU E5-2680 v3 @ 2.50GH</li>
<li>Internet Access</li>

### Required Software:
<li>Docker - v18.03</li>
<li>Docker compose - v3.4</li>

### Installation Steps:
<li>Clone the GitHub repository to a folder called “losd-applications-docker-compose”
https://github.com/derilinx/losd-applications-docker-compose</li>
<li>git submodule init</li>
<li>git clone --recurse-submodules 
    This will clone all submodules to the respective folders. All submodules are available in below GitHub Repo:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Juma Editor and API: git@github.com:derilinx/juma-losd-docker_sp.git<br/>  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Cube Visualizer: https://github.com/LOSD-Data/docker-cube-visualizer <br/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - OLAP Browser: https://github.com/LOSD-Data/docker-olap-browser.git  <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - JSON AB API: https://github.com/LOSD-Data/docker-json-qb-api.git  <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Virtuoso: Used as a docker image - tenforce/virtuoso:1.3.1-virtuoso7.2.2  <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Moodle: git@github.com:derilinx/docker-moodle.git  <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - RDF Conversion API: git@github.com:derilinx/docker-rdfapi.git  <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Data Visualization App: git@github.com:derilinx/docker-dataviz.git<br/></li><br/>


<li>Once all submodule is cloned to respective folder create a file called “.env”. This file contains all necessary environment variables, username and password required for the each of the applications. Parameters used in environment variables are given in below sections. </li>
<li>Create a file called “shiro-users.properties”  in the path “juma-losd-docker_sp/Juma-losd-docker_sp/juma-uplift-master/src/main/resources”. This file is used for creating a username and password for Juma Editor. Further details are give in below sections. </li>
<li>Go to the folder “losd-applications-docker-compose”</li>
<li>Create and folders to hold the data (As Volume in docker-compose.yml file) of moodle, virtuoso and juma.</li><br/><br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Volume for Moodle:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "./moodle_data/mysql:/var/lib/mysql"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "./moodle_data/moodledata:/var/moodledata"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "./moodle_data/config.php:/var/www/html/moodle/config.php"<br/><br/>
          
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Volume for Virtuoso:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "./data/virtuoso:/data"<br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Volume for Juma:<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "./mysqldata/mysql:/var/lib/mysql"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "./mysqldata/mysql-files:/var/lib/mysql-files"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "./mysqldata/mysql-keyring:/var/liv/mysql-keyring"<br/>


<li>Type the command “make build”</li>
<li>Then type “make”. This should bring all the applications up and running.</li></br></br>

### Instructions for creating .env file:
<li>touch .env in the folder "losd-applications-docker-compose"</li>
<li>Edit .env file content</li><br/><br/>

#### Sample .env file and its parameters:
```env
HOST=https://losd-dck.staging.derilinx.com
IMAGE_TAG=staging
HOST_MOD=losd-dck.staging.derilinx.com
HOST_NM=losd-dck.staging.derilinx.com
HOST_VIR=virtuoso.losd-dck.staging.derilinx.com
HOST_OLAP=olap.losd-dck.staging.derilinx.com
HOST_CUBE=cubeviz.losd-dck.staging.derilinx.com
HOST_JSAPI=json-qb-api.losd-dck.staging.derilinx.com
HOST_JUMA=juma.losd-dck.staging.derilinx.com
HOST_DTVIZ=dataviz.losd-dck.staging.derilinx.com
HOST_RDFAPI=rdfapi.losd-dck.staging.derilinx.com
SPARQL_USERNAME=<your username>
SPARQL_PWD=<your password>
RDFAPI_USERNAME=<your username>
RDFAPI_PWD=<your password>
SITE_SCHEME=https://
MYSQL_PASSWORD_MOODLE=<your password>
MOODLE_PASSWORD=<your password>
SSH_PASSWORD_MOODLE=<your password>
```

### Instrunctions for creating shiro-users.properties file:
<li> Go to folder "juma-losd-docker_sp/Juma-losd-docker_sp/juma-uplift-master/src/main/resources"</li>
<li>Command: touch shiro-users.properties</li>
<li>Edit shiro-users.properties file content</li><br/><br/>

#### Sample shiro-users.properties file and its parameters:

```properties
user.<your username 1> = <your password>
user.<your username 2> = <your password>
user.<your username 3> = <your password>
user.<your username 4> = <your password>
user.<your username 5> = <your password>
```
