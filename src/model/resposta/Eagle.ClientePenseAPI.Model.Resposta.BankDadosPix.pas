unit Eagle.ClientePenseAPI.Model.Resposta.BankDadosPix;

interface

uses

  XSuperObject;

type


  TDadosBankMenssagem = class
  public
    [Alias('hash')]
    Hash: string;

    [Alias('qrcode')]
    Qrcode: string;
  end;


  TDadosBankRespostaPix = class
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
        "hash": "000000084088EE0065713290AE40EA19E523C86FC0",
        "qrcode": "00020101021226990014br.gov.bcb.pix2577pix-h.bpp.com.br/23114447/qrs1/v2/01X3FeHQhn1ejIDjl1nQcKKOeqEXWqscsLe8aK4agmE520400005303986540520.005802BR5915Pessoa Juridica6009SAO PAULO62070503***6304EEC9"
    }
}