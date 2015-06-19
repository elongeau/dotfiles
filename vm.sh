# Variables pour la gestion des VMs
VBOX_HOME=/cygdrive/c/Program\ Files/Oracle/VirtualBox
VM_UBUNTU="ubuntu LVM"

alias VBoxHeadless='$VBOX_HOME/VBoxHeadless.exe'
alias VBoxManage='$VBOX_HOME/VBoxManage.exe'

# cette fonction permet de démarrer la VM en arrière plan et d'afficher une progression dans l'attente de son démarrage
startVM() {
        VBoxHeadless -s "$VM_UBUNTU" >> /dev/null &
        echo "Démarrage en cours de $VM_UBUNTU"
        runningvm="$(VBoxManage list runningvms | cut -d'"' -f2)"
        while [ -z "$runningvm" ]
        do
                runningvm="$(VBoxManage list runningvms | cut -d'"' -f2)"
                echo -n "."
                sleep 1
        done
        echo
        echo "VM $VM_UBUNTU demarre"
}

alias vm-start='startVM'
alias vm-stop='VBoxManage controlvm "$VM_UBUNTU" poweroff'
