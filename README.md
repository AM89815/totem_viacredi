Isso é um totem de satisfação feito pra viacredi, também é meu primeiro projeto flutter.. e também meu primeiro repositório. Muitas primeiras vezes aqui.

RESUMO:
  As páginas de 1-5 tem um timer de inatividade que levam o usuário até a página 6,
a página 6 é onde todas as informações do usuário são enviadas ao firebase, ela exibe
uma mensagem de obrigado e direciona o usuário de volta a página 1 depois de um timer.

PÁGINAS 1 E 2:
  Nas páginas 1 e 2 não é necessário apertar o botão de enviar para enviar suas informações,
pois isso já acontece depois que o timer de inatividade te levar pra página 6.

PÁGINA 3:
  A página 3 não coleta nenhum dado, apenas os repassa adiante, ela exibe ao usuário a opção de
enviar seu cpf, caso sim o usuário é direcionado à página 4, caso não o usuário é direcionado a
página 6, essa página também tem um timer de inatividade que te manda pra página 6.

PÁGINAS 4 E 5:
  As páginas 4 e 5 contém informações mais sensíveis: um cpf que precisa ser validado por uma equação
e um comentário atrelado ao cpf, o timer de inatividade só enviará o cpf caso ele seja válido, o usúario
não precisa enviar um comentário caso tenha inserido seu cpf, mas é teoricamente impossível enviar um
comentário sem ter inserido o cpf.

PÁGINA 6:
  Como dito no resumo, a página 6 é onde todas as informações do usuário são enviadas ao firebase,
ela exibe uma mensagem de obrigado e direciona o usuário de volta a página 1 depois de um timer.