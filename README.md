# ocpdbtest
Ansible playbook and roles that use a container to run connectivity tests to postgres and s3


This project is designed to achieve the following:

- create project in openshift
- Create PVC, Service, Route
- Create Deployment config that deploys the test container with replicas set to 0
- Run through all nodes that are not master or infra nodes, bringing up the container on each node 1 by 1
- Post a get to the route endpoint each time the pod is brought up on a different node, reading the results.html file for error messages


Required parameters are as follows:
- masters group in inventory file
- Each node must have openshift_node_group_name defined
- testproject: the name of the project to be created
- localregistry: full url for container to be deployed (ex. localregistry=quay.io/grakover/ocpdbtest:latest)
- storageclass: storage class to be used for PVC (ex. glusterfs-storage)
- ocpappsdomain: apps subdomain for the openshift cluster (ex. apps.openshift.ocp.rhevdemo.com)
- S3_HOST: The S3 endpoint (ex. "10.35.76.232:8000")
- ACCESS_KEY: s3 access key 
- SECRET_KEY: s3 secret key
- SSL: Sets if to use ssl or not for s3 command.  Case sensitive, must be "TRUE" or "FALSE"
- PSQL_HOST: Postgres database endpoint (ex. "10.35.76.251")
- PSQL_USER: Postgres database user. Should be a user that does not require to use a password (ex. "postgres")



######Container Inforamation######

The container performs the following:
- Uses s3mcd cli to get a bucket list from an s3 endpoint
- Uses the psql cli to get the database list from a postgres instance
- Creates a file under /var/www/html/ called results.html and prints the responses into the file


The container can be found at: quay.io/grakover/ocpdbtest:latest
 - contains httpd
 - s3cmd cli
 - psql cli
 - runs a script under /home/rocko/ called runChecks.sh before bringing up the httpd

 



