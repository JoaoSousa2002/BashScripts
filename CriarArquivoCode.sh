#!/bin/bash 

CaminhoPadrao="/home/joao/Desktop/'Estudos faculdade 02.2026'"
cd $CaminhoPadrao

# Cria e retorna pasta chamada ListaExercicioXX/ ou retorna a pasta Estudos/
function CriarPastaOuNao {
    if echo $1 | grep -q Exercicio ; then
        declare -i QuantidadePastas=$(ls | grep -c Exercicio)  #Quantidade de pastas ja existentes com a palavra Exercicio
        if [ $QuantidadePastas -lt 10 ] ;then
            QuantidadePastas+=1
            mkdir ListaExercicios0$QuantidadePastas
            echo ListaExercicios0$QuantidadePastas/
        else
            mkdir ListaExercicios$QuantidadePastas
            echo ListaExercicios$QuantidadePastas/
        fi 
    else
        #Verifica se a pasta não existe, se não existir, cria a pasta Estudos
        if [ ! -d "Estudos" ]; then
            mkdir Estudos
        fi
        echo Estudos/
    fi
}



echo "================================================================================"
echo "@              *                          *                     *              @"
echo "@                     CRIAR ARQUIVO E ABRIR NO VSCODE                          @"
echo "@       *                *          *                     *                    @"
echo "================================================================================"

echo ""
read -p "Digite o nome do arquivo para criar (incluindo a extensão):  " Resposta


# Verificação e criação para arquivo Python
# Não foi criado em função pois em bash a função não cria arquivo permanente com touch
if echo $Resposta | grep -q ".py"; then
    cd Python/
    CaminhoPasta=$(CriarPastaOuNao $Resposta)
    cd $CaminhoPasta
    touch $Resposta
    code -n ../$CaminhoPasta -a $Resposta

# Verificação e criação para arquivo JavaScript
elif echo $Resposta | grep -q ".js" ;then
    cd 'WEB I'/'Estudos JS'/Javascript/
    CaminhoPasta=$(CriarPastaOuNao $Resposta)
    cd $CaminhoPasta
    touch $CaminhoPasta/$Resposta
    code -n ../$CaminhoPasta -a $Resposta

else
    echo ""
    echo " XXX Extensão não reconhecida"
    echo ""
    read -p "Pressione Enter para fechar..."
fi