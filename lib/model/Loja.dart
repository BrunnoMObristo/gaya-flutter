
class Loja {
  int? id;
  String? razaoSocial;
   String? cnpj;
   String? nomeFantasia;
   String? telefone;
   String? celular;
   String? cep;
   String? estado;
   String? cidade;
   String? endereco;  
   String? descricao;
   String? segmento;
   String? complemento;
 
  Loja(this.razaoSocial, this.cnpj, this.nomeFantasia, this.telefone, this.celular, this.cep, this.estado, this.cidade, this.endereco, this.descricao, this.segmento, this.complemento);
 
  Loja.fromMap(Map map) {
    this.id = map["id"];
    this.razaoSocial = map["razao_social"];
    this.cnpj = map["cnpj"];
    this.nomeFantasia = map["nome_fantasia"];
    this.telefone = map["telefone"];
    this.celular = map["celular"];
    this.cep = map["cep"];
    this.estado = map["estado"];
    this.cidade = map["cidade"];
    this.endereco = map["endereco"];
    this.descricao = map["descricao"];
    this.segmento = map["segmento"];
    this.complemento = map["complemento"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {      
      "razao_social": razaoSocial, 
      "cnpj": cnpj, 
      "nome_fantasia":nomeFantasia, 
      "telefone":telefone, 
      "celular":celular, 
      "cep":cep, 
      "estado":estado, 
      "cidade":cidade, 
      "endereco":endereco,      
      "descricao": descricao,
      "segmento": segmento,
      "complemento":complemento
    };
 
    map["id"] = id;
 
    return map;
  }
}
