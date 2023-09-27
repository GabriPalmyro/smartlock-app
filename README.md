# Fechadura Inteligente para Salas do IF

## Descrição

Este projeto visa criar uma fechadura inteligente para substituir o uso de chaves nas salas do Instituto Federal (IF). A fechadura pode ser controlada remotamente por um sistema de acesso ou por uma senha inserida diretamente na tela da fechadura. Isso permite um controle rigoroso do acesso às salas, especialmente para os professores, que terão seus horários delimitados para entrada.

Além disso, o projeto integra um aplicativo com a API do Google Maps para garantir que os professores só possam abrir as salas quando estiverem dentro da área do IF, aumentando a segurança e o controle de acesso. O aplicativo também permite que os professores visualizem as salas disponíveis e solicitem acesso de forma rápida e fácil.

## Funcionalidades Principais

- Abertura remota da fechadura.
- Restrição de horários de acesso para professores.
- Integração com o Google Maps para controle de localização.
- Aplicativo para visualização das salas disponíveis e solicitação de acesso.

## Componentes e Construção

A construção da fechadura inteligente requer atenção aos seguintes componentes:

- ESP8266 para controle e comunicação.
- Teclado matricial para inserção de senhas.
- Motor de passo para acionamento da fechadura.
- Caixa impressa em 3D para acomodar os componentes.

É fundamental realizar testes detalhados em todos os componentes para garantir o funcionamento adequado.

## Servidor e Monitoramento

Para atender aos requisitos do projeto, é essencial utilizar um servidor para monitorar o acesso às salas e manter um registro de todos os professores que entraram, bem como das salas que estão abertas ou fechadas. O sistema deve identificar a localização dos professores e permitir o acesso apenas quando estiverem dentro da área do IF.

## Recomendações Adicionais

- Utilização de tecnologia RFID para controle de acesso autorizado.
- Implementação de um sistema de alarme em caso de tentativa de abertura forçada.
- Desenvolvimento de um aplicativo que permita aos professores solicitar acesso com antecedência, eliminando a necessidade de chaves físicas.
- Integração da fechadura com um sistema de gestão de horários para acesso agendado.
- Adição de um sistema de notificação para alertar os professores quando as salas estiverem disponíveis.

## Autor

- [Gabriel Palmyro Martins]
- [Carlos Henrique Zilioli Braga]

## Licença

# Licença MIT

Copyright (c) 2023 Gabriel Palmyro Martins

A permissão é concedida, gratuitamente, a qualquer pessoa que obtenha uma cópia deste software e dos arquivos de documentação associados (o "Software"), para lidar no Software sem restrições, incluindo, sem limitação, os direitos de uso, cópia, modificação, fusão, publicação, distribuição, sublicenciamento e/ou venda de cópias do Software, e de permitir que pessoas a quem o Software é fornecido o façam, sujeito às seguintes condições:

O aviso de direitos autorais acima e este aviso de permissão devem ser incluídos em todas as cópias ou partes substanciais do Software.

O SOFTWARE É FORNECIDO "COMO ESTÁ", SEM GARANTIA DE QUALQUER TIPO, EXPRESSA OU IMPLÍCITA, INCLUINDO, MAS NÃO SE LIMITANDO ÀS GARANTIAS DE COMERCIALIZAÇÃO, APTIDÃO PARA UM PROPÓSITO ESPECÍFICO E NÃO INFRAÇÃO. EM NENHUM CASO OS AUTORES OU TITULARES DE DIREITOS AUTORAIS SERÃO RESPONSÁVEIS POR QUALQUER REIVINDICAÇÃO, DANOS OU OUTRA RESPONSABILIDADE, SEJA EM AÇÃO DE CONTRATO, DELITO OU DE OUTRA FORMA, DECORRENTE, FORA OU EM CONEXÃO COM O SOFTWARE OU O USO OU OUTRAS NEGOCIAÇÕES NO PROGRAMAS.

2023 Gabriel Palmyro Martins
