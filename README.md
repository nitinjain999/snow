Prerequisites : 
1) Minikube installed & working. 
2) Operator in using MacOs without VPN 
3) Terraform & Helm installed 
(1\#brew install kubernetes-helm) 
(2\# brew install terraform)

Steps to be performed on Mac Terminal: 
1) \# minikube tunnel 
2) \# git clone https://github.com/nitinjain999/snow.git 
3) \# cd snow/infra/terraform 
4) \# terraform init 
5) \# terraform apply -auto-approve
6)  On Browser open http://127.0.0.1
7)  Insert Data 
\# curl -H "Content-Type:application/x-www-form-urlencoded" -X POST http://127.0.0.1:80/storedata -d id=1 -d name=Nitin

8)  Fetch Data 
\# curl 127.0.0.1:80/getdata/1 
\# or open on browser. "http://127.0.0.1:80/getdata/1"

