alias c="clear"
alias s="ssh"
alias g="git"
alias l="exa --icons"
alias ls="exa --icons"
alias msf="msfconsole"
alias timeshift="sudo timeshift"
alias clear_cache='yay -Scc;yay -Rns $(yay -Qtdq)'
alias clear_packages="yay -Qtdq | yay -Rs -"
alias idea="GTK_IM_MODULE=fcitx /opt/intellij-idea-ultimate-edition/bin/idea.sh .  >/dev/null 2>&1 &"
alias vi="/usr/bin/nvim"
alias nvmstart="source /usr/share/nvm/init-nvm.sh"
alias java8="/usr/lib/jvm/java-8-openjdk/bin/java"
alias javac8="/usr/lib/jvm/java-8-openjdk/bin/javac"
alias py="python"
alias ipy="ipython"
alias checklog="journalctl -xefu"

# alias k="minikube kubectl --"
alias k="kubectl"
alias e1="ETCDCTL_API=3 etcdctl --endpoints https://192.168.59.126:2379 --cert=/home/ch4ser/Desktop/etcdctl/node1/apiserver-etcd-client.crt --key=/home/ch4ser/Desktop/etcdctl/node1/apiserver-etcd-client.key --cacert=/home/ch4ser/Desktop/etcdctl/node1/ca.crt"
alias e3="ETCDCTL_API=3 etcdctl --endpoints https://192.168.59.128:2379 --cert=/home/ch4ser/Desktop/etcdctl/node3/apiserver-etcd-client.crt --key=/home/ch4ser/Desktop/etcdctl/node3/apiserver-etcd-client.key --cacert=/home/ch4ser/Desktop/etcdctl/node3/ca.crt"
alias faas="faas-cli"
alias cat="bat --style=plain --paging=never"
alias top="htop"
alias t="todo.sh"
alias cp="rsync -az"
alias d="docker"
alias dc="docker-compose"
alias docker_rm_all="docker ps -aq | xargs docker stop | xargs docker rm"
