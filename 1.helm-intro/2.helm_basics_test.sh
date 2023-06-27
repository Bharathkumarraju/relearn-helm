IAM-Access - Database Authentication

➜  relearn-helm git:(main) ✗ helm search repo bkstable/mysql
NAME              	CHART VERSION	APP VERSION	DESCRIPTION
bkstable/mysql    	1.6.9        	5.7.30     	DEPRECATED - Fast, reliable, scalable, and easy...
bkstable/mysqldump	2.6.2        	2.4.1      	DEPRECATED! - A Helm chart to help backup MySQL...
➜  relearn-helm git:(main) ✗

➜  relearn-helm git:(main) ✗ helm install rajus-mysql bkstable/mysql
WARNING: This chart is deprecated
NAME: rajus-mysql
LAST DEPLOYED: Thu Jun 22 15:43:24 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
MySQL can be accessed via port 3306 on the following DNS name from within your cluster:
rajus-mysql.default.svc.cluster.local

To get your root password run:

    MYSQL_ROOT_PASSWORD=$(kubectl get secret --namespace default rajus-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo)

To connect to your database:

1. Run an Ubuntu pod that you can use as a client:

    kubectl run -i --tty ubuntu --image=ubuntu:16.04 --restart=Never -- bash -il

2. Install the mysql client:

    $ apt-get update && apt-get install mysql-client -y

3. Connect using the mysql cli, then provide your password:
    $ mysql -h rajus-mysql -p

To connect to your database directly from outside the K8s cluster:
    MYSQL_HOST=127.0.0.1
    MYSQL_PORT=3306

    # Execute the following command to route the connection:
    kubectl port-forward svc/rajus-mysql 3306

    mysql -h ${MYSQL_HOST} -P${MYSQL_PORT} -u root -p${MYSQL_ROOT_PASSWORD}
➜  relearn-helm git:(main) ✗


➜  relearn-helm git:(main) ✗ helm list
NAME       	NAMESPACE	REVISION	UPDATED                             	STATUS  	CHART      	APP VERSION
rajus-mysql	default  	1       	2023-06-22 15:43:24.417086 +0800 +08	deployed	mysql-1.6.9	5.7.30
➜  relearn-helm git:(main) ✗




➜  relearn-helm git:(main) ✗ helm show chart bkstable/mysql
apiVersion: v1
appVersion: 5.7.30
deprecated: true
description: DEPRECATED - Fast, reliable, scalable, and easy to use open-source relational
  database system.
home: https://www.mysql.com/
icon: https://www.mysql.com/common/logos/logo-mysql-170x115.png
keywords:
- mysql
- database
- sql
name: mysql
sources:
- https://github.com/kubernetes/charts
- https://github.com/docker-library/mysql
version: 1.6.9

➜  relearn-helm git:(main) ✗ ➜








