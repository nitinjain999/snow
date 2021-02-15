# Prerequisites :
​
1) Minikube installed & working.
​
2) Document Assumption : Operator in using MacOs without VPN
​
3) Terraform & Helm installed
​
> **ProTip: (1# brew install helm)**
​
> **ProTip:(2# brew install terraform)**
​
# Steps to be performed on Mac Terminal:
​
1)  minikube tunnel (in a seperate terminal)
​
2)  git clone https://github.com/nitinjain999/snow.git
​
3)  cd snow/infra/terraform
​
4) terraform init (config path is choosen to config_path = "~/.kube/config", if this is different from default please change it)
​
5)  terraform apply -auto-approve
​
# Expected Output :
​
➜ kubectl get pods -n snow
​
|   NAME             |READY                      |STATUS                       |             RESTARTS                |     AGE                        | 
|----------------|-------------------------------|-----------------------------|-----------------------------|-----------------------------|
|myapp-7cf759f49-rcd9h|1/1           |Running            |            0                 |                   11m          | 
|mysql-0         |1/1            |Running            |             0                |          11m                   | 
​
​
6) On Browser open http://127.0.0.1 ( In terminal "minikube tunnel" , it will prompt for user password )
​
7) Insert Data
 
		 curl -H "Content-Type: application/x-www-form-urlencoded" -X POST  http://127.0.0.1:80/storedata -d id=1 -d name=Nitin
​
8) Fetch Data
​
		 curl  127.0.0.1:80/getdata/1
		or open on browser  127.0.0.1:80/getdata/1
