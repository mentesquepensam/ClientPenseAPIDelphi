Abaixo está documentado o código do protótipo Cliente Pense API, a documentação irá focar principalmente na classe de serviço ClientePense que é a classe responsável por realizar o consumo dos EndPoints da MQP API.

Esse pequeno projeto foi escrito em Delphi, utilizando a versão 10.4.1, o mesmo utiliza o Spring4D para construir os objetos e também utiliza algumas recursos contidos no spring, caso não possua o Spring configurado em sua máquina, basta remover as referências do mesmo do projeto.

A documentação da API pode ser consultada em: http://54.207.251.35:5000/swagger/index.html

O projeto é dividido da seguinte forma:
**Main**: Unit que contém a parte gráfica, validações, construção dos objetos que são enviados para a classe ClientePense e tratamentos para exibir o resultado para o usuário.
**Model**: Aqui estão os objetos utilizados para fazer a conversão de Objeto no Delphi para JSON e vice versa.
**Utils**: Em utils foi criada a classe GeradorLog, que apenas gera um log em um arquivo txt de todas as requisições e respostas a API.
**Service**: Aqui temos a classe ClientePense, responsável por realizar o consumo dos EndPoints da MQP API.

**Main**
Como informado anteriormente, o foco da documentação não será o projeto como um todo, portanto a unit Main não será amplamente tratada nesta documentação.
De modo geral a unit main contém pequenas regras de comportamentos associados ao Cliente Pense API, validações para verificar se o usuário preencheu os dados da forma correta, criação dos objetos que são necessários para interagir com API, realiza as consultas a API através da classe ClientePense e trata o retorno das requisições para o usuário.
Neste projeto foi utilizada a unit Eagle.Core.View.Notification através do objeto FNotification para realizar as notificações ao usuário, essa classe é utilizada internamente nos projetos da Eagle e a mesma não será publicada, portanto você deve substituir as referências a este objeto por um semelhante, utilizar um método nativo do Delphi ou simplesmente remover essas notificações.

