unit Eagle.ClientePenseAPI.Model.Resposta.BankDadosConsultaPix;

interface

uses

  XSuperObject;

type

  TDadosBankMenssagem = class
  public

    [Alias('idpagamento')]
    Idpagamento: Integer;

    [Alias('idcorrentista')]
    iIdcorrentista: Integer;

    [Alias('alias')]
    Alias: string;

    [Alias('cpfCpnj')]
    CpfCpnj: string;

    [Alias('nome')]
    Nome: string;

    [Alias('endereco')]
    Endereco: string;

    [Alias('cidade')]
    Cidade: string;

    [Alias('uf')]
    UF: string;

    [Alias('cep')]
    Cep: string;

    [Alias('email')]
    Email: string;

    [Alias('valor')]
    Valor: Double;

    [Alias('vencimento')]
    Vencimento: string;

    [Alias('multaPerc')]
    MultaPerc: Double;

    [Alias('jurosPerc')]
    JurosPerc: Double;

    [Alias('descontoPerc')]
    DescontoPerc: Double;

    [Alias('descontoData')]
    DescontoData: string;

    [Alias('callbackAddress')]
    CallBackAddress: string;

    [Alias('qrcode')]
    Qrcode: string;

    [Alias('dataPagamento')]
    DataPagamento: string;

    [Alias('valorPago')]
    ValorPago: Double;

    [Alias('tipo')]
    Tipo: string;

    [Alias('hash')]
    Hash: string;

    [Alias('materaTransactionId')]
    MateraTransactionId: string;

    [Alias('materaReference')]
    MateraReference: string;

    [Alias('pago')]
    Pago: Boolean;
  end;

  TDadosBankRespostaConsultaPix = class
  public
    [Alias('success')]
    Sucesso: Boolean;

    [Alias('message')]
    DadosBankMenssagem: TDadosBankMenssagem;
  end;


implementation

end.

       {
    "success": true,
    "message": {
        "idpagamento": 774,
        "idcorrentista": 650,
        "alias": "123456/01",
        "cpfCpnj": "12312312312",
        "nome": "José da Silva",
        "endereco": "Rua Sacramento",
        "cidade": "São Paulo",
        "uf": "SP",
        "cep": "16010210",
        "email": "jose@gmail.com",
        "valor": 200.49,
        "vencimento": "2021-08-10",
        "multaPerc": 1.1,
        "jurosPerc": 1.1,
        "descontoPerc": 2.4,
        "descontoData": "2021-08-05",
        "callbackAddress": "https://crudcrud.com/api/9e80ceb265a34890873aad70616b5c98/teste",
        "qrcode": "00020101021226990014br.gov.bcb.pix2577pix-h.bpp.com.br/23114447/qrs1/v2/cobv/01Tcbaijk6jIoehzcVmwPuCpKe0o3P4gIGVmSp5204000053039865406200.495802BR5915Pessoa Juridica6009SAO PAULO62070503***6304D4B4",
        "dataPagamento": "2021-06-29",
        "valorPago": 200.49,
        "tipo": "PIXAGENDADO",
        "hash": "0000000650727005FAA70813966A9659C5B7655E6F",
        "materaTransactionId": "27EB8463-2E14-2351-E162-5D9E08EF351F",
        "materaReference": "QRS1TXKL8KWR8THHICJYTP9QL0Z5V1IVGH9",
        "pago": true
    }
}
