# KubPi : déploiement d'un cluster k8s sur raspberry


Création du cluster

```
ansible-playbook -i hosts.yml -u pi -k -b install-kub.yml
```

Reset all

```
ansible-playbook -i hosts.yml -u pi -k -b reset-all.yml
```