**Model**
Em models temos os objetos de requisição e de reposta. Os objetos de requisição são utilizados para montar o corpo da requisição que será enviado no momento de consumo ao EndPoint. Os objetos de respostas são os objetos que irão receber o retorno do consumo ao EndPoint da API. 
Para realizar a conversão dos objetos em JSON (padrão da API) para o objeto em pascal é utilizado o framework XSuperObject, o mesmo pode ser encontrado aqui (https://github.com/onryldz/x-superobject). Basta colocar a referência da unit XSuperObject no uses e através da notação [Alias(' NomeAtributo')] relacionar o atributo JSON ao atributo do Objeto, assim no momento da conversão que é realizada na classe ClientePense o XSuperObject irá saber como relacionar os objetos JSON aos objetos Pascal.

**Utils**
Em utils temos apenas a classe utilitária GeradorLog, e possui apenas o método AdicionarLog que por sua vez cria (caso não exista) um arquivo ClientePenseAPILog.txt na mesma pasta em que o executável está, caso o arquivo exista ela apenas irá abri-lo, adicionar o log e fechar o arquivo.

**Service**
É aqui que está a classe responsável por conectar na API e consumir os seus EndPoints.
A classe ClientePense utiliza a classe RestClient para se conectar com a API.

**RestClient**
A classe RestClient encapsula o componente nativo do Delphi TIdHttp, responsável por realizar as comunicações utilizando o protocolo HTTP.
Em sua criação a classe RestClient recebe o BaseURL que é a URL da API, no nosso caso por enquanto é: http://54.207.251.35:5000.
Temos ainda os métodos Get, Post e Delete, que são os métodos HTTP, cada um deles recebe através do parâmetro Recurso, o caminho do EndPoint que será consumido.
No caso do método Post ele ainda pode receber através do parâmetro Data o corpo da requisição que será enviado para o EndPoint.
Esses três métodos (Get, Post e Delete) enviam as requisições para a API e o retorno dessa requisição é feito através do objeto HttpResponse, que irá retornar o Código de status da requisição que foi realizada, o corpo do retorno da requisição e o erro caso o mesmo ocorra.
Temos também o método ConfigurarHeaders que configura o Header da requisição caso seja necessário. Neste projeto é necessário enviar no cabeçalho da requisição o Bearer Token, para consumir todos os End Points com exceção do EndPoit ‘Auth’ que é o EndPoit que retornar o BearerToken.

**ClientePense**

Está é a classe responsável por realizar a comunicação com a MQP API, como informado está classe utiliza a classe RestClient para acionar os métodos do protocolo http.
É utilizado também os métodos TJson.Stringify e TJson.Parse do framework XSuperObject, o método TJson.Stringify converte um Objeto em pascal para JSON e o método TJson.Parse converte o JSON para um Objeto Pascal, esses método serão utilizados basicamente em todos os métodos da classe para realizar as conversões e simplificar a interpretação dos mesmos.

A utilização deles é bem simples, no caso do TJson.Stringify você deve definir de qual tipo de objeto será realizada a conversão entre <> e passar o objeto em si entre (). Ex: TJson.Parse<TipoMeuObjeto>(MeuObjeto).
E no caso do TJson. Parse é bem semelhante, você define entre <> para qual tipo de objeto a string JSON será convertida e em () deve ser passada a string JSON. No nosso caso a string JSON sempre será o corpo do retorno da requisição. Ex: TJson. Parse<TipoObjetoQueQueroConverter>(CorpoDaRequisicao).

Em seu Create ela recebe a BaseURL da API que será consumida, no nosso caso atualmente é http://54.207.251.35:5000.
  
Temos os seguintes métodos públicos: 
  
**RealizarAutenticacaoCliente**: Esse método irá autenticar o cliente para que o mesmo possa consumir os demais EndPoints da API. 
Este método recebe os dados DadosAutenticacao, realiza a conversão do objeto para JSON através do método TJson.Stringify, e este objeto JSON é enviado no corpo da requisição. Com isso é realizada uma requisição do tipo POST no EndPoint '/api/Auth' enviando os dados necessários no corpo da requisição.
Caso o código de retorno da requisição seja diferente de 200 (retorno de sucesso) o método entra no tratamento de erros passando a mensagem de erro retornada e o código retornado. 
Caso o código de retorno tenha sido 200, significa que o usuário foi autenticado com sucesso, então o retorno da requisição é enviado para o Result no formato do objeto TDadosRespostaAutenticacao.
E no retorno dessa requisição podemos acessar o Token para configurar o Header da requisição e com isso permitir o consumo dos outros EndPoints da API.
Caso seja feito alguma requisição aos outros EndPoints sem um BearerToken válido configurado no Header da requisição, o consumo desses EndPoints irão retornar o erro 401 informando que o usuário não está autenticado.
O BearerToken por sua vez tem uma validade de 10 minutos (definido no comportamento da API), portanto após o vencimento desses 10 minutos, deve ser feita uma nova requisição no EndPoint de autenticação para que o token seja atualizado, isso pode ser feito de forma manual, ou até mesmo tratado para que seja feito de forma automática, onde caso seja retornado o erro 401 a classe automaticamente iria realizar a autenticação novamente. Neste projeto em questão o comportamento está manual, ou seja quando é retornado o erro 401 eu tenho que manualmente interagir com o botão ‘Conectar’ que aciona este método RealizarAutenticacaoCliente e atualiza o BearerToken.
  
**EnviarLoja** e **EnviarTerminal**: Os métodos Enviar Loja e Enviar Terminal são bem semelhantes. Elas apenas criam a loja e os terminais no Mercado Pago. 
Eles recebem os dados que serão enviados no corpo da requisição, é feita a conversão dos objetos para JSON através do método TJson.Stringify, e é realizado um POST nos endpoints '/api/Config/Store' (Loja) e '/api/Config/Pdv' (Terminal). Caso o código de retorno seja diferente de 200, a classe irá tratar o erro para o usuário, caso contrário a loja ou terminal foi criado com sucesso.
Nesses dois métodos o retorno da requisição não foi convertido em objeto, por que o retorno é apenas uma string como pode ser verificado na documentação da API.
  
**EnviarPagamento**: O método enviar pagamento registra a solicitação de pagamento na API.
Ele recebe os dados do pagamento, é realizada a conversão para JSON através do método TJson.Stringify. 
É feito um tratamento que verifica se foi enviado itens nos dados do pagamento, caso não tenha sido enviado dados do pagamento, é feita uma pequena alteração nos dados, na conversão padrão que o método TJson.Stringify realiza quando um objeto Array não foi preenchido ele retorna [], sinalizando que se trata de um array vazio, porem para a API aceitar pagamentos sem itens, deve ser enviado null no valor dos itens e não colchetes vazios, então todo esse tratamento é feito através do método ConverterItensPagamentoVazioParaNull.
  
Após esse tratamento é realizado um POST na rota '/api/Payment' enviando no corpo da requisição os dados do pagamento em uma string JSON.
Caso o código de retorno da requisição seja diferente 201 (Retorno padrão adotado pela API quando o pagamento é criado com sucesso) é realizado o tratamento dos erros. Caso o pagamento tenha sido enviado com sucesso, é feita a conversão do corpo da resposta para o tipo TDadosRespostaPagamento para que os dados sejam exibidos para o usuário.
  
**ConsultarPagamentoPeloCodigoAPI** e **ConsultarPagamentoPeloCodigoERP**: Esses dois métodos também são semelhantes, eles consulta a API através de Get passando o ID do pagamento que a API gerou no caso do método ConsultarPagamentoPeloCodigoAPI ou o código do pagamento que foi definido pelo usuário no momento de enviar o pagamento através do método ConsultarPagamentoPeloCodigoERP.
Em ambos os casos eles recebem o código que será utilizado na consulta, o código é adicionado a rota '/api/Payment/%d' (ConsultarPagamentoPeloCodigoAPI) ou '/api/Payment/ByExternalReference/%s' (ConsultarPagamentoPeloCodigoERP). Com isso é feito um GET na API passando o código na rota, caso o retorno da consulta seja diferente de 200 é realizado o tratamento dos erros. Caso o pagamento tenha sido consultado com sucesso, o método irá converter o corpo da resposta da requisição para o objeto TDadosRespostaPagamento e assim o pagamento consultado pode ser exibido para o usuário.
  
**DeletarPagamento**: Método responsável por deletar/estornar/cancelar um pagamento criado.
Este método é bem simples, ele recebe o código do pagamento que será deletado e realiza um DELETE através do EndPoint '/api/Payment/%d'. Caso o pagamento não tenha sido deletado com sucesso é feito o tratamento dos erros, caso contrário o pagamento foi  deletado/estornado/cancelado com sucesso e uma mensagem pode ser exibida para o usuário. Este método é uma procedure e não uma function, por que na resposta desta requisição não é retornado nada.
ListarCarteiras: Método bem simples, que realiza apenas um GET no EndPoint '/api/Wallet' que por sua vez retorna em uma string as carteiras disponíveis para o cliente.

Métodos privados:
  
**ConverterItensPagamentoVazioParaNull**: Método responsável por converter itens vazios ("items":[]) para null ("items":null), conforme o comportamento descrito anteriormente.
  
**MontarHeadersDaRequisicao**:  Para consumir todos EndPoints da API com exceção do EndPoint de autenticação ('/api/Auth') é necessário enviar no Header da requisição um Bearer Token, portanto esse método irá montar no Header da requisição uma sessão authorization com o Bearer Token.
O token é retornado pelo método RealizarAutenticacaoCliente e neste método o Header da requisição já é configurado quando a autenticação é realizada com sucesso. O token tem validade de 10 minutos e após isso ele deve ser renovado, caso contrário as repostas das requisições serão o erro 401.
  
**TratarError**: Método responsável para tratar os retornos da API que não estão dentro do padrão aceito. Portanto, caso alguma resposta de algum EndPoint não esteja dentro do padrão estabelecido, esse método é acionado para que seja exibido o retorno para o usuário no formato de um erro. 
Caso a API tenha retornado um erro dentro do padrão de erros definido, é feita a conversão do corpo da requisição para o objeto DadosRespostaErro, e as mensagens contidas neste objeto são exibidas para o usuário, caso contrário, uma mensagem genérica informando o código de erro e o provável motivo do erro é exibida para o usuário.
Há também a propriedade BearerToken que apenas retorna o BearerToken configurado no Header da requisição no momento.
