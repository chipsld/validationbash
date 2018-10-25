#!/bin/bash

#vagrant= vagrant -v
#virtualbox= virtualbox COMMAND -h



RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[0;34m'
NC='\033[0m'


box=ubuntu/xenial64

error () {
     echo -e "${RED}Attention ce champ n'est pas correctement remplis !"
}



#if [ [ $vagrant == true ] && [ $virtualbox == true ] ]
 #       then
        echo " "
        echo -e "${BLUE}-------------${NC}"
        echo -e "${BLUE}VirtualBox et Vagrant sont déjà installés sur cet ordinateur${NC}"
        echo -e "${BLUE}Initialisation du VagrantFile...${NC}"
        echo -e "${BLUE}-------------${NC}"
        echo " "

        # find=find Vagrantfile
        
        # echo $find

        # if [ $find=="Vagrantfile" ]
        #     then
        #         echo " "
        #         echo " "
        #         echo -e "${RED}*************${NC}"
        #         echo -e "${RED}Un fichier d'initialisation existe déjà dans se répertoire, Veuillez le supprimer avant d'en créer un autre.${NC}"
        #         echo -e "${RED}*************${NC} "


        #         exit
        # fi



        vagrant init

        
        echo " "
        
        echo -e "${GREEN}-------------${NC}"
        echo -e "${GREEN}Veuillez sélectionnez le nom du dossier local de synchronisation: ${NC}"
        echo -e "${GREEN}-------------${NC}"

        read localdir

        if [ localdir == "" ]
        then
            error
        fi


        echo " "
        echo -e "${GREEN}-------------${NC}"
        echo -e "${GREEN}Veuillez sélectionnez le nom du dossier distant de synchronisation: ${NC}"
        echo -e "${GREEN}-------------${NC}"
        read distdir

        
        mkdir localdir
        sed -i '15i config.vm.box =''"'$box'"' Vagrantfile 
        sed -i '46i config.vm.synced_folder "../'$localdir'", "/'$distdir'"'  Vagrantfile 
        sed -i '35i config.vm.network "private_network", ip: "192.168.33.10"'  Vagrantfile 


    


        vagrant up 

        echo -e "${GREEN}Voulez vous affichez la liste des machines vagrant disponible sur cet ordinateur: ${NC}"
        echo -e "${BLUE}Oui${NC}"
        echo -e "${BLUE}Non ${NC}"

        read rep

        if [ $rep == "Oui" ]
            then

        echo " "
        echo " "
        echo " "

        echo -e "${BLUE}Voici la liste des Vagrant sur cet ordinateur : ${NC}"
        echo " "
        vagrant global-status
        echo " "

        fi
        
        if [ $rep == "Non" ]
            then
                echo -e "${BLUE}FIN DU SCRIPT${NC}"
                exit
        fi



  #  fi


    #if [ [ $vagrant == false ] || [ $virtualbox == false ] ]
     #   then

      #  echo "-------------" 
       # echo "VirtualBox ou Vagrant n'est pas installé sur cet ordinateur."
        #echo "-------------"

    #fi




