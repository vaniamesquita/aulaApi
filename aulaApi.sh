#!/bin/bash

#Listar os usuários
function listarUsuarios (){
        curl http://localhost:3000/profile
}

#Listar os Posts
function listarPosts (){
        curl http://localhost:3000/posts
}

#Listar Comentários
function listarComentarios (){
        curl http://localhost:3000/comments
}

#Excluir Usuários/Posts/Comentários pelo id
function excluirUsuario () {
        echo "Digite o id do usuário que deseja excluir:"
        read id;
	
	curl -X DELETE  http://localhost:3000/profile/$id
	curl -X DELETE  http://localhost:3000/posts/$id
	curl -X DELETE  http://localhost:3000/comments/$id
 }


#Criar usuários (3 por vez)
function criarUsuario () {
        echo "Para criar um usuário, digite primeiro o id:"
        read id;

        echo "Agora informe o nome do usuário"
        read user_name;

        curl -X POST -d "id=$id&profile=$user_name" http://localhost:3000/profile/
}


#Criar 2 posts para usuários diferentes
function criarPosts () {
	echo "Para criar um post, informe primeiro a id do usuário que deseja vincular:"
	read id;
	echo "Agora informe o titulo do seu post:"
	read titulo;
	echo "Para finalizar, digite o seu nome:"
	read user_name;
	curl -X POST -d "id=$id&title=$titulo&author=$user_name" http://localhost:3000/posts

}



x="teste"
menu ()
{
while true $x != "teste"
do
clear

echo "================================================================================================"
echo "Script da aula de API"
echo ""
echo "Crie um script shell que, no little-school-server:

1. Crie 3 usuários
2. Dois posts para usuários diferentes
3. 5 comentários para cada post, com pelo menos 3 usuários dentro da 'conversa'
4. Altere o nome de um dos usuários '('lembrando um post se baseia no nome de um usuário')'
5. Delete um usuário e todos seus posts e comentários;
"
echo "================================================================================================"
echo ""
echo "1)Criar um usuário"
echo ""
echo "2)Criar post"
echo ""
echo "3)Criar comentários"
echo ""
echo "4)Alterar nome usuário" 
echo""
echo "5)Excluir/deletar usuário "
echo""
echo "6)Listar usuários"
echo ""
echo "7)Listar Posts"
echo ""
echo "8)Listar Comentários"
echo ""
echo "9)Finalizar o script"
echo ""
echo "================================================================================================"

echo "Digite a opção desejada:"
read x
echo "Opção informada: ($x)"
echo "================================================================================================"

case "$x" in



1)
criarUsuario
echo ""
criarUsuario
echo ""
criarUsuario
echo ""

echo "voltando ao menu inicial..."
echo ""

sleep 5

echo "================================================================================================"
;;

2)
criarPosts
echo ""
criarPosts
echo ""

echo "usuários criados com sucesso"
echo ""
echo "voltando ao menu inicial"
sleep 5
echo '================================================================================================'
;;

3)
echo '================================================================================================'
;;

4)
echo '================================================================================================'
;;

5)
excluirUsuario;
echo ""
echo "Usuário do id $id_excluir excluido com sucesso."
echo ""
echo "voltando ao menu inicial..."
sleep 5
echo '================================================================================================'
;;

6)
listarUsuarios;
echo ""
echo "voltando ao menu inicial..."
echo ""
sleep 5
echo '================================================================================================'
;;

7)
listarPosts;
echo ""
echo "voltando ao menu inicial..."
echo ""
sleep 5
echo '================================================================================================'
;;

8)
listarComentarios;
echo ""
echo "voltando ao menu inicial..."
echo ""
sleep 5
echo '================================================================================================'
;;


9)
echo "saindo..."
sleep 3
clear;
exit;
echo "================================================"
;;

*)
        echo 'Opção inválida!'
esac
done

}
menu

