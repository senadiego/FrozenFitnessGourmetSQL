DROP database if EXISTS dbsmartgourmet;

create database if not EXISTS dbsmartgourmet;
use dbsmartgourmet;

create table tblCarrinho(
codCarrinho int auto_increment primary key,
codCliente int,
codPrato int,
quantidade int,
codProduto int
);

create table tblParceiro(
codParceiro int auto_increment primary key,
cnpjParceiro varchar(14),
nomeParceiro varchar(60),
imgParceiro varchar(100),
siteParceiro varchar (100),
telefoneParceiro varchar(20),
codEndereco int,
emailParceiro varchar(100),
imagemParceiro varchar(100));

create table tblEmpresa(
codEmpresa int auto_increment primary key,
cnpjEmpresa varchar(14),
nomeEmpresa varchar(60));

create table tblContato(
codContato int auto_increment primary key,
telefoneContato1 varchar(20),
emailContato varchar(100),
celularContato varchar(20),
telefoneContato2 varchar(20),
codEmpresa int);

create table tblEndereco(
codEndereco int auto_increment primary key,
logradouro varchar(100),
cep varchar(10),
numero varchar(30),
bairro varchar(60),
complemento varchar(80),
codCidade int);

create table tblEmpresaEnd(
codEmpresaEnd int auto_increment primary key,
codEndereco int,
codEmpresa int);

create table tblSobreLoja(
codSobreLoja int auto_increment primary key,
imgSobreLoja varchar(100),
imgSobreLoja1 varchar(100),
imgSobreLoja2 varchar(100),
imgSobreLoja3 varchar(100),
tituloSobreLoja varchar(100),
historiaSobreLoja text,
codEmpresa int);

create table tblTransportadora(
codTransportadora int auto_increment primary key,
razaoSocial varchar(100),
nomeFantasia varchar(100),
cnpjTransportadora varchar(20),
telefonePrincipal varchar(20),
telefoneContato varchar(20),
emailPrincipal varchar(100),
emailContato varchar(100),
responsavelTransportadora varchar(60),
codEndereco int);

create table tblVeiculoTransp(
codVeiculoTransp int auto_increment primary key,
placaVeiculo varchar(8),
codTipoVeiculo int,
codTransportadora int);

create table tblTipoVeiculo(
codTipoVeiculo int auto_increment primary key,
nomeTipoVeiculo varchar(60));

create table tblPedido(
codPedido int auto_increment primary key,
tipoPedido varchar(60),
dtEntrega date,
dtCompra date,
total decimal(9,2), 
codCliente int,
codStatus int,
codVeiculoTransp int);

create table tblStatus(
codStatus int auto_increment primary key,
statusPedido varchar(60));

create table tblItemPedido(
codItemPedido int auto_increment primary key,
quantidade int,
codPedido int,
codPrato int,
codProduto int);

create table tblPrato(
codPrato int auto_increment primary key,
nomePrato varchar(100),
precoPrato decimal(9,2),
descricaoPrato text,
caloria decimal(9,2),
valorEnergetico decimal(9,2),
carboidrato decimal(9,2),
proteina decimal(9,2),
sodio decimal(9,2),
gorduras decimal(9,2),
imagemPrato varchar(100),
visitas int);

create table tblProdutoPrato(
codProdutoPrato int auto_increment primary key,
codPrato int,
codProduto int);

create table tblProduto(
codProduto int auto_increment primary key,
nomeProduto varchar(60),
imagemProduto varchar(100),
precoProduto decimal(9,2),
descricaoProduto text,
caloriaProduto decimal(9,2),
valorEnergeticoProduto decimal(9,2),
carboidratoProduto decimal(9,2),
proteinaProduto decimal(9,2),
sodioProduto decimal(9,2),
gordurasProduto decimal(9,2));

create table tblCatProduto(
codCatProduto int auto_increment primary key,
codCategoriaMateria int,
codProduto int);

create table tblProdutoMateria(
codProdutoMateria int auto_increment primary key,
codProduto int,
codMateria int);

create table tblMateriaPrima(
codMateria int auto_increment primary key,
nomeMateria varchar(60),
precoMateria decimal(9,2),
descricaoMateria text);

create table tblCatMateria(
codCatMateria int auto_increment primary key,
codMateria int,
codCategoriaMateria int);

create table tblCategoriaMateria(
codCategoriaMateria int auto_increment primary key,
nomeCategoriaMateria varchar(60),
imagemCategoriaMateria varchar(100),
descricaoCategoriaMateria text);

create table tblPratoPromocao(
codPratoPromocao int auto_increment primary key,
codPromocao int,
codPrato int);

create table tblEstoque(
codEstoque int auto_increment primary key,
codMateria int,
dtFabricacao date,
dtValidade date,
quantidade int,
quantidadeMinima int,
foreign key(codMateria) references tblMateriaPrima(codMateria));

create table tblProdutoPromocao(
codProdutoPromocao int auto_increment primary key,
codPromocao int,
codProduto int);

create table tblPromocao(
codPromocao int auto_increment primary key,
nomePromocao varchar(60),
dtInicial date,
dtFinal date,
valorDesconto decimal(9,2));

create table tblSlider(
codSlider int auto_increment primary key,
tituloSlider varchar(60),
linkImagemSlider varchar(200));

create table tblFaleConosco(
codFaleConosco int auto_increment primary key,
email varchar(100),
nome varchar(60),
sobrenome varchar(60),
mensagem text,
descricao varchar(60));

create table tblCatPrato(
codCatPrato int auto_increment primary key,
codPrato int,
codCategoriaPrato int);

create table tblCategoriaPrato(
codCategoriaPrato int auto_increment primary key,
nomeCategoriaPrato varchar(60),
imagemCategoriaPrato varchar(100),
descricaoCategoriaPrato text);

create table tblFuncionarioTransp(
codFuncionarioTransp int auto_increment primary key,
nomeFuncionarioTransp varchar(60),
cpfFuncionarioTransp varchar(14),
cargo varchar(60),
codTransportadora int);

create table tblUsuarioVeiculoTransp(
codUsuarioVeiculoTransp int auto_increment primary key,
codVeiculoTransp int,
codUsuario int);

create table tblUsuario(
codUsuario int auto_increment primary key,
usuario varchar(20),
senha varchar(20),
imagemUsuario varchar(200),
codTipoUsuario int);

create table tblTipoUsuario(
codTipoUsuario int auto_increment primary key,
nomeTipoUsuario varchar(30));

create table tblUsuarioFuncionarioLoja(
codUsuarioFuncionarioLoja int auto_increment primary key,
codFuncionarioLoja int,
codUsuario int);

create table tblFuncionarioLoja(
codFuncionarioLoja int auto_increment primary key, 
nomeFuncionarioLoja varchar(60),
cpfFuncionarioLoja varchar(14));

create table tblUsuarioCliente(
codUsuarioCliente int auto_increment primary key,
codCliente int,
codUsuario int);

create table tblCliente(
codCliente int auto_increment primary key,
nomeCliente varchar(60),
cpfCliente varchar(14),
dtNascCliente date,
peso decimal(9,2), 
altura decimal(9,2),
telefoneCliente varchar(60),
celularCliente varchar(20),
emailCliente varchar(100),
sexo char(1));

create table tblClienteEnd(
codClienteEnd int auto_increment primary key,
codEndereco int,
codCliente int);

create table tblClienteJuridico(
codClienteJuridico int auto_increment primary key,
nomeContato varchar(60),
razaoSocial varchar(60),
inscricaoEstadual varchar(60), 
telefonePrincipal varchar(60), 
telefoneContato varchar(60),
emailPrincipal varchar(60),
emailContato varchar(60)
);

create table tblClienteJuridicoEnd(
codClienteJuridicoEnd int auto_increment primary key,
codEndereco int,
codClienteJuridico int);

create table tblCidade(
codCidade int auto_increment primary key,
nomeCidade varchar(60),
codEstado int);

create table tblEstado(
codEstado int auto_increment primary key,
nomeEstado varchar(60),
uf varchar(2));

create table tblObjetivoCliente(
codObjetivoCliente int auto_increment primary key,
codObjetivo int,
codCliente int);

create table tblObjetivo(
codObjetivo int auto_increment primary key,
nomeObjetivo varchar(660),
descricaoObjetivo text);

create table tblExercicioObjetivo(
codExercicioObjetivo int auto_increment primary key,
codExercicio int,
codObjetivo int);

create table tblExercicio(
codExercicio int auto_increment primary key,
imagemExercicio varchar(200),
tituloExercicio varchar(60),
descricaoExercicio text);

create table tblDica(
codDica int auto_increment primary key,
imagemDica varchar(200),
descricaoDica text,
tituloDica varchar(60));

create table tblDadosGps(
codDadosGps int auto_increment primary key,
codPedido int,
latitude varchar(100),
longitude varchar(100));

use dbsmartgourmet;

alter table tblContato
add foreign key(codEmpresa) references tblEmpresa(codEmpresa);

alter table tblVeiculoTransp
add foreign key(codTipoVeiculo) references tblTipoVeiculo(codTipoVeiculo);

alter table tblVeiculoTransp
add foreign key(codTransportadora) references tblTransportadora(codTransportadora);

alter table tblPedido
add foreign key(codCliente) references tblCliente(codCliente);

alter table tblPedido
add foreign key(codStatus) references tblStatus(codStatus);

alter table tblPedido
add foreign key(codVeiculoTransp) references tblVeiculoTransp(codVeiculoTransp);

alter table tblTransportadora
add foreign key(codEndereco) references tblEndereco(codEndereco);

alter table tblDadosGps
add foreign key(codPedido) references tblPedido(codPedido);

alter table tblUsuarioVeiculoTransp
add foreign key(codVeiculoTransp) references tblVeiculoTransp(codVeiculoTransp);

alter table tblUsuarioVeiculoTransp
add foreign key(codUsuario) references tblUsuario(codUsuario);

alter table tblItemPedido
add foreign key(codPedido) references tblPedido(codPedido);

alter table tblItemPedido
add foreign key(codPrato) references tblPrato(codPrato);


alter table tblItemPedido
add foreign key(codProduto) references tblProduto(codProduto);


alter table tblProdutoPrato
add foreign key(codProduto) references tblProduto(codProduto);

alter table tblCatProduto
add foreign key(codCategoriaMateria) references tblCategoriaMateria(codCategoriaMateria);

alter table tblCatProduto
add foreign key(codProduto) references tblProduto(codProduto);

alter table tblProdutoMateria
add foreign key(codMateria) references tblMateriaPrima(codMateria);

alter table tblProdutoMateria
add foreign key(codProduto) references tblProduto(codProduto);

alter table tblCatMateria
add foreign key(codCategoriaMateria) references tblCategoriaMateria(codCategoriaMateria);

alter table tblCatMateria
add foreign key(codMateria) references tblMateriaPrima(codMateria);

alter table tblPratoPromocao
add foreign key(codPromocao) references tblPromocao(codPromocao);

alter table tblPratoPromocao
add foreign key(codPrato) references tblPrato(codPrato);

alter table tblProdutoPromocao
add foreign key(codPromocao) references tblPromocao(codPromocao);

alter table tblProdutoPromocao
add foreign key(codProduto) references tblProduto(codProduto);

alter table tblCatPrato
add foreign key(codPrato) references tblPrato(codPrato);

alter table tblCatPrato
add foreign key(codCategoriaPrato) references tblCategoriaPrato(codCategoriaPrato);

alter table tblSobreLoja
add foreign key(codEmpresa) references tblEmpresa(codEmpresa);

alter table tblEmpresaEnd
add foreign key(codEmpresa) references tblEmpresa(codEmpresa);

alter table tblEmpresaEnd
add foreign key(codEndereco) references tblEndereco(codEndereco);

alter table tblEndereco
add foreign key(codCidade) references tblCidade(codCidade);

alter table tblUsuarioFuncionarioLoja
add foreign key(codFuncionarioLoja) references tblFuncionarioLoja(codFuncionarioLoja);

alter table tblUsuarioFuncionarioLoja
add foreign key(codUsuario) references tblUsuario(codUsuario);

alter table tblCidade
add foreign key(codEstado) references tblEstado(codEstado);

alter table tblUsuarioCliente
add foreign key(codCliente) references tblCliente(codCliente);

alter table tblUsuarioCliente
add foreign key(codUsuario) references tblUsuario(codUsuario);

alter table tblClienteEnd
add foreign key(codEndereco) references tblEndereco(codEndereco);

alter table tblClienteEnd
add foreign key(codCliente) references tblCliente(codCliente);

alter table tblClienteJuridicoEnd
add foreign key(codClienteJuridico) references tblClienteJuridico(codClienteJuridico);

alter table tblClienteJuridicoEnd
add foreign key(codEndereco) references tblEndereco(codEndereco);

alter table tblObjetivoCliente
add foreign key(codCliente) references tblCliente(codCliente);

alter table tblObjetivoCliente
add foreign key(codObjetivo) references tblObjetivo(codObjetivo);

alter table tblExercicioObjetivo
add foreign key(codObjetivo) references tblObjetivo(codObjetivo);

alter table tblExercicioObjetivo
add foreign key(codExercicio) references tblExercicio(codExercicio);

alter table tblParceiro
add foreign key(codEndereco) references tblEndereco(codEndereco);

alter table tblUsuario
add foreign key(codTipoUsuario) references tblTipoUsuario(codTipoUsuario);

alter table tblCarrinho 
add foreign key (codCliente) references tblCliente (codCliente);

alter table tblCarrinho
add foreign key (codPrato) references tblPrato (codPrato);

alter table tblCarrinho
add foreign key (codProduto) references tblProduto (codProduto);


INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Acre' , 'AC');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Alagoas' , 'AL');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Amazonas' , 'AM');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Amapá' , 'AP');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Bahia' , 'BA');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Ceará' , 'CE');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Distrito Federal' , 'DF');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Espírito Santo' , 'ES');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Goiás' , 'GO');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Maranhão' , 'MA');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Minas Gerais' , 'MG');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Mato Grosso do Sul' , 'MS');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Mato Grosso' , 'MT');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Pará' , 'PA');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Paraíba' , 'PB');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Pernambuco' , 'PE');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Piauí' , 'PI');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Paraná' , 'PR');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Rio de Janeiro' , 'RJ');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Rio Grande do Norte' , 'RN');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Rondônia' , 'RO');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Roraima' , 'RR');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Rio Grande do Sul' , 'RS');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Santa Catarina' , 'SC');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Sergipe' , 'SE');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('São Paulo' , 'SP');
INSERT INTO tblEstado (nomeEstado, uf) VALUES ('Tocantins' , 'TO');


insert into tblCidade (nomeCidade, codEstado) values("Alta Floresta D'Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Alto Alegre dos Parecis", "21");
insert into tblCidade (nomeCidade, codEstado) values("Alto Paraíso", "21");
insert into tblCidade (nomeCidade, codEstado) values("Alvorada D'Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Ariquemes", "21");
insert into tblCidade (nomeCidade, codEstado) values("Buritis", "21");
insert into tblCidade (nomeCidade, codEstado) values("Cabixi", "21");
insert into tblCidade (nomeCidade, codEstado) values("Cacaulândia", "21");
insert into tblCidade (nomeCidade, codEstado) values("Cacoal", "21");
insert into tblCidade (nomeCidade, codEstado) values("Campo Novo de Rondônia", "21");
insert into tblCidade (nomeCidade, codEstado) values("Candeias do Jamari", "21");
insert into tblCidade (nomeCidade, codEstado) values("Castanheiras", "21");
insert into tblCidade (nomeCidade, codEstado) values("Cerejeiras", "21");
insert into tblCidade (nomeCidade, codEstado) values("Chupinguaia", "21");
insert into tblCidade (nomeCidade, codEstado) values("Colorado do Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Corumbiara", "21");
insert into tblCidade (nomeCidade, codEstado) values("Costa Marques", "21");
insert into tblCidade (nomeCidade, codEstado) values("Cujubim", "21");
insert into tblCidade (nomeCidade, codEstado) values("Espigão D'Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Governador Jorge Teixeira", "21");
insert into tblCidade (nomeCidade, codEstado) values("Guajará-Mirim", "21");
insert into tblCidade (nomeCidade, codEstado) values("Itapuã do Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Jaru", "21");
insert into tblCidade (nomeCidade, codEstado) values("Ji-Paraná", "21");
insert into tblCidade (nomeCidade, codEstado) values("Machadinho D'Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Ministro Andreazza", "21");
insert into tblCidade (nomeCidade, codEstado) values("Mirante da Serra", "21");
insert into tblCidade (nomeCidade, codEstado) values("Monte Negro", "21");
insert into tblCidade (nomeCidade, codEstado) values("Nova Brasilândia D'Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Nova Mamoré", "21");
insert into tblCidade (nomeCidade, codEstado) values("Nova União", "21");
insert into tblCidade (nomeCidade, codEstado) values("Novo Horizonte do Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Preto do Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Parecis", "21");
insert into tblCidade (nomeCidade, codEstado) values("Pimenta Bueno", "21");
insert into tblCidade (nomeCidade, codEstado) values("Pimenteiras do Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("Porto Velho", "21");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Médici", "21");
insert into tblCidade (nomeCidade, codEstado) values("Primavera de Rondônia", "21");
insert into tblCidade (nomeCidade, codEstado) values("Rio Crespo", "21");
insert into tblCidade (nomeCidade, codEstado) values("Rolim de Moura", "21");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia D'Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("São Felipe D'Oeste", "21");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Guaporé", "21");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Guaporé", "21");
insert into tblCidade (nomeCidade, codEstado) values("Seringueiras", "21");
insert into tblCidade (nomeCidade, codEstado) values("Teixeirópolis", "21");
insert into tblCidade (nomeCidade, codEstado) values("Theobroma", "21");
insert into tblCidade (nomeCidade, codEstado) values("Urupá", "21");
insert into tblCidade (nomeCidade, codEstado) values("Vale do Anari", "21");
insert into tblCidade (nomeCidade, codEstado) values("Vale do Paraíso", "21");
insert into tblCidade (nomeCidade, codEstado) values("Vilhena", "21");
insert into tblCidade (nomeCidade, codEstado) values("Acrelândia", "1");
insert into tblCidade (nomeCidade, codEstado) values("Assis Brasil", "1");
insert into tblCidade (nomeCidade, codEstado) values("Brasiléia", "1");
insert into tblCidade (nomeCidade, codEstado) values("Bujari", "1");
insert into tblCidade (nomeCidade, codEstado) values("Capixaba", "1");
insert into tblCidade (nomeCidade, codEstado) values("Cruzeiro do Sul", "1");
insert into tblCidade (nomeCidade, codEstado) values("Epitaciolândia", "1");
insert into tblCidade (nomeCidade, codEstado) values("Feijó", "1");
insert into tblCidade (nomeCidade, codEstado) values("Jordão", "1");
insert into tblCidade (nomeCidade, codEstado) values("Mâncio Lima", "1");
insert into tblCidade (nomeCidade, codEstado) values("Manoel Urbano", "1");
insert into tblCidade (nomeCidade, codEstado) values("Marechal Thaumaturgo", "1");
insert into tblCidade (nomeCidade, codEstado) values("Plácido de Castro", "1");
insert into tblCidade (nomeCidade, codEstado) values("Porto Acre", "1");
insert into tblCidade (nomeCidade, codEstado) values("Porto Walter", "1");
insert into tblCidade (nomeCidade, codEstado) values("Rio Branco", "1");
insert into tblCidade (nomeCidade, codEstado) values("Rodrigues Alves", "1");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa do Purus", "1");
insert into tblCidade (nomeCidade, codEstado) values("Sena Madureira", "1");
insert into tblCidade (nomeCidade, codEstado) values("Senador Guiomard", "1");
insert into tblCidade (nomeCidade, codEstado) values("Tarauacá", "1");
insert into tblCidade (nomeCidade, codEstado) values("Xapuri", "1");
insert into tblCidade (nomeCidade, codEstado) values("Alvarães", "3");
insert into tblCidade (nomeCidade, codEstado) values("Amaturá", "3");
insert into tblCidade (nomeCidade, codEstado) values("Anamã", "3");
insert into tblCidade (nomeCidade, codEstado) values("Anori", "3");
insert into tblCidade (nomeCidade, codEstado) values("Apuí", "3");
insert into tblCidade (nomeCidade, codEstado) values("Atalaia do Norte", "3");
insert into tblCidade (nomeCidade, codEstado) values("Autazes", "3");
insert into tblCidade (nomeCidade, codEstado) values("Barcelos", "3");
insert into tblCidade (nomeCidade, codEstado) values("Barreirinha", "3");
insert into tblCidade (nomeCidade, codEstado) values("Benjamin Constant", "3");
insert into tblCidade (nomeCidade, codEstado) values("Beruri", "3");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista do Ramos", "3");
insert into tblCidade (nomeCidade, codEstado) values("Boca do Acre", "3");
insert into tblCidade (nomeCidade, codEstado) values("Borba", "3");
insert into tblCidade (nomeCidade, codEstado) values("Caapiranga", "3");
insert into tblCidade (nomeCidade, codEstado) values("Canutama", "3");
insert into tblCidade (nomeCidade, codEstado) values("Carauari", "3");
insert into tblCidade (nomeCidade, codEstado) values("Careiro", "3");
insert into tblCidade (nomeCidade, codEstado) values("Careiro da Várzea", "3");
insert into tblCidade (nomeCidade, codEstado) values("Coari", "3");
insert into tblCidade (nomeCidade, codEstado) values("Codajás", "3");
insert into tblCidade (nomeCidade, codEstado) values("Eirunepé", "3");
insert into tblCidade (nomeCidade, codEstado) values("Envira", "3");
insert into tblCidade (nomeCidade, codEstado) values("Fonte Boa", "3");
insert into tblCidade (nomeCidade, codEstado) values("Guajará", "3");
insert into tblCidade (nomeCidade, codEstado) values("Humaitá", "3");
insert into tblCidade (nomeCidade, codEstado) values("Ipixuna", "3");
insert into tblCidade (nomeCidade, codEstado) values("Iranduba", "3");
insert into tblCidade (nomeCidade, codEstado) values("Itacoatiara", "3");
insert into tblCidade (nomeCidade, codEstado) values("Itamarati", "3");
insert into tblCidade (nomeCidade, codEstado) values("Itapiranga", "3");
insert into tblCidade (nomeCidade, codEstado) values("Japurá", "3");
insert into tblCidade (nomeCidade, codEstado) values("Juruá", "3");
insert into tblCidade (nomeCidade, codEstado) values("Jutaí", "3");
insert into tblCidade (nomeCidade, codEstado) values("Lábrea", "3");
insert into tblCidade (nomeCidade, codEstado) values("Manacapuru", "3");
insert into tblCidade (nomeCidade, codEstado) values("Manaquiri", "3");
insert into tblCidade (nomeCidade, codEstado) values("Manaus", "3");
insert into tblCidade (nomeCidade, codEstado) values("Manicoré", "3");
insert into tblCidade (nomeCidade, codEstado) values("Maraã", "3");
insert into tblCidade (nomeCidade, codEstado) values("Maués", "3");
insert into tblCidade (nomeCidade, codEstado) values("Nhamundá", "3");
insert into tblCidade (nomeCidade, codEstado) values("Nova Olinda do Norte", "3");
insert into tblCidade (nomeCidade, codEstado) values("Novo Airão", "3");
insert into tblCidade (nomeCidade, codEstado) values("Novo Aripuanã", "3");
insert into tblCidade (nomeCidade, codEstado) values("Parintins", "3");
insert into tblCidade (nomeCidade, codEstado) values("Pauini", "3");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Figueiredo", "3");
insert into tblCidade (nomeCidade, codEstado) values("Rio Preto da Eva", "3");
insert into tblCidade (nomeCidade, codEstado) values("Santa Isabel do Rio Negro", "3");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Içá", "3");
insert into tblCidade (nomeCidade, codEstado) values("São Gabriel da Cachoeira", "3");
insert into tblCidade (nomeCidade, codEstado) values("São Paulo de Olivença", "3");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Uatumã", "3");
insert into tblCidade (nomeCidade, codEstado) values("Silves", "3");
insert into tblCidade (nomeCidade, codEstado) values("Tabatinga", "3");
insert into tblCidade (nomeCidade, codEstado) values("Tapauá", "3");
insert into tblCidade (nomeCidade, codEstado) values("Tefé", "3");
insert into tblCidade (nomeCidade, codEstado) values("Tonantins", "3");
insert into tblCidade (nomeCidade, codEstado) values("Uarini", "3");
insert into tblCidade (nomeCidade, codEstado) values("Urucará", "3");
insert into tblCidade (nomeCidade, codEstado) values("Urucurituba", "3");
insert into tblCidade (nomeCidade, codEstado) values("Alto Alegre", "22");
insert into tblCidade (nomeCidade, codEstado) values("Amajari", "22");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista", "22");
insert into tblCidade (nomeCidade, codEstado) values("Bonfim", "22");
insert into tblCidade (nomeCidade, codEstado) values("Cantá", "22");
insert into tblCidade (nomeCidade, codEstado) values("Caracaraí", "22");
insert into tblCidade (nomeCidade, codEstado) values("Caroebe", "22");
insert into tblCidade (nomeCidade, codEstado) values("Iracema", "22");
insert into tblCidade (nomeCidade, codEstado) values("Mucajaí", "22");
insert into tblCidade (nomeCidade, codEstado) values("Normandia", "22");
insert into tblCidade (nomeCidade, codEstado) values("Pacaraima", "22");
insert into tblCidade (nomeCidade, codEstado) values("Rorainópolis", "22");
insert into tblCidade (nomeCidade, codEstado) values("São João da Baliza", "22");
insert into tblCidade (nomeCidade, codEstado) values("São Luiz", "22");
insert into tblCidade (nomeCidade, codEstado) values("Uiramutã", "22");
insert into tblCidade (nomeCidade, codEstado) values("Abaetetuba", "14");
insert into tblCidade (nomeCidade, codEstado) values("Abel Figueiredo", "14");
insert into tblCidade (nomeCidade, codEstado) values("Acará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Afuá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Água Azul do Norte", "14");
insert into tblCidade (nomeCidade, codEstado) values("Alenquer", "14");
insert into tblCidade (nomeCidade, codEstado) values("Almeirim", "14");
insert into tblCidade (nomeCidade, codEstado) values("Altamira", "14");
insert into tblCidade (nomeCidade, codEstado) values("Anajás", "14");
insert into tblCidade (nomeCidade, codEstado) values("Ananindeua", "14");
insert into tblCidade (nomeCidade, codEstado) values("Anapu", "14");
insert into tblCidade (nomeCidade, codEstado) values("Augusto Corrêa", "14");
insert into tblCidade (nomeCidade, codEstado) values("Aurora do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Aveiro", "14");
insert into tblCidade (nomeCidade, codEstado) values("Bagre", "14");
insert into tblCidade (nomeCidade, codEstado) values("Baião", "14");
insert into tblCidade (nomeCidade, codEstado) values("Bannach", "14");
insert into tblCidade (nomeCidade, codEstado) values("Barcarena", "14");
insert into tblCidade (nomeCidade, codEstado) values("Belém", "14");
insert into tblCidade (nomeCidade, codEstado) values("Belterra", "14");
insert into tblCidade (nomeCidade, codEstado) values("Benevides", "14");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Tocantins", "14");
insert into tblCidade (nomeCidade, codEstado) values("Bonito", "14");
insert into tblCidade (nomeCidade, codEstado) values("Bragança", "14");
insert into tblCidade (nomeCidade, codEstado) values("Brasil Novo", "14");
insert into tblCidade (nomeCidade, codEstado) values("Brejo Grande do Araguaia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Breu Branco", "14");
insert into tblCidade (nomeCidade, codEstado) values("Breves", "14");
insert into tblCidade (nomeCidade, codEstado) values("Bujaru", "14");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira do Arari", "14");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira do Piriá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Cametá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Canaã dos Carajás", "14");
insert into tblCidade (nomeCidade, codEstado) values("Capanema", "14");
insert into tblCidade (nomeCidade, codEstado) values("Capitão Poço", "14");
insert into tblCidade (nomeCidade, codEstado) values("Castanhal", "14");
insert into tblCidade (nomeCidade, codEstado) values("Chaves", "14");
insert into tblCidade (nomeCidade, codEstado) values("Colares", "14");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Araguaia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Concórdia do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Cumaru do Norte", "14");
insert into tblCidade (nomeCidade, codEstado) values("Curionópolis", "14");
insert into tblCidade (nomeCidade, codEstado) values("Curralinho", "14");
insert into tblCidade (nomeCidade, codEstado) values("Curuá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Curuçá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Dom Eliseu", "14");
insert into tblCidade (nomeCidade, codEstado) values("Eldorado dos Carajás", "14");
insert into tblCidade (nomeCidade, codEstado) values("Faro", "14");
insert into tblCidade (nomeCidade, codEstado) values("Floresta do Araguaia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Garrafão do Norte", "14");
insert into tblCidade (nomeCidade, codEstado) values("Goianésia do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Gurupá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Igarapé-Açu", "14");
insert into tblCidade (nomeCidade, codEstado) values("Igarapé-Miri", "14");
insert into tblCidade (nomeCidade, codEstado) values("Inhangapi", "14");
insert into tblCidade (nomeCidade, codEstado) values("Ipixuna do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Irituia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Itaituba", "14");
insert into tblCidade (nomeCidade, codEstado) values("Itupiranga", "14");
insert into tblCidade (nomeCidade, codEstado) values("Jacareacanga", "14");
insert into tblCidade (nomeCidade, codEstado) values("Jacundá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Juruti", "14");
insert into tblCidade (nomeCidade, codEstado) values("Limoeiro do Ajuru", "14");
insert into tblCidade (nomeCidade, codEstado) values("Mãe do Rio", "14");
insert into tblCidade (nomeCidade, codEstado) values("Magalhães Barata", "14");
insert into tblCidade (nomeCidade, codEstado) values("Marabá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Maracanã", "14");
insert into tblCidade (nomeCidade, codEstado) values("Marapanim", "14");
insert into tblCidade (nomeCidade, codEstado) values("Marituba", "14");
insert into tblCidade (nomeCidade, codEstado) values("Medicilândia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Melgaço", "14");
insert into tblCidade (nomeCidade, codEstado) values("Mocajuba", "14");
insert into tblCidade (nomeCidade, codEstado) values("Moju", "14");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alegre", "14");
insert into tblCidade (nomeCidade, codEstado) values("Muaná", "14");
insert into tblCidade (nomeCidade, codEstado) values("Nova Esperança do Piriá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Nova Ipixuna", "14");
insert into tblCidade (nomeCidade, codEstado) values("Nova Timboteua", "14");
insert into tblCidade (nomeCidade, codEstado) values("Novo Progresso", "14");
insert into tblCidade (nomeCidade, codEstado) values("Novo Repartimento", "14");
insert into tblCidade (nomeCidade, codEstado) values("Óbidos", "14");
insert into tblCidade (nomeCidade, codEstado) values("Oeiras do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Oriximiná", "14");
insert into tblCidade (nomeCidade, codEstado) values("Ourém", "14");
insert into tblCidade (nomeCidade, codEstado) values("Ourilândia do Norte", "14");
insert into tblCidade (nomeCidade, codEstado) values("Pacajá", "14");
insert into tblCidade (nomeCidade, codEstado) values("Palestina do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Paragominas", "14");
insert into tblCidade (nomeCidade, codEstado) values("Parauapebas", "14");
insert into tblCidade (nomeCidade, codEstado) values("Pau D'Arco", "14");
insert into tblCidade (nomeCidade, codEstado) values("Peixe-Boi", "14");
insert into tblCidade (nomeCidade, codEstado) values("Piçarra", "14");
insert into tblCidade (nomeCidade, codEstado) values("Placas", "14");
insert into tblCidade (nomeCidade, codEstado) values("Ponta de Pedras", "14");
insert into tblCidade (nomeCidade, codEstado) values("Portel", "14");
insert into tblCidade (nomeCidade, codEstado) values("Porto de Moz", "14");
insert into tblCidade (nomeCidade, codEstado) values("Prainha", "14");
insert into tblCidade (nomeCidade, codEstado) values("Primavera", "14");
insert into tblCidade (nomeCidade, codEstado) values("Quatipuru", "14");
insert into tblCidade (nomeCidade, codEstado) values("Redenção", "14");
insert into tblCidade (nomeCidade, codEstado) values("Rio Maria", "14");
insert into tblCidade (nomeCidade, codEstado) values("Rondon do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Rurópolis", "14");
insert into tblCidade (nomeCidade, codEstado) values("Salinópolis", "14");
insert into tblCidade (nomeCidade, codEstado) values("Salvaterra", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz do Arari", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santa Isabel do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria das Barreiras", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Araguaia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santarém", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santarém Novo", "14");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Tauá", "14");
insert into tblCidade (nomeCidade, codEstado) values("São Caetano de Odivelas", "14");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos do Araguaia", "14");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos do Capim", "14");
insert into tblCidade (nomeCidade, codEstado) values("São Félix do Xingu", "14");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Pará", "14");
insert into tblCidade (nomeCidade, codEstado) values("São Geraldo do Araguaia", "14");
insert into tblCidade (nomeCidade, codEstado) values("São João da Ponta", "14");
insert into tblCidade (nomeCidade, codEstado) values("São João de Pirabas", "14");
insert into tblCidade (nomeCidade, codEstado) values("São João do Araguaia", "14");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Guamá", "14");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião da Boa Vista", "14");
insert into tblCidade (nomeCidade, codEstado) values("Sapucaia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Senador José Porfírio", "14");
insert into tblCidade (nomeCidade, codEstado) values("Soure", "14");
insert into tblCidade (nomeCidade, codEstado) values("Tailândia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Terra Alta", "14");
insert into tblCidade (nomeCidade, codEstado) values("Terra Santa", "14");
insert into tblCidade (nomeCidade, codEstado) values("Tomé-Açu", "14");
insert into tblCidade (nomeCidade, codEstado) values("Tracuateua", "14");
insert into tblCidade (nomeCidade, codEstado) values("Trairão", "14");
insert into tblCidade (nomeCidade, codEstado) values("Tucumã", "14");
insert into tblCidade (nomeCidade, codEstado) values("Tucuruí", "14");
insert into tblCidade (nomeCidade, codEstado) values("Ulianópolis", "14");
insert into tblCidade (nomeCidade, codEstado) values("Uruará", "14");
insert into tblCidade (nomeCidade, codEstado) values("Vigia", "14");
insert into tblCidade (nomeCidade, codEstado) values("Viseu", "14");
insert into tblCidade (nomeCidade, codEstado) values("Vitória do Xingu", "14");
insert into tblCidade (nomeCidade, codEstado) values("Xinguara", "14");
insert into tblCidade (nomeCidade, codEstado) values("Amapá", "4");
insert into tblCidade (nomeCidade, codEstado) values("Calçoene", "4");
insert into tblCidade (nomeCidade, codEstado) values("Cutias", "4");
insert into tblCidade (nomeCidade, codEstado) values("Ferreira Gomes", "4");
insert into tblCidade (nomeCidade, codEstado) values("Itaubal", "4");
insert into tblCidade (nomeCidade, codEstado) values("Laranjal do Jari", "4");
insert into tblCidade (nomeCidade, codEstado) values("Macapá", "4");
insert into tblCidade (nomeCidade, codEstado) values("Mazagão", "4");
insert into tblCidade (nomeCidade, codEstado) values("Oiapoque", "4");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Branca do Amapari", "4");
insert into tblCidade (nomeCidade, codEstado) values("Porto Grande", "4");
insert into tblCidade (nomeCidade, codEstado) values("Pracuúba", "4");
insert into tblCidade (nomeCidade, codEstado) values("Santana", "4");
insert into tblCidade (nomeCidade, codEstado) values("Serra do Navio", "4");
insert into tblCidade (nomeCidade, codEstado) values("Tartarugalzinho", "4");
insert into tblCidade (nomeCidade, codEstado) values("Vitória do Jari", "4");
insert into tblCidade (nomeCidade, codEstado) values("Abreulândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Aguiarnópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Aliança do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Almas", "27");
insert into tblCidade (nomeCidade, codEstado) values("Alvorada", "27");
insert into tblCidade (nomeCidade, codEstado) values("Ananás", "27");
insert into tblCidade (nomeCidade, codEstado) values("Angico", "27");
insert into tblCidade (nomeCidade, codEstado) values("Aparecida do Rio Negro", "27");
insert into tblCidade (nomeCidade, codEstado) values("Aragominas", "27");
insert into tblCidade (nomeCidade, codEstado) values("Araguacema", "27");
insert into tblCidade (nomeCidade, codEstado) values("Araguaçu", "27");
insert into tblCidade (nomeCidade, codEstado) values("Araguaína", "27");
insert into tblCidade (nomeCidade, codEstado) values("Araguanã", "27");
insert into tblCidade (nomeCidade, codEstado) values("Araguatins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Arapoema", "27");
insert into tblCidade (nomeCidade, codEstado) values("Arraias", "27");
insert into tblCidade (nomeCidade, codEstado) values("Augustinópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Aurora do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Axixá do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Babaçulândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Bandeirantes do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Ouro", "27");
insert into tblCidade (nomeCidade, codEstado) values("Barrolândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Bernardo Sayão", "27");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Brasilândia do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Brejinho de Nazaré", "27");
insert into tblCidade (nomeCidade, codEstado) values("Buriti do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeirinha", "27");
insert into tblCidade (nomeCidade, codEstado) values("Campos Lindos", "27");
insert into tblCidade (nomeCidade, codEstado) values("Cariri do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Carmolândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Carrasco Bonito", "27");
insert into tblCidade (nomeCidade, codEstado) values("Caseara", "27");
insert into tblCidade (nomeCidade, codEstado) values("Centenário", "27");
insert into tblCidade (nomeCidade, codEstado) values("Chapada da Natividade", "27");
insert into tblCidade (nomeCidade, codEstado) values("Chapada de Areia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Colinas do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Colméia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Combinado", "27");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Couto Magalhães", "27");
insert into tblCidade (nomeCidade, codEstado) values("Cristalândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Crixás do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Darcinópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Dianópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Divinópolis do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Dois Irmãos do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Dueré", "27");
insert into tblCidade (nomeCidade, codEstado) values("Esperantina", "27");
insert into tblCidade (nomeCidade, codEstado) values("Fátima", "27");
insert into tblCidade (nomeCidade, codEstado) values("Figueirópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Filadélfia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Formoso do Araguaia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Fortaleza do Tabocão", "27");
insert into tblCidade (nomeCidade, codEstado) values("Goianorte", "27");
insert into tblCidade (nomeCidade, codEstado) values("Goiatins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Guaraí", "27");
insert into tblCidade (nomeCidade, codEstado) values("Gurupi", "27");
insert into tblCidade (nomeCidade, codEstado) values("Ipueiras", "27");
insert into tblCidade (nomeCidade, codEstado) values("Itacajá", "27");
insert into tblCidade (nomeCidade, codEstado) values("Itaguatins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Itapiratins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Itaporã do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Jaú do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Juarina", "27");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa da Confusão", "27");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Lajeado", "27");
insert into tblCidade (nomeCidade, codEstado) values("Lavandeira", "27");
insert into tblCidade (nomeCidade, codEstado) values("Lizarda", "27");
insert into tblCidade (nomeCidade, codEstado) values("Luzinópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Marianópolis do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Mateiros", "27");
insert into tblCidade (nomeCidade, codEstado) values("Maurilândia do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Miracema do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Miranorte", "27");
insert into tblCidade (nomeCidade, codEstado) values("Monte do Carmo", "27");
insert into tblCidade (nomeCidade, codEstado) values("Monte Santo do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Muricilândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Natividade", "27");
insert into tblCidade (nomeCidade, codEstado) values("Nazaré", "27");
insert into tblCidade (nomeCidade, codEstado) values("Nova Olinda", "27");
insert into tblCidade (nomeCidade, codEstado) values("Nova Rosalândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Novo Acordo", "27");
insert into tblCidade (nomeCidade, codEstado) values("Novo Alegre", "27");
insert into tblCidade (nomeCidade, codEstado) values("Novo Jardim", "27");
insert into tblCidade (nomeCidade, codEstado) values("Oliveira de Fátima", "27");
insert into tblCidade (nomeCidade, codEstado) values("Palmas", "27");
insert into tblCidade (nomeCidade, codEstado) values("Palmeirante", "27");
insert into tblCidade (nomeCidade, codEstado) values("Palmeiras do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Palmeirópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Paraíso do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Paranã", "27");
insert into tblCidade (nomeCidade, codEstado) values("Pau D'Arco", "27");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Afonso", "27");
insert into tblCidade (nomeCidade, codEstado) values("Peixe", "27");
insert into tblCidade (nomeCidade, codEstado) values("Pequizeiro", "27");
insert into tblCidade (nomeCidade, codEstado) values("Pindorama do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Piraquê", "27");
insert into tblCidade (nomeCidade, codEstado) values("Pium", "27");
insert into tblCidade (nomeCidade, codEstado) values("Ponte Alta do Bom Jesus", "27");
insert into tblCidade (nomeCidade, codEstado) values("Ponte Alta do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Porto Alegre do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Porto Nacional", "27");
insert into tblCidade (nomeCidade, codEstado) values("Praia Norte", "27");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Kennedy", "27");
insert into tblCidade (nomeCidade, codEstado) values("Pugmil", "27");
insert into tblCidade (nomeCidade, codEstado) values("Recursolândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Riachinho", "27");
insert into tblCidade (nomeCidade, codEstado) values("Rio da Conceição", "27");
insert into tblCidade (nomeCidade, codEstado) values("Rio dos Bois", "27");
insert into tblCidade (nomeCidade, codEstado) values("Rio Sono", "27");
insert into tblCidade (nomeCidade, codEstado) values("Sampaio", "27");
insert into tblCidade (nomeCidade, codEstado) values("Sandolândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Santa Fé do Araguaia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Santa Tereza do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Santa Terezinha do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("São Bento do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("São Félix do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("São Salvador do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("São Valério", "27");
insert into tblCidade (nomeCidade, codEstado) values("Silvanópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Sítio Novo do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Sucupira", "27");
insert into tblCidade (nomeCidade, codEstado) values("Taguatinga", "27");
insert into tblCidade (nomeCidade, codEstado) values("Taipas do Tocantins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Talismã", "27");
insert into tblCidade (nomeCidade, codEstado) values("Tocantínia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Tocantinópolis", "27");
insert into tblCidade (nomeCidade, codEstado) values("Tupirama", "27");
insert into tblCidade (nomeCidade, codEstado) values("Tupiratins", "27");
insert into tblCidade (nomeCidade, codEstado) values("Wanderlândia", "27");
insert into tblCidade (nomeCidade, codEstado) values("Xambioá", "27");
insert into tblCidade (nomeCidade, codEstado) values("Açailândia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Afonso Cunha", "10");
insert into tblCidade (nomeCidade, codEstado) values("Água Doce do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Alcântara", "10");
insert into tblCidade (nomeCidade, codEstado) values("Aldeias Altas", "10");
insert into tblCidade (nomeCidade, codEstado) values("Altamira do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Alto Alegre do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Alto Alegre do Pindaré", "10");
insert into tblCidade (nomeCidade, codEstado) values("Alto Parnaíba", "10");
insert into tblCidade (nomeCidade, codEstado) values("Amapá do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Amarante do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Anajatuba", "10");
insert into tblCidade (nomeCidade, codEstado) values("Anapurus", "10");
insert into tblCidade (nomeCidade, codEstado) values("Apicum-Açu", "10");
insert into tblCidade (nomeCidade, codEstado) values("Araguanã", "10");
insert into tblCidade (nomeCidade, codEstado) values("Araioses", "10");
insert into tblCidade (nomeCidade, codEstado) values("Arame", "10");
insert into tblCidade (nomeCidade, codEstado) values("Arari", "10");
insert into tblCidade (nomeCidade, codEstado) values("Axixá", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bacabal", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bacabeira", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bacuri", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bacurituba", "10");
insert into tblCidade (nomeCidade, codEstado) values("Balsas", "10");
insert into tblCidade (nomeCidade, codEstado) values("Barão de Grajaú", "10");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Corda", "10");
insert into tblCidade (nomeCidade, codEstado) values("Barreirinhas", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bela Vista do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Belágua", "10");
insert into tblCidade (nomeCidade, codEstado) values("Benedito Leite", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bequimão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bernardo do Mearim", "10");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista do Gurupi", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jardim", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus das Selvas", "10");
insert into tblCidade (nomeCidade, codEstado) values("Bom Lugar", "10");
insert into tblCidade (nomeCidade, codEstado) values("Brejo", "10");
insert into tblCidade (nomeCidade, codEstado) values("Brejo de Areia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Buriti", "10");
insert into tblCidade (nomeCidade, codEstado) values("Buriti Bravo", "10");
insert into tblCidade (nomeCidade, codEstado) values("Buriticupu", "10");
insert into tblCidade (nomeCidade, codEstado) values("Buritirana", "10");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira Grande", "10");
insert into tblCidade (nomeCidade, codEstado) values("Cajapió", "10");
insert into tblCidade (nomeCidade, codEstado) values("Cajari", "10");
insert into tblCidade (nomeCidade, codEstado) values("Campestre do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Cândido Mendes", "10");
insert into tblCidade (nomeCidade, codEstado) values("Cantanhede", "10");
insert into tblCidade (nomeCidade, codEstado) values("Capinzal do Norte", "10");
insert into tblCidade (nomeCidade, codEstado) values("Carolina", "10");
insert into tblCidade (nomeCidade, codEstado) values("Carutapera", "10");
insert into tblCidade (nomeCidade, codEstado) values("Caxias", "10");
insert into tblCidade (nomeCidade, codEstado) values("Cedral", "10");
insert into tblCidade (nomeCidade, codEstado) values("Central do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Centro do Guilherme", "10");
insert into tblCidade (nomeCidade, codEstado) values("Centro Novo do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Chapadinha", "10");
insert into tblCidade (nomeCidade, codEstado) values("Cidelândia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Codó", "10");
insert into tblCidade (nomeCidade, codEstado) values("Coelho Neto", "10");
insert into tblCidade (nomeCidade, codEstado) values("Colinas", "10");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Lago-Açu", "10");
insert into tblCidade (nomeCidade, codEstado) values("Coroatá", "10");
insert into tblCidade (nomeCidade, codEstado) values("Cururupu", "10");
insert into tblCidade (nomeCidade, codEstado) values("Davinópolis", "10");
insert into tblCidade (nomeCidade, codEstado) values("Dom Pedro", "10");
insert into tblCidade (nomeCidade, codEstado) values("Duque Bacelar", "10");
insert into tblCidade (nomeCidade, codEstado) values("Esperantinópolis", "10");
insert into tblCidade (nomeCidade, codEstado) values("Estreito", "10");
insert into tblCidade (nomeCidade, codEstado) values("Feira Nova do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Fernando Falcão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Formosa da Serra Negra", "10");
insert into tblCidade (nomeCidade, codEstado) values("Fortaleza dos Nogueiras", "10");
insert into tblCidade (nomeCidade, codEstado) values("Fortuna", "10");
insert into tblCidade (nomeCidade, codEstado) values("Godofredo Viana", "10");
insert into tblCidade (nomeCidade, codEstado) values("Gonçalves Dias", "10");
insert into tblCidade (nomeCidade, codEstado) values("Governador Archer", "10");
insert into tblCidade (nomeCidade, codEstado) values("Governador Edison Lobão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Governador Eugênio Barros", "10");
insert into tblCidade (nomeCidade, codEstado) values("Governador Luiz Rocha", "10");
insert into tblCidade (nomeCidade, codEstado) values("Governador Newton Bello", "10");
insert into tblCidade (nomeCidade, codEstado) values("Governador Nunes Freire", "10");
insert into tblCidade (nomeCidade, codEstado) values("Graça Aranha", "10");
insert into tblCidade (nomeCidade, codEstado) values("Grajaú", "10");
insert into tblCidade (nomeCidade, codEstado) values("Guimarães", "10");
insert into tblCidade (nomeCidade, codEstado) values("Humberto de Campos", "10");
insert into tblCidade (nomeCidade, codEstado) values("Icatu", "10");
insert into tblCidade (nomeCidade, codEstado) values("Igarapé do Meio", "10");
insert into tblCidade (nomeCidade, codEstado) values("Igarapé Grande", "10");
insert into tblCidade (nomeCidade, codEstado) values("Imperatriz", "10");
insert into tblCidade (nomeCidade, codEstado) values("Itaipava do Grajaú", "10");
insert into tblCidade (nomeCidade, codEstado) values("Itapecuru Mirim", "10");
insert into tblCidade (nomeCidade, codEstado) values("Itinga do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Jatobá", "10");
insert into tblCidade (nomeCidade, codEstado) values("Jenipapo dos Vieiras", "10");
insert into tblCidade (nomeCidade, codEstado) values("João Lisboa", "10");
insert into tblCidade (nomeCidade, codEstado) values("Joselândia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Junco do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Lago da Pedra", "10");
insert into tblCidade (nomeCidade, codEstado) values("Lago do Junco", "10");
insert into tblCidade (nomeCidade, codEstado) values("Lago dos Rodrigues", "10");
insert into tblCidade (nomeCidade, codEstado) values("Lago Verde", "10");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa do Mato", "10");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Grande do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Lajeado Novo", "10");
insert into tblCidade (nomeCidade, codEstado) values("Lima Campos", "10");
insert into tblCidade (nomeCidade, codEstado) values("Loreto", "10");
insert into tblCidade (nomeCidade, codEstado) values("Luís Domingues", "10");
insert into tblCidade (nomeCidade, codEstado) values("Magalhães de Almeida", "10");
insert into tblCidade (nomeCidade, codEstado) values("Maracaçumé", "10");
insert into tblCidade (nomeCidade, codEstado) values("Marajá do Sena", "10");
insert into tblCidade (nomeCidade, codEstado) values("Maranhãozinho", "10");
insert into tblCidade (nomeCidade, codEstado) values("Mata Roma", "10");
insert into tblCidade (nomeCidade, codEstado) values("Matinha", "10");
insert into tblCidade (nomeCidade, codEstado) values("Matões", "10");
insert into tblCidade (nomeCidade, codEstado) values("Matões do Norte", "10");
insert into tblCidade (nomeCidade, codEstado) values("Milagres do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Mirador", "10");
insert into tblCidade (nomeCidade, codEstado) values("Miranda do Norte", "10");
insert into tblCidade (nomeCidade, codEstado) values("Mirinzal", "10");
insert into tblCidade (nomeCidade, codEstado) values("Monção", "10");
insert into tblCidade (nomeCidade, codEstado) values("Montes Altos", "10");
insert into tblCidade (nomeCidade, codEstado) values("Morros", "10");
insert into tblCidade (nomeCidade, codEstado) values("Nina Rodrigues", "10");
insert into tblCidade (nomeCidade, codEstado) values("Nova Colinas", "10");
insert into tblCidade (nomeCidade, codEstado) values("Nova Iorque", "10");
insert into tblCidade (nomeCidade, codEstado) values("Nova Olinda do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Olho d'Água das Cunhãs", "10");
insert into tblCidade (nomeCidade, codEstado) values("Olinda Nova do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Paço do Lumiar", "10");
insert into tblCidade (nomeCidade, codEstado) values("Palmeirândia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Paraibano", "10");
insert into tblCidade (nomeCidade, codEstado) values("Parnarama", "10");
insert into tblCidade (nomeCidade, codEstado) values("Passagem Franca", "10");
insert into tblCidade (nomeCidade, codEstado) values("Pastos Bons", "10");
insert into tblCidade (nomeCidade, codEstado) values("Paulino Neves", "10");
insert into tblCidade (nomeCidade, codEstado) values("Paulo Ramos", "10");
insert into tblCidade (nomeCidade, codEstado) values("Pedreiras", "10");
insert into tblCidade (nomeCidade, codEstado) values("Pedro do Rosário", "10");
insert into tblCidade (nomeCidade, codEstado) values("Penalva", "10");
insert into tblCidade (nomeCidade, codEstado) values("Peri Mirim", "10");
insert into tblCidade (nomeCidade, codEstado) values("Peritoró", "10");
insert into tblCidade (nomeCidade, codEstado) values("Pindaré-Mirim", "10");
insert into tblCidade (nomeCidade, codEstado) values("Pinheiro", "10");
insert into tblCidade (nomeCidade, codEstado) values("Pio XII", "10");
insert into tblCidade (nomeCidade, codEstado) values("Pirapemas", "10");
insert into tblCidade (nomeCidade, codEstado) values("Poção de Pedras", "10");
insert into tblCidade (nomeCidade, codEstado) values("Porto Franco", "10");
insert into tblCidade (nomeCidade, codEstado) values("Porto Rico do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Dutra", "10");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Juscelino", "10");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Médici", "10");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Sarney", "10");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Vargas", "10");
insert into tblCidade (nomeCidade, codEstado) values("Primeira Cruz", "10");
insert into tblCidade (nomeCidade, codEstado) values("Raposa", "10");
insert into tblCidade (nomeCidade, codEstado) values("Riachão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Ribamar Fiquene", "10");
insert into tblCidade (nomeCidade, codEstado) values("Rosário", "10");
insert into tblCidade (nomeCidade, codEstado) values("Sambaíba", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santa Filomena do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santa Helena", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santa Inês", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia do Paruá", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santa Quitéria do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santo Amaro do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio dos Lopes", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Benedito do Rio Preto", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Bento", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Bernardo", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos do Azeitão", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Félix de Balsas", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Brejão", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("São João Batista", "10");
insert into tblCidade (nomeCidade, codEstado) values("São João do Carú", "10");
insert into tblCidade (nomeCidade, codEstado) values("São João do Paraíso", "10");
insert into tblCidade (nomeCidade, codEstado) values("São João do Soter", "10");
insert into tblCidade (nomeCidade, codEstado) values("São João dos Patos", "10");
insert into tblCidade (nomeCidade, codEstado) values("São José de Ribamar", "10");
insert into tblCidade (nomeCidade, codEstado) values("São José dos Basílios", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Luís", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Luís Gonzaga do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Mateus do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro da Água Branca", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro dos Crentes", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Raimundo das Mangabeiras", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Raimundo do Doca Bezerra", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Roberto", "10");
insert into tblCidade (nomeCidade, codEstado) values("São Vicente Ferrer", "10");
insert into tblCidade (nomeCidade, codEstado) values("Satubinha", "10");
insert into tblCidade (nomeCidade, codEstado) values("Senador Alexandre Costa", "10");
insert into tblCidade (nomeCidade, codEstado) values("Senador La Rocque", "10");
insert into tblCidade (nomeCidade, codEstado) values("Serrano do Maranhão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Sítio Novo", "10");
insert into tblCidade (nomeCidade, codEstado) values("Sucupira do Norte", "10");
insert into tblCidade (nomeCidade, codEstado) values("Sucupira do Riachão", "10");
insert into tblCidade (nomeCidade, codEstado) values("Tasso Fragoso", "10");
insert into tblCidade (nomeCidade, codEstado) values("Timbiras", "10");
insert into tblCidade (nomeCidade, codEstado) values("Timon", "10");
insert into tblCidade (nomeCidade, codEstado) values("Trizidela do Vale", "10");
insert into tblCidade (nomeCidade, codEstado) values("Tufilândia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Tuntum", "10");
insert into tblCidade (nomeCidade, codEstado) values("Turiaçu", "10");
insert into tblCidade (nomeCidade, codEstado) values("Turilândia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Tutóia", "10");
insert into tblCidade (nomeCidade, codEstado) values("Urbano Santos", "10");
insert into tblCidade (nomeCidade, codEstado) values("Vargem Grande", "10");
insert into tblCidade (nomeCidade, codEstado) values("Viana", "10");
insert into tblCidade (nomeCidade, codEstado) values("Vila Nova dos Martírios", "10");
insert into tblCidade (nomeCidade, codEstado) values("Vitória do Mearim", "10");
insert into tblCidade (nomeCidade, codEstado) values("Vitorino Freire", "10");
insert into tblCidade (nomeCidade, codEstado) values("Zé Doca", "10");
insert into tblCidade (nomeCidade, codEstado) values("Acauã", "17");
insert into tblCidade (nomeCidade, codEstado) values("Agricolândia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Água Branca", "17");
insert into tblCidade (nomeCidade, codEstado) values("Alagoinha do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Alegrete do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Alto Longá", "17");
insert into tblCidade (nomeCidade, codEstado) values("Altos", "17");
insert into tblCidade (nomeCidade, codEstado) values("Alvorada do Gurguéia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Amarante", "17");
insert into tblCidade (nomeCidade, codEstado) values("Angical do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Anísio de Abreu", "17");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Almeida", "17");
insert into tblCidade (nomeCidade, codEstado) values("Aroazes", "17");
insert into tblCidade (nomeCidade, codEstado) values("Aroeiras do Itaim", "17");
insert into tblCidade (nomeCidade, codEstado) values("Arraial", "17");
insert into tblCidade (nomeCidade, codEstado) values("Assunção do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Avelino Lopes", "17");
insert into tblCidade (nomeCidade, codEstado) values("Baixa Grande do Ribeiro", "17");
insert into tblCidade (nomeCidade, codEstado) values("Barra D'Alcântara", "17");
insert into tblCidade (nomeCidade, codEstado) values("Barras", "17");
insert into tblCidade (nomeCidade, codEstado) values("Barreiras do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Barro Duro", "17");
insert into tblCidade (nomeCidade, codEstado) values("Batalha", "17");
insert into tblCidade (nomeCidade, codEstado) values("Bela Vista do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Belém do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Beneditinos", "17");
insert into tblCidade (nomeCidade, codEstado) values("Bertolínia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Betânia do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Boa Hora", "17");
insert into tblCidade (nomeCidade, codEstado) values("Bocaina", "17");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus", "17");
insert into tblCidade (nomeCidade, codEstado) values("Bom Princípio do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Bonfim do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Boqueirão do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Brasileira", "17");
insert into tblCidade (nomeCidade, codEstado) values("Brejo do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Buriti dos Lopes", "17");
insert into tblCidade (nomeCidade, codEstado) values("Buriti dos Montes", "17");
insert into tblCidade (nomeCidade, codEstado) values("Cabeceiras do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Cajazeiras do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Cajueiro da Praia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Caldeirão Grande do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Campinas do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Campo Alegre do Fidalgo", "17");
insert into tblCidade (nomeCidade, codEstado) values("Campo Grande do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Campo Largo do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Campo Maior", "17");
insert into tblCidade (nomeCidade, codEstado) values("Canavieira", "17");
insert into tblCidade (nomeCidade, codEstado) values("Canto do Buriti", "17");
insert into tblCidade (nomeCidade, codEstado) values("Capitão de Campos", "17");
insert into tblCidade (nomeCidade, codEstado) values("Capitão Gervásio Oliveira", "17");
insert into tblCidade (nomeCidade, codEstado) values("Caracol", "17");
insert into tblCidade (nomeCidade, codEstado) values("Caraúbas do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Caridade do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Castelo do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Caxingó", "17");
insert into tblCidade (nomeCidade, codEstado) values("Cocal", "17");
insert into tblCidade (nomeCidade, codEstado) values("Cocal de Telha", "17");
insert into tblCidade (nomeCidade, codEstado) values("Cocal dos Alves", "17");
insert into tblCidade (nomeCidade, codEstado) values("Coivaras", "17");
insert into tblCidade (nomeCidade, codEstado) values("Colônia do Gurguéia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Colônia do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Canindé", "17");
insert into tblCidade (nomeCidade, codEstado) values("Coronel José Dias", "17");
insert into tblCidade (nomeCidade, codEstado) values("Corrente", "17");
insert into tblCidade (nomeCidade, codEstado) values("Cristalândia do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Cristino Castro", "17");
insert into tblCidade (nomeCidade, codEstado) values("Curimatá", "17");
insert into tblCidade (nomeCidade, codEstado) values("Currais", "17");
insert into tblCidade (nomeCidade, codEstado) values("Curral Novo do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Curralinhos", "17");
insert into tblCidade (nomeCidade, codEstado) values("Demerval Lobão", "17");
insert into tblCidade (nomeCidade, codEstado) values("Dirceu Arcoverde", "17");
insert into tblCidade (nomeCidade, codEstado) values("Dom Expedito Lopes", "17");
insert into tblCidade (nomeCidade, codEstado) values("Dom Inocêncio", "17");
insert into tblCidade (nomeCidade, codEstado) values("Domingos Mourão", "17");
insert into tblCidade (nomeCidade, codEstado) values("Elesbão Veloso", "17");
insert into tblCidade (nomeCidade, codEstado) values("Eliseu Martins", "17");
insert into tblCidade (nomeCidade, codEstado) values("Esperantina", "17");
insert into tblCidade (nomeCidade, codEstado) values("Fartura do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Flores do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Floresta do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Floriano", "17");
insert into tblCidade (nomeCidade, codEstado) values("Francinópolis", "17");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Ayres", "17");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Macedo", "17");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Santos", "17");
insert into tblCidade (nomeCidade, codEstado) values("Fronteiras", "17");
insert into tblCidade (nomeCidade, codEstado) values("Geminiano", "17");
insert into tblCidade (nomeCidade, codEstado) values("Gilbués", "17");
insert into tblCidade (nomeCidade, codEstado) values("Guadalupe", "17");
insert into tblCidade (nomeCidade, codEstado) values("Guaribas", "17");
insert into tblCidade (nomeCidade, codEstado) values("Hugo Napoleão", "17");
insert into tblCidade (nomeCidade, codEstado) values("Ilha Grande", "17");
insert into tblCidade (nomeCidade, codEstado) values("Inhuma", "17");
insert into tblCidade (nomeCidade, codEstado) values("Ipiranga do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Isaías Coelho", "17");
insert into tblCidade (nomeCidade, codEstado) values("Itainópolis", "17");
insert into tblCidade (nomeCidade, codEstado) values("Itaueira", "17");
insert into tblCidade (nomeCidade, codEstado) values("Jacobina do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Jaicós", "17");
insert into tblCidade (nomeCidade, codEstado) values("Jardim do Mulato", "17");
insert into tblCidade (nomeCidade, codEstado) values("Jatobá do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Jerumenha", "17");
insert into tblCidade (nomeCidade, codEstado) values("João Costa", "17");
insert into tblCidade (nomeCidade, codEstado) values("Joaquim Pires", "17");
insert into tblCidade (nomeCidade, codEstado) values("Joca Marques", "17");
insert into tblCidade (nomeCidade, codEstado) values("José de Freitas", "17");
insert into tblCidade (nomeCidade, codEstado) values("Juazeiro do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Júlio Borges", "17");
insert into tblCidade (nomeCidade, codEstado) values("Jurema", "17");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Alegre", "17");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa de São Francisco", "17");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa do Barro do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa do Sítio", "17");
insert into tblCidade (nomeCidade, codEstado) values("Lagoinha do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Landri Sales", "17");
insert into tblCidade (nomeCidade, codEstado) values("Luís Correia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Luzilândia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Madeiro", "17");
insert into tblCidade (nomeCidade, codEstado) values("Manoel Emídio", "17");
insert into tblCidade (nomeCidade, codEstado) values("Marcolândia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Marcos Parente", "17");
insert into tblCidade (nomeCidade, codEstado) values("Massapê do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Matias Olímpio", "17");
insert into tblCidade (nomeCidade, codEstado) values("Miguel Alves", "17");
insert into tblCidade (nomeCidade, codEstado) values("Miguel Leão", "17");
insert into tblCidade (nomeCidade, codEstado) values("Milton Brandão", "17");
insert into tblCidade (nomeCidade, codEstado) values("Monsenhor Gil", "17");
insert into tblCidade (nomeCidade, codEstado) values("Monsenhor Hipólito", "17");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alegre do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Morro Cabeça no Tempo", "17");
insert into tblCidade (nomeCidade, codEstado) values("Morro do Chapéu do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Murici dos Portelas", "17");
insert into tblCidade (nomeCidade, codEstado) values("Nazaré do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Nazária ", "17");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora de Nazaré", "17");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora dos Remédios", "17");
insert into tblCidade (nomeCidade, codEstado) values("Nova Santa Rita", "17");
insert into tblCidade (nomeCidade, codEstado) values("Novo Oriente do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Novo Santo Antônio", "17");
insert into tblCidade (nomeCidade, codEstado) values("Oeiras", "17");
insert into tblCidade (nomeCidade, codEstado) values("Olho D'Água do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Padre Marcos", "17");
insert into tblCidade (nomeCidade, codEstado) values("Paes Landim", "17");
insert into tblCidade (nomeCidade, codEstado) values("Pajeú do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Palmeira do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Palmeirais", "17");
insert into tblCidade (nomeCidade, codEstado) values("Paquetá", "17");
insert into tblCidade (nomeCidade, codEstado) values("Parnaguá", "17");
insert into tblCidade (nomeCidade, codEstado) values("Parnaíba", "17");
insert into tblCidade (nomeCidade, codEstado) values("Passagem Franca do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Patos do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Pau D'Arco do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Paulistana", "17");
insert into tblCidade (nomeCidade, codEstado) values("Pavussu", "17");
insert into tblCidade (nomeCidade, codEstado) values("Pedro II", "17");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Laurentino", "17");
insert into tblCidade (nomeCidade, codEstado) values("Picos", "17");
insert into tblCidade (nomeCidade, codEstado) values("Pimenteiras", "17");
insert into tblCidade (nomeCidade, codEstado) values("Pio IX", "17");
insert into tblCidade (nomeCidade, codEstado) values("Piracuruca", "17");
insert into tblCidade (nomeCidade, codEstado) values("Piripiri", "17");
insert into tblCidade (nomeCidade, codEstado) values("Porto", "17");
insert into tblCidade (nomeCidade, codEstado) values("Porto Alegre do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Prata do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Queimada Nova", "17");
insert into tblCidade (nomeCidade, codEstado) values("Redenção do Gurguéia", "17");
insert into tblCidade (nomeCidade, codEstado) values("Regeneração", "17");
insert into tblCidade (nomeCidade, codEstado) values("Riacho Frio", "17");
insert into tblCidade (nomeCidade, codEstado) values("Ribeira do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Ribeiro Gonçalves", "17");
insert into tblCidade (nomeCidade, codEstado) values("Rio Grande do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz dos Milagres", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santa Filomena", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luz", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio de Lisboa", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio dos Milagres", "17");
insert into tblCidade (nomeCidade, codEstado) values("Santo Inácio do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Braz do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Félix do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco de Assis do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Gurguéia", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São João da Canabrava", "17");
insert into tblCidade (nomeCidade, codEstado) values("São João da Fronteira", "17");
insert into tblCidade (nomeCidade, codEstado) values("São João da Serra", "17");
insert into tblCidade (nomeCidade, codEstado) values("São João da Varjota", "17");
insert into tblCidade (nomeCidade, codEstado) values("São João do Arraial", "17");
insert into tblCidade (nomeCidade, codEstado) values("São João do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São José do Divino", "17");
insert into tblCidade (nomeCidade, codEstado) values("São José do Peixe", "17");
insert into tblCidade (nomeCidade, codEstado) values("São José do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Julião", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Lourenço do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Luis do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel da Baixa Grande", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Fidalgo", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Tapuio", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("São Raimundo Nonato", "17");
insert into tblCidade (nomeCidade, codEstado) values("Sebastião Barros", "17");
insert into tblCidade (nomeCidade, codEstado) values("Sebastião Leal", "17");
insert into tblCidade (nomeCidade, codEstado) values("Sigefredo Pacheco", "17");
insert into tblCidade (nomeCidade, codEstado) values("Simões", "17");
insert into tblCidade (nomeCidade, codEstado) values("Simplício Mendes", "17");
insert into tblCidade (nomeCidade, codEstado) values("Socorro do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Sussuapara", "17");
insert into tblCidade (nomeCidade, codEstado) values("Tamboril do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Tanque do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Teresina", "17");
insert into tblCidade (nomeCidade, codEstado) values("União", "17");
insert into tblCidade (nomeCidade, codEstado) values("Uruçuí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Valença do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Várzea Branca", "17");
insert into tblCidade (nomeCidade, codEstado) values("Várzea Grande", "17");
insert into tblCidade (nomeCidade, codEstado) values("Vera Mendes", "17");
insert into tblCidade (nomeCidade, codEstado) values("Vila Nova do Piauí", "17");
insert into tblCidade (nomeCidade, codEstado) values("Wall Ferraz", "17");
insert into tblCidade (nomeCidade, codEstado) values("Abaiara", "6");
insert into tblCidade (nomeCidade, codEstado) values("Acarape", "6");
insert into tblCidade (nomeCidade, codEstado) values("Acaraú", "6");
insert into tblCidade (nomeCidade, codEstado) values("Acopiara", "6");
insert into tblCidade (nomeCidade, codEstado) values("Aiuaba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Alcântaras", "6");
insert into tblCidade (nomeCidade, codEstado) values("Altaneira", "6");
insert into tblCidade (nomeCidade, codEstado) values("Alto Santo", "6");
insert into tblCidade (nomeCidade, codEstado) values("Amontada", "6");
insert into tblCidade (nomeCidade, codEstado) values("Antonina do Norte", "6");
insert into tblCidade (nomeCidade, codEstado) values("Apuiarés", "6");
insert into tblCidade (nomeCidade, codEstado) values("Aquiraz", "6");
insert into tblCidade (nomeCidade, codEstado) values("Aracati", "6");
insert into tblCidade (nomeCidade, codEstado) values("Aracoiaba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ararendá", "6");
insert into tblCidade (nomeCidade, codEstado) values("Araripe", "6");
insert into tblCidade (nomeCidade, codEstado) values("Aratuba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Arneiroz", "6");
insert into tblCidade (nomeCidade, codEstado) values("Assaré", "6");
insert into tblCidade (nomeCidade, codEstado) values("Aurora", "6");
insert into tblCidade (nomeCidade, codEstado) values("Baixio", "6");
insert into tblCidade (nomeCidade, codEstado) values("Banabuiú", "6");
insert into tblCidade (nomeCidade, codEstado) values("Barbalha", "6");
insert into tblCidade (nomeCidade, codEstado) values("Barreira", "6");
insert into tblCidade (nomeCidade, codEstado) values("Barro", "6");
insert into tblCidade (nomeCidade, codEstado) values("Barroquinha", "6");
insert into tblCidade (nomeCidade, codEstado) values("Baturité", "6");
insert into tblCidade (nomeCidade, codEstado) values("Beberibe", "6");
insert into tblCidade (nomeCidade, codEstado) values("Bela Cruz", "6");
insert into tblCidade (nomeCidade, codEstado) values("Boa Viagem", "6");
insert into tblCidade (nomeCidade, codEstado) values("Brejo Santo", "6");
insert into tblCidade (nomeCidade, codEstado) values("Camocim", "6");
insert into tblCidade (nomeCidade, codEstado) values("Campos Sales", "6");
insert into tblCidade (nomeCidade, codEstado) values("Canindé", "6");
insert into tblCidade (nomeCidade, codEstado) values("Capistrano", "6");
insert into tblCidade (nomeCidade, codEstado) values("Caridade", "6");
insert into tblCidade (nomeCidade, codEstado) values("Cariré", "6");
insert into tblCidade (nomeCidade, codEstado) values("Caririaçu", "6");
insert into tblCidade (nomeCidade, codEstado) values("Cariús", "6");
insert into tblCidade (nomeCidade, codEstado) values("Carnaubal", "6");
insert into tblCidade (nomeCidade, codEstado) values("Cascavel", "6");
insert into tblCidade (nomeCidade, codEstado) values("Catarina", "6");
insert into tblCidade (nomeCidade, codEstado) values("Catunda", "6");
insert into tblCidade (nomeCidade, codEstado) values("Caucaia", "6");
insert into tblCidade (nomeCidade, codEstado) values("Cedro", "6");
insert into tblCidade (nomeCidade, codEstado) values("Chaval", "6");
insert into tblCidade (nomeCidade, codEstado) values("Choró", "6");
insert into tblCidade (nomeCidade, codEstado) values("Chorozinho", "6");
insert into tblCidade (nomeCidade, codEstado) values("Coreaú", "6");
insert into tblCidade (nomeCidade, codEstado) values("Crateús", "6");
insert into tblCidade (nomeCidade, codEstado) values("Crato", "6");
insert into tblCidade (nomeCidade, codEstado) values("Croatá", "6");
insert into tblCidade (nomeCidade, codEstado) values("Cruz", "6");
insert into tblCidade (nomeCidade, codEstado) values("Deputado Irapuan Pinheiro", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ererê", "6");
insert into tblCidade (nomeCidade, codEstado) values("Eusébio", "6");
insert into tblCidade (nomeCidade, codEstado) values("Farias Brito", "6");
insert into tblCidade (nomeCidade, codEstado) values("Forquilha", "6");
insert into tblCidade (nomeCidade, codEstado) values("Fortaleza", "6");
insert into tblCidade (nomeCidade, codEstado) values("Fortim", "6");
insert into tblCidade (nomeCidade, codEstado) values("Frecheirinha", "6");
insert into tblCidade (nomeCidade, codEstado) values("General Sampaio", "6");
insert into tblCidade (nomeCidade, codEstado) values("Graça", "6");
insert into tblCidade (nomeCidade, codEstado) values("Granja", "6");
insert into tblCidade (nomeCidade, codEstado) values("Granjeiro", "6");
insert into tblCidade (nomeCidade, codEstado) values("Groaíras", "6");
insert into tblCidade (nomeCidade, codEstado) values("Guaiúba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Guaraciaba do Norte", "6");
insert into tblCidade (nomeCidade, codEstado) values("Guaramiranga", "6");
insert into tblCidade (nomeCidade, codEstado) values("Hidrolândia", "6");
insert into tblCidade (nomeCidade, codEstado) values("Horizonte", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ibaretama", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ibiapina", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ibicuitinga", "6");
insert into tblCidade (nomeCidade, codEstado) values("Icapuí", "6");
insert into tblCidade (nomeCidade, codEstado) values("Icó", "6");
insert into tblCidade (nomeCidade, codEstado) values("Iguatu", "6");
insert into tblCidade (nomeCidade, codEstado) values("Independência", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ipaporanga", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ipaumirim", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ipu", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ipueiras", "6");
insert into tblCidade (nomeCidade, codEstado) values("Iracema", "6");
insert into tblCidade (nomeCidade, codEstado) values("Irauçuba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Itaiçaba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Itaitinga", "6");
insert into tblCidade (nomeCidade, codEstado) values("Itapagé", "6");
insert into tblCidade (nomeCidade, codEstado) values("Itapipoca", "6");
insert into tblCidade (nomeCidade, codEstado) values("Itapiúna", "6");
insert into tblCidade (nomeCidade, codEstado) values("Itarema", "6");
insert into tblCidade (nomeCidade, codEstado) values("Itatira", "6");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaretama", "6");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaribara", "6");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaribe", "6");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaruana", "6");
insert into tblCidade (nomeCidade, codEstado) values("Jardim", "6");
insert into tblCidade (nomeCidade, codEstado) values("Jati", "6");
insert into tblCidade (nomeCidade, codEstado) values("Jijoca de Jericoacoara", "6");
insert into tblCidade (nomeCidade, codEstado) values("Juazeiro do Norte", "6");
insert into tblCidade (nomeCidade, codEstado) values("Jucás", "6");
insert into tblCidade (nomeCidade, codEstado) values("Lavras da Mangabeira", "6");
insert into tblCidade (nomeCidade, codEstado) values("Limoeiro do Norte", "6");
insert into tblCidade (nomeCidade, codEstado) values("Madalena", "6");
insert into tblCidade (nomeCidade, codEstado) values("Maracanaú", "6");
insert into tblCidade (nomeCidade, codEstado) values("Maranguape", "6");
insert into tblCidade (nomeCidade, codEstado) values("Marco", "6");
insert into tblCidade (nomeCidade, codEstado) values("Martinópole", "6");
insert into tblCidade (nomeCidade, codEstado) values("Massapê", "6");
insert into tblCidade (nomeCidade, codEstado) values("Mauriti", "6");
insert into tblCidade (nomeCidade, codEstado) values("Meruoca", "6");
insert into tblCidade (nomeCidade, codEstado) values("Milagres", "6");
insert into tblCidade (nomeCidade, codEstado) values("Milhã", "6");
insert into tblCidade (nomeCidade, codEstado) values("Miraíma", "6");
insert into tblCidade (nomeCidade, codEstado) values("Missão Velha", "6");
insert into tblCidade (nomeCidade, codEstado) values("Mombaça", "6");
insert into tblCidade (nomeCidade, codEstado) values("Monsenhor Tabosa", "6");
insert into tblCidade (nomeCidade, codEstado) values("Morada Nova", "6");
insert into tblCidade (nomeCidade, codEstado) values("Moraújo", "6");
insert into tblCidade (nomeCidade, codEstado) values("Morrinhos", "6");
insert into tblCidade (nomeCidade, codEstado) values("Mucambo", "6");
insert into tblCidade (nomeCidade, codEstado) values("Mulungu", "6");
insert into tblCidade (nomeCidade, codEstado) values("Nova Olinda", "6");
insert into tblCidade (nomeCidade, codEstado) values("Nova Russas", "6");
insert into tblCidade (nomeCidade, codEstado) values("Novo Oriente", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ocara", "6");
insert into tblCidade (nomeCidade, codEstado) values("Orós", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pacajus", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pacatuba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pacoti", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pacujá", "6");
insert into tblCidade (nomeCidade, codEstado) values("Palhano", "6");
insert into tblCidade (nomeCidade, codEstado) values("Palmácia", "6");
insert into tblCidade (nomeCidade, codEstado) values("Paracuru", "6");
insert into tblCidade (nomeCidade, codEstado) values("Paraipaba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Parambu", "6");
insert into tblCidade (nomeCidade, codEstado) values("Paramoti", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Branca", "6");
insert into tblCidade (nomeCidade, codEstado) values("Penaforte", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pentecoste", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pereiro", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pindoretama", "6");
insert into tblCidade (nomeCidade, codEstado) values("Piquet Carneiro", "6");
insert into tblCidade (nomeCidade, codEstado) values("Pires Ferreira", "6");
insert into tblCidade (nomeCidade, codEstado) values("Poranga", "6");
insert into tblCidade (nomeCidade, codEstado) values("Porteiras", "6");
insert into tblCidade (nomeCidade, codEstado) values("Potengi", "6");
insert into tblCidade (nomeCidade, codEstado) values("Potiretama", "6");
insert into tblCidade (nomeCidade, codEstado) values("Quiterianópolis", "6");
insert into tblCidade (nomeCidade, codEstado) values("Quixadá", "6");
insert into tblCidade (nomeCidade, codEstado) values("Quixelô", "6");
insert into tblCidade (nomeCidade, codEstado) values("Quixeramobim", "6");
insert into tblCidade (nomeCidade, codEstado) values("Quixeré", "6");
insert into tblCidade (nomeCidade, codEstado) values("Redenção", "6");
insert into tblCidade (nomeCidade, codEstado) values("Reriutaba", "6");
insert into tblCidade (nomeCidade, codEstado) values("Russas", "6");
insert into tblCidade (nomeCidade, codEstado) values("Saboeiro", "6");
insert into tblCidade (nomeCidade, codEstado) values("Salitre", "6");
insert into tblCidade (nomeCidade, codEstado) values("Santa Quitéria", "6");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Acaraú", "6");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Cariri", "6");
insert into tblCidade (nomeCidade, codEstado) values("São Benedito", "6");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Amarante", "6");
insert into tblCidade (nomeCidade, codEstado) values("São João do Jaguaribe", "6");
insert into tblCidade (nomeCidade, codEstado) values("São Luís do Curu", "6");
insert into tblCidade (nomeCidade, codEstado) values("Senador Pompeu", "6");
insert into tblCidade (nomeCidade, codEstado) values("Senador Sá", "6");
insert into tblCidade (nomeCidade, codEstado) values("Sobral", "6");
insert into tblCidade (nomeCidade, codEstado) values("Solonópole", "6");
insert into tblCidade (nomeCidade, codEstado) values("Tabuleiro do Norte", "6");
insert into tblCidade (nomeCidade, codEstado) values("Tamboril", "6");
insert into tblCidade (nomeCidade, codEstado) values("Tarrafas", "6");
insert into tblCidade (nomeCidade, codEstado) values("Tauá", "6");
insert into tblCidade (nomeCidade, codEstado) values("Tejuçuoca", "6");
insert into tblCidade (nomeCidade, codEstado) values("Tianguá", "6");
insert into tblCidade (nomeCidade, codEstado) values("Trairi", "6");
insert into tblCidade (nomeCidade, codEstado) values("Tururu", "6");
insert into tblCidade (nomeCidade, codEstado) values("Ubajara", "6");
insert into tblCidade (nomeCidade, codEstado) values("Umari", "6");
insert into tblCidade (nomeCidade, codEstado) values("Umirim", "6");
insert into tblCidade (nomeCidade, codEstado) values("Uruburetama", "6");
insert into tblCidade (nomeCidade, codEstado) values("Uruoca", "6");
insert into tblCidade (nomeCidade, codEstado) values("Varjota", "6");
insert into tblCidade (nomeCidade, codEstado) values("Várzea Alegre", "6");
insert into tblCidade (nomeCidade, codEstado) values("Viçosa do Ceará", "6");
insert into tblCidade (nomeCidade, codEstado) values("Acari", "20");
insert into tblCidade (nomeCidade, codEstado) values("Açu", "20");
insert into tblCidade (nomeCidade, codEstado) values("Afonso Bezerra", "20");
insert into tblCidade (nomeCidade, codEstado) values("Água Nova", "20");
insert into tblCidade (nomeCidade, codEstado) values("Alexandria", "20");
insert into tblCidade (nomeCidade, codEstado) values("Almino Afonso", "20");
insert into tblCidade (nomeCidade, codEstado) values("Alto do Rodrigues", "20");
insert into tblCidade (nomeCidade, codEstado) values("Angicos", "20");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Martins", "20");
insert into tblCidade (nomeCidade, codEstado) values("Apodi", "20");
insert into tblCidade (nomeCidade, codEstado) values("Areia Branca", "20");
insert into tblCidade (nomeCidade, codEstado) values("Arês", "20");
insert into tblCidade (nomeCidade, codEstado) values("Augusto Severo", "20");
insert into tblCidade (nomeCidade, codEstado) values("Baía Formosa", "20");
insert into tblCidade (nomeCidade, codEstado) values("Baraúna", "20");
insert into tblCidade (nomeCidade, codEstado) values("Barcelona", "20");
insert into tblCidade (nomeCidade, codEstado) values("Bento Fernandes", "20");
insert into tblCidade (nomeCidade, codEstado) values("Bodó", "20");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus", "20");
insert into tblCidade (nomeCidade, codEstado) values("Brejinho", "20");
insert into tblCidade (nomeCidade, codEstado) values("Caiçara do Norte", "20");
insert into tblCidade (nomeCidade, codEstado) values("Caiçara do Rio do Vento", "20");
insert into tblCidade (nomeCidade, codEstado) values("Caicó", "20");
insert into tblCidade (nomeCidade, codEstado) values("Campo Redondo", "20");
insert into tblCidade (nomeCidade, codEstado) values("Canguaretama", "20");
insert into tblCidade (nomeCidade, codEstado) values("Caraúbas", "20");
insert into tblCidade (nomeCidade, codEstado) values("Carnaúba dos Dantas", "20");
insert into tblCidade (nomeCidade, codEstado) values("Carnaubais", "20");
insert into tblCidade (nomeCidade, codEstado) values("Ceará-Mirim", "20");
insert into tblCidade (nomeCidade, codEstado) values("Cerro Corá", "20");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Ezequiel", "20");
insert into tblCidade (nomeCidade, codEstado) values("Coronel João Pessoa", "20");
insert into tblCidade (nomeCidade, codEstado) values("Cruzeta", "20");
insert into tblCidade (nomeCidade, codEstado) values("Currais Novos", "20");
insert into tblCidade (nomeCidade, codEstado) values("Doutor Severiano", "20");
insert into tblCidade (nomeCidade, codEstado) values("Encanto", "20");
insert into tblCidade (nomeCidade, codEstado) values("Equador", "20");
insert into tblCidade (nomeCidade, codEstado) values("Espírito Santo", "20");
insert into tblCidade (nomeCidade, codEstado) values("Extremoz", "20");
insert into tblCidade (nomeCidade, codEstado) values("Felipe Guerra", "20");
insert into tblCidade (nomeCidade, codEstado) values("Fernando Pedroza", "20");
insert into tblCidade (nomeCidade, codEstado) values("Florânia", "20");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Dantas", "20");
insert into tblCidade (nomeCidade, codEstado) values("Frutuoso Gomes", "20");
insert into tblCidade (nomeCidade, codEstado) values("Galinhos", "20");
insert into tblCidade (nomeCidade, codEstado) values("Goianinha", "20");
insert into tblCidade (nomeCidade, codEstado) values("Governador Dix-Sept Rosado", "20");
insert into tblCidade (nomeCidade, codEstado) values("Grossos", "20");
insert into tblCidade (nomeCidade, codEstado) values("Guamaré", "20");
insert into tblCidade (nomeCidade, codEstado) values("Ielmo Marinho", "20");
insert into tblCidade (nomeCidade, codEstado) values("Ipanguaçu", "20");
insert into tblCidade (nomeCidade, codEstado) values("Ipueira", "20");
insert into tblCidade (nomeCidade, codEstado) values("Itajá", "20");
insert into tblCidade (nomeCidade, codEstado) values("Itaú", "20");
insert into tblCidade (nomeCidade, codEstado) values("Jaçanã", "20");
insert into tblCidade (nomeCidade, codEstado) values("Jandaíra", "20");
insert into tblCidade (nomeCidade, codEstado) values("Janduís", "20");
insert into tblCidade (nomeCidade, codEstado) values("Januário Cicco", "20");
insert into tblCidade (nomeCidade, codEstado) values("Japi", "20");
insert into tblCidade (nomeCidade, codEstado) values("Jardim de Angicos", "20");
insert into tblCidade (nomeCidade, codEstado) values("Jardim de Piranhas", "20");
insert into tblCidade (nomeCidade, codEstado) values("Jardim do Seridó", "20");
insert into tblCidade (nomeCidade, codEstado) values("João Câmara", "20");
insert into tblCidade (nomeCidade, codEstado) values("João Dias", "20");
insert into tblCidade (nomeCidade, codEstado) values("José da Penha", "20");
insert into tblCidade (nomeCidade, codEstado) values("Jucurutu", "20");
insert into tblCidade (nomeCidade, codEstado) values("Jundiá", "20");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa d'Anta", "20");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa de Pedras", "20");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa de Velhos", "20");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Nova", "20");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Salgada", "20");
insert into tblCidade (nomeCidade, codEstado) values("Lajes", "20");
insert into tblCidade (nomeCidade, codEstado) values("Lajes Pintadas", "20");
insert into tblCidade (nomeCidade, codEstado) values("Lucrécia", "20");
insert into tblCidade (nomeCidade, codEstado) values("Luís Gomes", "20");
insert into tblCidade (nomeCidade, codEstado) values("Macaíba", "20");
insert into tblCidade (nomeCidade, codEstado) values("Macau", "20");
insert into tblCidade (nomeCidade, codEstado) values("Major Sales", "20");
insert into tblCidade (nomeCidade, codEstado) values("Marcelino Vieira", "20");
insert into tblCidade (nomeCidade, codEstado) values("Martins", "20");
insert into tblCidade (nomeCidade, codEstado) values("Maxaranguape", "20");
insert into tblCidade (nomeCidade, codEstado) values("Messias Targino", "20");
insert into tblCidade (nomeCidade, codEstado) values("Montanhas", "20");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alegre", "20");
insert into tblCidade (nomeCidade, codEstado) values("Monte das Gameleiras", "20");
insert into tblCidade (nomeCidade, codEstado) values("Mossoró", "20");
insert into tblCidade (nomeCidade, codEstado) values("Natal", "20");
insert into tblCidade (nomeCidade, codEstado) values("Nísia Floresta", "20");
insert into tblCidade (nomeCidade, codEstado) values("Nova Cruz", "20");
insert into tblCidade (nomeCidade, codEstado) values("Olho-d'Água do Borges", "20");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Branco", "20");
insert into tblCidade (nomeCidade, codEstado) values("Paraná", "20");
insert into tblCidade (nomeCidade, codEstado) values("Paraú", "20");
insert into tblCidade (nomeCidade, codEstado) values("Parazinho", "20");
insert into tblCidade (nomeCidade, codEstado) values("Parelhas", "20");
insert into tblCidade (nomeCidade, codEstado) values("Parnamirim", "20");
insert into tblCidade (nomeCidade, codEstado) values("Passa e Fica", "20");
insert into tblCidade (nomeCidade, codEstado) values("Passagem", "20");
insert into tblCidade (nomeCidade, codEstado) values("Patu", "20");
insert into tblCidade (nomeCidade, codEstado) values("Pau dos Ferros", "20");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Grande", "20");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Preta", "20");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Avelino", "20");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Velho", "20");
insert into tblCidade (nomeCidade, codEstado) values("Pendências", "20");
insert into tblCidade (nomeCidade, codEstado) values("Pilões", "20");
insert into tblCidade (nomeCidade, codEstado) values("Poço Branco", "20");
insert into tblCidade (nomeCidade, codEstado) values("Portalegre", "20");
insert into tblCidade (nomeCidade, codEstado) values("Porto do Mangue", "20");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Juscelino", "20");
insert into tblCidade (nomeCidade, codEstado) values("Pureza", "20");
insert into tblCidade (nomeCidade, codEstado) values("Rafael Fernandes", "20");
insert into tblCidade (nomeCidade, codEstado) values("Rafael Godeiro", "20");
insert into tblCidade (nomeCidade, codEstado) values("Riacho da Cruz", "20");
insert into tblCidade (nomeCidade, codEstado) values("Riacho de Santana", "20");
insert into tblCidade (nomeCidade, codEstado) values("Riachuelo", "20");
insert into tblCidade (nomeCidade, codEstado) values("Rio do Fogo", "20");
insert into tblCidade (nomeCidade, codEstado) values("Rodolfo Fernandes", "20");
insert into tblCidade (nomeCidade, codEstado) values("Ruy Barbosa", "20");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz", "20");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria", "20");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Matos", "20");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Seridó", "20");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Bento do Norte", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Bento do Trairí", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Fernando", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Oeste", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Amarante", "20");
insert into tblCidade (nomeCidade, codEstado) values("São João do Sabugi", "20");
insert into tblCidade (nomeCidade, codEstado) values("São José de Mipibu", "20");
insert into tblCidade (nomeCidade, codEstado) values("São José do Campestre", "20");
insert into tblCidade (nomeCidade, codEstado) values("São José do Seridó", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Gostoso", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Paulo do Potengi", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Rafael", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Tomé", "20");
insert into tblCidade (nomeCidade, codEstado) values("São Vicente", "20");
insert into tblCidade (nomeCidade, codEstado) values("Senador Elói de Souza", "20");
insert into tblCidade (nomeCidade, codEstado) values("Senador Georgino Avelino", "20");
insert into tblCidade (nomeCidade, codEstado) values("Serra de São Bento", "20");
insert into tblCidade (nomeCidade, codEstado) values("Serra do Mel", "20");
insert into tblCidade (nomeCidade, codEstado) values("Serra Negra do Norte", "20");
insert into tblCidade (nomeCidade, codEstado) values("Serrinha", "20");
insert into tblCidade (nomeCidade, codEstado) values("Serrinha dos Pintos", "20");
insert into tblCidade (nomeCidade, codEstado) values("Severiano Melo", "20");
insert into tblCidade (nomeCidade, codEstado) values("Sítio Novo", "20");
insert into tblCidade (nomeCidade, codEstado) values("Taboleiro Grande", "20");
insert into tblCidade (nomeCidade, codEstado) values("Taipu", "20");
insert into tblCidade (nomeCidade, codEstado) values("Tangará", "20");
insert into tblCidade (nomeCidade, codEstado) values("Tenente Ananias", "20");
insert into tblCidade (nomeCidade, codEstado) values("Tenente Laurentino Cruz", "20");
insert into tblCidade (nomeCidade, codEstado) values("Tibau", "20");
insert into tblCidade (nomeCidade, codEstado) values("Tibau do Sul", "20");
insert into tblCidade (nomeCidade, codEstado) values("Timbaúba dos Batistas", "20");
insert into tblCidade (nomeCidade, codEstado) values("Touros", "20");
insert into tblCidade (nomeCidade, codEstado) values("Triunfo Potiguar", "20");
insert into tblCidade (nomeCidade, codEstado) values("Umarizal", "20");
insert into tblCidade (nomeCidade, codEstado) values("Upanema", "20");
insert into tblCidade (nomeCidade, codEstado) values("Várzea", "20");
insert into tblCidade (nomeCidade, codEstado) values("Venha-Ver", "20");
insert into tblCidade (nomeCidade, codEstado) values("Vera Cruz", "20");
insert into tblCidade (nomeCidade, codEstado) values("Viçosa", "20");
insert into tblCidade (nomeCidade, codEstado) values("Vila Flor", "20");
insert into tblCidade (nomeCidade, codEstado) values("Água Branca", "15");
insert into tblCidade (nomeCidade, codEstado) values("Aguiar", "15");
insert into tblCidade (nomeCidade, codEstado) values("Alagoa Grande", "15");
insert into tblCidade (nomeCidade, codEstado) values("Alagoa Nova", "15");
insert into tblCidade (nomeCidade, codEstado) values("Alagoinha", "15");
insert into tblCidade (nomeCidade, codEstado) values("Alcantil", "15");
insert into tblCidade (nomeCidade, codEstado) values("Algodão de Jandaíra", "15");
insert into tblCidade (nomeCidade, codEstado) values("Alhandra", "15");
insert into tblCidade (nomeCidade, codEstado) values("Amparo", "15");
insert into tblCidade (nomeCidade, codEstado) values("Aparecida", "15");
insert into tblCidade (nomeCidade, codEstado) values("Araçagi", "15");
insert into tblCidade (nomeCidade, codEstado) values("Arara", "15");
insert into tblCidade (nomeCidade, codEstado) values("Araruna", "15");
insert into tblCidade (nomeCidade, codEstado) values("Areia", "15");
insert into tblCidade (nomeCidade, codEstado) values("Areia de Baraúnas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Areial", "15");
insert into tblCidade (nomeCidade, codEstado) values("Aroeiras", "15");
insert into tblCidade (nomeCidade, codEstado) values("Assunção", "15");
insert into tblCidade (nomeCidade, codEstado) values("Baía da Traição", "15");
insert into tblCidade (nomeCidade, codEstado) values("Bananeiras", "15");
insert into tblCidade (nomeCidade, codEstado) values("Baraúna", "15");
insert into tblCidade (nomeCidade, codEstado) values("Barra de Santa Rosa", "15");
insert into tblCidade (nomeCidade, codEstado) values("Barra de Santana", "15");
insert into tblCidade (nomeCidade, codEstado) values("Barra de São Miguel", "15");
insert into tblCidade (nomeCidade, codEstado) values("Bayeux", "15");
insert into tblCidade (nomeCidade, codEstado) values("Belém", "15");
insert into tblCidade (nomeCidade, codEstado) values("Belém do Brejo do Cruz", "15");
insert into tblCidade (nomeCidade, codEstado) values("Bernardino Batista", "15");
insert into tblCidade (nomeCidade, codEstado) values("Boa Ventura", "15");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista", "15");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus", "15");
insert into tblCidade (nomeCidade, codEstado) values("Bom Sucesso", "15");
insert into tblCidade (nomeCidade, codEstado) values("Bonito de Santa Fé", "15");
insert into tblCidade (nomeCidade, codEstado) values("Boqueirão", "15");
insert into tblCidade (nomeCidade, codEstado) values("Borborema", "15");
insert into tblCidade (nomeCidade, codEstado) values("Brejo do Cruz", "15");
insert into tblCidade (nomeCidade, codEstado) values("Brejo dos Santos", "15");
insert into tblCidade (nomeCidade, codEstado) values("Caaporã", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cabaceiras", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cabedelo", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira dos Índios", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cacimba de Areia", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cacimba de Dentro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cacimbas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Caiçara", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cajazeiras", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cajazeirinhas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Caldas Brandão", "15");
insert into tblCidade (nomeCidade, codEstado) values("Camalaú", "15");
insert into tblCidade (nomeCidade, codEstado) values("Campina Grande", "15");
insert into tblCidade (nomeCidade, codEstado) values("Tacima", "15");
insert into tblCidade (nomeCidade, codEstado) values("Capim", "15");
insert into tblCidade (nomeCidade, codEstado) values("Caraúbas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Carrapateira", "15");
insert into tblCidade (nomeCidade, codEstado) values("Casserengue", "15");
insert into tblCidade (nomeCidade, codEstado) values("Catingueira", "15");
insert into tblCidade (nomeCidade, codEstado) values("Catolé do Rocha", "15");
insert into tblCidade (nomeCidade, codEstado) values("Caturité", "15");
insert into tblCidade (nomeCidade, codEstado) values("Conceição", "15");
insert into tblCidade (nomeCidade, codEstado) values("Condado", "15");
insert into tblCidade (nomeCidade, codEstado) values("Conde", "15");
insert into tblCidade (nomeCidade, codEstado) values("Congo", "15");
insert into tblCidade (nomeCidade, codEstado) values("Coremas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Coxixola", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cruz do Espírito Santo", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cubati", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cuité", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cuité de Mamanguape", "15");
insert into tblCidade (nomeCidade, codEstado) values("Cuitegi", "15");
insert into tblCidade (nomeCidade, codEstado) values("Curral de Cima", "15");
insert into tblCidade (nomeCidade, codEstado) values("Curral Velho", "15");
insert into tblCidade (nomeCidade, codEstado) values("Damião", "15");
insert into tblCidade (nomeCidade, codEstado) values("Desterro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Diamante", "15");
insert into tblCidade (nomeCidade, codEstado) values("Dona Inês", "15");
insert into tblCidade (nomeCidade, codEstado) values("Duas Estradas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Emas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Esperança", "15");
insert into tblCidade (nomeCidade, codEstado) values("Fagundes", "15");
insert into tblCidade (nomeCidade, codEstado) values("Frei Martinho", "15");
insert into tblCidade (nomeCidade, codEstado) values("Gado Bravo", "15");
insert into tblCidade (nomeCidade, codEstado) values("Guarabira", "15");
insert into tblCidade (nomeCidade, codEstado) values("Gurinhém", "15");
insert into tblCidade (nomeCidade, codEstado) values("Gurjão", "15");
insert into tblCidade (nomeCidade, codEstado) values("Ibiara", "15");
insert into tblCidade (nomeCidade, codEstado) values("Igaracy", "15");
insert into tblCidade (nomeCidade, codEstado) values("Imaculada", "15");
insert into tblCidade (nomeCidade, codEstado) values("Ingá", "15");
insert into tblCidade (nomeCidade, codEstado) values("Itabaiana", "15");
insert into tblCidade (nomeCidade, codEstado) values("Itaporanga", "15");
insert into tblCidade (nomeCidade, codEstado) values("Itapororoca", "15");
insert into tblCidade (nomeCidade, codEstado) values("Itatuba", "15");
insert into tblCidade (nomeCidade, codEstado) values("Jacaraú", "15");
insert into tblCidade (nomeCidade, codEstado) values("Jericó", "15");
insert into tblCidade (nomeCidade, codEstado) values("João Pessoa", "15");
insert into tblCidade (nomeCidade, codEstado) values("Juarez Távora", "15");
insert into tblCidade (nomeCidade, codEstado) values("Juazeirinho", "15");
insert into tblCidade (nomeCidade, codEstado) values("Junco do Seridó", "15");
insert into tblCidade (nomeCidade, codEstado) values("Juripiranga", "15");
insert into tblCidade (nomeCidade, codEstado) values("Juru", "15");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa", "15");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa de Dentro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Seca", "15");
insert into tblCidade (nomeCidade, codEstado) values("Lastro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Livramento", "15");
insert into tblCidade (nomeCidade, codEstado) values("Logradouro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Lucena", "15");
insert into tblCidade (nomeCidade, codEstado) values("Mãe d'Água", "15");
insert into tblCidade (nomeCidade, codEstado) values("Malta", "15");
insert into tblCidade (nomeCidade, codEstado) values("Mamanguape", "15");
insert into tblCidade (nomeCidade, codEstado) values("Manaíra", "15");
insert into tblCidade (nomeCidade, codEstado) values("Marcação", "15");
insert into tblCidade (nomeCidade, codEstado) values("Mari", "15");
insert into tblCidade (nomeCidade, codEstado) values("Marizópolis", "15");
insert into tblCidade (nomeCidade, codEstado) values("Massaranduba", "15");
insert into tblCidade (nomeCidade, codEstado) values("Mataraca", "15");
insert into tblCidade (nomeCidade, codEstado) values("Matinhas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Mato Grosso", "15");
insert into tblCidade (nomeCidade, codEstado) values("Maturéia", "15");
insert into tblCidade (nomeCidade, codEstado) values("Mogeiro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Montadas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Monte Horebe", "15");
insert into tblCidade (nomeCidade, codEstado) values("Monteiro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Mulungu", "15");
insert into tblCidade (nomeCidade, codEstado) values("Natuba", "15");
insert into tblCidade (nomeCidade, codEstado) values("Nazarezinho", "15");
insert into tblCidade (nomeCidade, codEstado) values("Nova Floresta", "15");
insert into tblCidade (nomeCidade, codEstado) values("Nova Olinda", "15");
insert into tblCidade (nomeCidade, codEstado) values("Nova Palmeira", "15");
insert into tblCidade (nomeCidade, codEstado) values("Olho d'Água", "15");
insert into tblCidade (nomeCidade, codEstado) values("Olivedos", "15");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Velho", "15");
insert into tblCidade (nomeCidade, codEstado) values("Parari", "15");
insert into tblCidade (nomeCidade, codEstado) values("Passagem", "15");
insert into tblCidade (nomeCidade, codEstado) values("Patos", "15");
insert into tblCidade (nomeCidade, codEstado) values("Paulista", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Branca", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Lavrada", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pedras de Fogo", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Régis", "15");
insert into tblCidade (nomeCidade, codEstado) values("Piancó", "15");
insert into tblCidade (nomeCidade, codEstado) values("Picuí", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pilar", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pilões", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pilõezinhos", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pirpirituba", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pitimbu", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pocinhos", "15");
insert into tblCidade (nomeCidade, codEstado) values("Poço Dantas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Poço de José de Moura", "15");
insert into tblCidade (nomeCidade, codEstado) values("Pombal", "15");
insert into tblCidade (nomeCidade, codEstado) values("Prata", "15");
insert into tblCidade (nomeCidade, codEstado) values("Princesa Isabel", "15");
insert into tblCidade (nomeCidade, codEstado) values("Puxinanã", "15");
insert into tblCidade (nomeCidade, codEstado) values("Queimadas", "15");
insert into tblCidade (nomeCidade, codEstado) values("Quixabá", "15");
insert into tblCidade (nomeCidade, codEstado) values("Remígio", "15");
insert into tblCidade (nomeCidade, codEstado) values("Riachão", "15");
insert into tblCidade (nomeCidade, codEstado) values("Riachão do Bacamarte", "15");
insert into tblCidade (nomeCidade, codEstado) values("Riachão do Poço", "15");
insert into tblCidade (nomeCidade, codEstado) values("Riacho de Santo Antônio", "15");
insert into tblCidade (nomeCidade, codEstado) values("Riacho dos Cavalos", "15");
insert into tblCidade (nomeCidade, codEstado) values("Rio Tinto", "15");
insert into tblCidade (nomeCidade, codEstado) values("Salgadinho", "15");
insert into tblCidade (nomeCidade, codEstado) values("Salgado de São Félix", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cecília", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santa Helena", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santa Inês", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santa Teresinha", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santana de Mangueira", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santana dos Garrotes", "15");
insert into tblCidade (nomeCidade, codEstado) values("Joca Claudino", "15");
insert into tblCidade (nomeCidade, codEstado) values("Santo André", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Bentinho", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Bento", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos do Cariri", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco", "15");
insert into tblCidade (nomeCidade, codEstado) values("São João do Cariri", "15");
insert into tblCidade (nomeCidade, codEstado) values("São João do Rio do Peixe", "15");
insert into tblCidade (nomeCidade, codEstado) values("São João do Tigre", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José da Lagoa Tapada", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José de Caiana", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José de Espinharas", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José de Piranhas", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José de Princesa", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José do Bonfim", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José do Brejo do Cruz", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José do Sabugi", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José dos Cordeiros", "15");
insert into tblCidade (nomeCidade, codEstado) values("São José dos Ramos", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Mamede", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel de Taipu", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião de Lagoa de Roça", "15");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Umbuzeiro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Sapé", "15");
insert into tblCidade (nomeCidade, codEstado) values("Seridó", "15");
insert into tblCidade (nomeCidade, codEstado) values("Serra Branca", "15");
insert into tblCidade (nomeCidade, codEstado) values("Serra da Raiz", "15");
insert into tblCidade (nomeCidade, codEstado) values("Serra Grande", "15");
insert into tblCidade (nomeCidade, codEstado) values("Serra Redonda", "15");
insert into tblCidade (nomeCidade, codEstado) values("Serraria", "15");
insert into tblCidade (nomeCidade, codEstado) values("Sertãozinho", "15");
insert into tblCidade (nomeCidade, codEstado) values("Sobrado", "15");
insert into tblCidade (nomeCidade, codEstado) values("Solânea", "15");
insert into tblCidade (nomeCidade, codEstado) values("Soledade", "15");
insert into tblCidade (nomeCidade, codEstado) values("Sossêgo", "15");
insert into tblCidade (nomeCidade, codEstado) values("Sousa", "15");
insert into tblCidade (nomeCidade, codEstado) values("Sumé", "15");
insert into tblCidade (nomeCidade, codEstado) values("Taperoá", "15");
insert into tblCidade (nomeCidade, codEstado) values("Tavares", "15");
insert into tblCidade (nomeCidade, codEstado) values("Teixeira", "15");
insert into tblCidade (nomeCidade, codEstado) values("Tenório", "15");
insert into tblCidade (nomeCidade, codEstado) values("Triunfo", "15");
insert into tblCidade (nomeCidade, codEstado) values("Uiraúna", "15");
insert into tblCidade (nomeCidade, codEstado) values("Umbuzeiro", "15");
insert into tblCidade (nomeCidade, codEstado) values("Várzea", "15");
insert into tblCidade (nomeCidade, codEstado) values("Vieirópolis", "15");
insert into tblCidade (nomeCidade, codEstado) values("Vista Serrana", "15");
insert into tblCidade (nomeCidade, codEstado) values("Zabelê", "15");
insert into tblCidade (nomeCidade, codEstado) values("Abreu e Lima", "16");
insert into tblCidade (nomeCidade, codEstado) values("Afogados da Ingazeira", "16");
insert into tblCidade (nomeCidade, codEstado) values("Afrânio", "16");
insert into tblCidade (nomeCidade, codEstado) values("Agrestina", "16");
insert into tblCidade (nomeCidade, codEstado) values("Água Preta", "16");
insert into tblCidade (nomeCidade, codEstado) values("Águas Belas", "16");
insert into tblCidade (nomeCidade, codEstado) values("Alagoinha", "16");
insert into tblCidade (nomeCidade, codEstado) values("Aliança", "16");
insert into tblCidade (nomeCidade, codEstado) values("Altinho", "16");
insert into tblCidade (nomeCidade, codEstado) values("Amaraji", "16");
insert into tblCidade (nomeCidade, codEstado) values("Angelim", "16");
insert into tblCidade (nomeCidade, codEstado) values("Araçoiaba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Araripina", "16");
insert into tblCidade (nomeCidade, codEstado) values("Arcoverde", "16");
insert into tblCidade (nomeCidade, codEstado) values("Barra de Guabiraba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Barreiros", "16");
insert into tblCidade (nomeCidade, codEstado) values("Belém de Maria", "16");
insert into tblCidade (nomeCidade, codEstado) values("Belém do São Francisco", "16");
insert into tblCidade (nomeCidade, codEstado) values("Belo Jardim", "16");
insert into tblCidade (nomeCidade, codEstado) values("Betânia", "16");
insert into tblCidade (nomeCidade, codEstado) values("Bezerros", "16");
insert into tblCidade (nomeCidade, codEstado) values("Bodocó", "16");
insert into tblCidade (nomeCidade, codEstado) values("Bom Conselho", "16");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jardim", "16");
insert into tblCidade (nomeCidade, codEstado) values("Bonito", "16");
insert into tblCidade (nomeCidade, codEstado) values("Brejão", "16");
insert into tblCidade (nomeCidade, codEstado) values("Brejinho", "16");
insert into tblCidade (nomeCidade, codEstado) values("Brejo da Madre de Deus", "16");
insert into tblCidade (nomeCidade, codEstado) values("Buenos Aires", "16");
insert into tblCidade (nomeCidade, codEstado) values("Buíque", "16");
insert into tblCidade (nomeCidade, codEstado) values("Cabo de Santo Agostinho", "16");
insert into tblCidade (nomeCidade, codEstado) values("Cabrobó", "16");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeirinha", "16");
insert into tblCidade (nomeCidade, codEstado) values("Caetés", "16");
insert into tblCidade (nomeCidade, codEstado) values("Calçado", "16");
insert into tblCidade (nomeCidade, codEstado) values("Calumbi", "16");
insert into tblCidade (nomeCidade, codEstado) values("Camaragibe", "16");
insert into tblCidade (nomeCidade, codEstado) values("Camocim de São Félix", "16");
insert into tblCidade (nomeCidade, codEstado) values("Camutanga", "16");
insert into tblCidade (nomeCidade, codEstado) values("Canhotinho", "16");
insert into tblCidade (nomeCidade, codEstado) values("Capoeiras", "16");
insert into tblCidade (nomeCidade, codEstado) values("Carnaíba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Carnaubeira da Penha", "16");
insert into tblCidade (nomeCidade, codEstado) values("Carpina", "16");
insert into tblCidade (nomeCidade, codEstado) values("Caruaru", "16");
insert into tblCidade (nomeCidade, codEstado) values("Casinhas", "16");
insert into tblCidade (nomeCidade, codEstado) values("Catende", "16");
insert into tblCidade (nomeCidade, codEstado) values("Cedro", "16");
insert into tblCidade (nomeCidade, codEstado) values("Chã de Alegria", "16");
insert into tblCidade (nomeCidade, codEstado) values("Chã Grande", "16");
insert into tblCidade (nomeCidade, codEstado) values("Condado", "16");
insert into tblCidade (nomeCidade, codEstado) values("Correntes", "16");
insert into tblCidade (nomeCidade, codEstado) values("Cortês", "16");
insert into tblCidade (nomeCidade, codEstado) values("Cumaru", "16");
insert into tblCidade (nomeCidade, codEstado) values("Cupira", "16");
insert into tblCidade (nomeCidade, codEstado) values("Custódia", "16");
insert into tblCidade (nomeCidade, codEstado) values("Dormentes", "16");
insert into tblCidade (nomeCidade, codEstado) values("Escada", "16");
insert into tblCidade (nomeCidade, codEstado) values("Exu", "16");
insert into tblCidade (nomeCidade, codEstado) values("Feira Nova", "16");
insert into tblCidade (nomeCidade, codEstado) values("Fernando de Noronha", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ferreiros", "16");
insert into tblCidade (nomeCidade, codEstado) values("Flores", "16");
insert into tblCidade (nomeCidade, codEstado) values("Floresta", "16");
insert into tblCidade (nomeCidade, codEstado) values("Frei Miguelinho", "16");
insert into tblCidade (nomeCidade, codEstado) values("Gameleira", "16");
insert into tblCidade (nomeCidade, codEstado) values("Garanhuns", "16");
insert into tblCidade (nomeCidade, codEstado) values("Glória do Goitá", "16");
insert into tblCidade (nomeCidade, codEstado) values("Goiana", "16");
insert into tblCidade (nomeCidade, codEstado) values("Granito", "16");
insert into tblCidade (nomeCidade, codEstado) values("Gravatá", "16");
insert into tblCidade (nomeCidade, codEstado) values("Iati", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ibimirim", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ibirajuba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Igarassu", "16");
insert into tblCidade (nomeCidade, codEstado) values("Iguaraci", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ilha de Itamaracá", "16");
insert into tblCidade (nomeCidade, codEstado) values("Inajá", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ingazeira", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ipojuca", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ipubi", "16");
insert into tblCidade (nomeCidade, codEstado) values("Itacuruba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Itaíba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Itambé", "16");
insert into tblCidade (nomeCidade, codEstado) values("Itapetim", "16");
insert into tblCidade (nomeCidade, codEstado) values("Itapissuma", "16");
insert into tblCidade (nomeCidade, codEstado) values("Itaquitinga", "16");
insert into tblCidade (nomeCidade, codEstado) values("Jaboatão dos Guararapes", "16");
insert into tblCidade (nomeCidade, codEstado) values("Jaqueira", "16");
insert into tblCidade (nomeCidade, codEstado) values("Jataúba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Jatobá", "16");
insert into tblCidade (nomeCidade, codEstado) values("João Alfredo", "16");
insert into tblCidade (nomeCidade, codEstado) values("Joaquim Nabuco", "16");
insert into tblCidade (nomeCidade, codEstado) values("Jucati", "16");
insert into tblCidade (nomeCidade, codEstado) values("Jupi", "16");
insert into tblCidade (nomeCidade, codEstado) values("Jurema", "16");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa do Carro", "16");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa de Itaenga", "16");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa do Ouro", "16");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa dos Gatos", "16");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Grande", "16");
insert into tblCidade (nomeCidade, codEstado) values("Lajedo", "16");
insert into tblCidade (nomeCidade, codEstado) values("Limoeiro", "16");
insert into tblCidade (nomeCidade, codEstado) values("Macaparana", "16");
insert into tblCidade (nomeCidade, codEstado) values("Machados", "16");
insert into tblCidade (nomeCidade, codEstado) values("Manari", "16");
insert into tblCidade (nomeCidade, codEstado) values("Maraial", "16");
insert into tblCidade (nomeCidade, codEstado) values("Mirandiba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Moreilândia", "16");
insert into tblCidade (nomeCidade, codEstado) values("Moreno", "16");
insert into tblCidade (nomeCidade, codEstado) values("Nazaré da Mata", "16");
insert into tblCidade (nomeCidade, codEstado) values("Olinda", "16");
insert into tblCidade (nomeCidade, codEstado) values("Orobó", "16");
insert into tblCidade (nomeCidade, codEstado) values("Orocó", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ouricuri", "16");
insert into tblCidade (nomeCidade, codEstado) values("Palmares", "16");
insert into tblCidade (nomeCidade, codEstado) values("Palmeirina", "16");
insert into tblCidade (nomeCidade, codEstado) values("Panelas", "16");
insert into tblCidade (nomeCidade, codEstado) values("Paranatama", "16");
insert into tblCidade (nomeCidade, codEstado) values("Parnamirim", "16");
insert into tblCidade (nomeCidade, codEstado) values("Passira", "16");
insert into tblCidade (nomeCidade, codEstado) values("Paudalho", "16");
insert into tblCidade (nomeCidade, codEstado) values("Paulista", "16");
insert into tblCidade (nomeCidade, codEstado) values("Pedra", "16");
insert into tblCidade (nomeCidade, codEstado) values("Pesqueira", "16");
insert into tblCidade (nomeCidade, codEstado) values("Petrolândia", "16");
insert into tblCidade (nomeCidade, codEstado) values("Petrolina", "16");
insert into tblCidade (nomeCidade, codEstado) values("Poção", "16");
insert into tblCidade (nomeCidade, codEstado) values("Pombos", "16");
insert into tblCidade (nomeCidade, codEstado) values("Primavera", "16");
insert into tblCidade (nomeCidade, codEstado) values("Quipapá", "16");
insert into tblCidade (nomeCidade, codEstado) values("Quixaba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Recife", "16");
insert into tblCidade (nomeCidade, codEstado) values("Riacho das Almas", "16");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão", "16");
insert into tblCidade (nomeCidade, codEstado) values("Rio Formoso", "16");
insert into tblCidade (nomeCidade, codEstado) values("Sairé", "16");
insert into tblCidade (nomeCidade, codEstado) values("Salgadinho", "16");
insert into tblCidade (nomeCidade, codEstado) values("Salgueiro", "16");
insert into tblCidade (nomeCidade, codEstado) values("Saloá", "16");
insert into tblCidade (nomeCidade, codEstado) values("Sanharó", "16");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz", "16");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz da Baixa Verde", "16");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz do Capibaribe", "16");
insert into tblCidade (nomeCidade, codEstado) values("Santa Filomena", "16");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria da Boa Vista", "16");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria do Cambucá", "16");
insert into tblCidade (nomeCidade, codEstado) values("Santa Terezinha", "16");
insert into tblCidade (nomeCidade, codEstado) values("São Benedito do Sul", "16");
insert into tblCidade (nomeCidade, codEstado) values("São Bento do Una", "16");
insert into tblCidade (nomeCidade, codEstado) values("São Caitano", "16");
insert into tblCidade (nomeCidade, codEstado) values("São João", "16");
insert into tblCidade (nomeCidade, codEstado) values("São Joaquim do Monte", "16");
insert into tblCidade (nomeCidade, codEstado) values("São José da Coroa Grande", "16");
insert into tblCidade (nomeCidade, codEstado) values("São José do Belmonte", "16");
insert into tblCidade (nomeCidade, codEstado) values("São José do Egito", "16");
insert into tblCidade (nomeCidade, codEstado) values("São Lourenço da Mata", "16");
insert into tblCidade (nomeCidade, codEstado) values("São Vicente Ferrer", "16");
insert into tblCidade (nomeCidade, codEstado) values("Serra Talhada", "16");
insert into tblCidade (nomeCidade, codEstado) values("Serrita", "16");
insert into tblCidade (nomeCidade, codEstado) values("Sertânia", "16");
insert into tblCidade (nomeCidade, codEstado) values("Sirinhaém", "16");
insert into tblCidade (nomeCidade, codEstado) values("Solidão", "16");
insert into tblCidade (nomeCidade, codEstado) values("Surubim", "16");
insert into tblCidade (nomeCidade, codEstado) values("Tabira", "16");
insert into tblCidade (nomeCidade, codEstado) values("Tacaimbó", "16");
insert into tblCidade (nomeCidade, codEstado) values("Tacaratu", "16");
insert into tblCidade (nomeCidade, codEstado) values("Tamandaré", "16");
insert into tblCidade (nomeCidade, codEstado) values("Taquaritinga do Norte", "16");
insert into tblCidade (nomeCidade, codEstado) values("Terezinha", "16");
insert into tblCidade (nomeCidade, codEstado) values("Terra Nova", "16");
insert into tblCidade (nomeCidade, codEstado) values("Timbaúba", "16");
insert into tblCidade (nomeCidade, codEstado) values("Toritama", "16");
insert into tblCidade (nomeCidade, codEstado) values("Tracunhaém", "16");
insert into tblCidade (nomeCidade, codEstado) values("Trindade", "16");
insert into tblCidade (nomeCidade, codEstado) values("Triunfo", "16");
insert into tblCidade (nomeCidade, codEstado) values("Tupanatinga", "16");
insert into tblCidade (nomeCidade, codEstado) values("Tuparetama", "16");
insert into tblCidade (nomeCidade, codEstado) values("Venturosa", "16");
insert into tblCidade (nomeCidade, codEstado) values("Verdejante", "16");
insert into tblCidade (nomeCidade, codEstado) values("Vertente do Lério", "16");
insert into tblCidade (nomeCidade, codEstado) values("Vertentes", "16");
insert into tblCidade (nomeCidade, codEstado) values("Vicência", "16");
insert into tblCidade (nomeCidade, codEstado) values("Vitória de Santo Antão", "16");
insert into tblCidade (nomeCidade, codEstado) values("Xexéu", "16");
insert into tblCidade (nomeCidade, codEstado) values("Água Branca", "2");
insert into tblCidade (nomeCidade, codEstado) values("Anadia", "2");
insert into tblCidade (nomeCidade, codEstado) values("Arapiraca", "2");
insert into tblCidade (nomeCidade, codEstado) values("Atalaia", "2");
insert into tblCidade (nomeCidade, codEstado) values("Barra de Santo Antônio", "2");
insert into tblCidade (nomeCidade, codEstado) values("Barra de São Miguel", "2");
insert into tblCidade (nomeCidade, codEstado) values("Batalha", "2");
insert into tblCidade (nomeCidade, codEstado) values("Belém", "2");
insert into tblCidade (nomeCidade, codEstado) values("Belo Monte", "2");
insert into tblCidade (nomeCidade, codEstado) values("Boca da Mata", "2");
insert into tblCidade (nomeCidade, codEstado) values("Branquinha", "2");
insert into tblCidade (nomeCidade, codEstado) values("Cacimbinhas", "2");
insert into tblCidade (nomeCidade, codEstado) values("Cajueiro", "2");
insert into tblCidade (nomeCidade, codEstado) values("Campestre", "2");
insert into tblCidade (nomeCidade, codEstado) values("Campo Alegre", "2");
insert into tblCidade (nomeCidade, codEstado) values("Campo Grande", "2");
insert into tblCidade (nomeCidade, codEstado) values("Canapi", "2");
insert into tblCidade (nomeCidade, codEstado) values("Capela", "2");
insert into tblCidade (nomeCidade, codEstado) values("Carneiros", "2");
insert into tblCidade (nomeCidade, codEstado) values("Chã Preta", "2");
insert into tblCidade (nomeCidade, codEstado) values("Coité do Nóia", "2");
insert into tblCidade (nomeCidade, codEstado) values("Colônia Leopoldina", "2");
insert into tblCidade (nomeCidade, codEstado) values("Coqueiro Seco", "2");
insert into tblCidade (nomeCidade, codEstado) values("Coruripe", "2");
insert into tblCidade (nomeCidade, codEstado) values("Craíbas", "2");
insert into tblCidade (nomeCidade, codEstado) values("Delmiro Gouveia", "2");
insert into tblCidade (nomeCidade, codEstado) values("Dois Riachos", "2");
insert into tblCidade (nomeCidade, codEstado) values("Estrela de Alagoas", "2");
insert into tblCidade (nomeCidade, codEstado) values("Feira Grande", "2");
insert into tblCidade (nomeCidade, codEstado) values("Feliz Deserto", "2");
insert into tblCidade (nomeCidade, codEstado) values("Flexeiras", "2");
insert into tblCidade (nomeCidade, codEstado) values("Girau do Ponciano", "2");
insert into tblCidade (nomeCidade, codEstado) values("Ibateguara", "2");
insert into tblCidade (nomeCidade, codEstado) values("Igaci", "2");
insert into tblCidade (nomeCidade, codEstado) values("Igreja Nova", "2");
insert into tblCidade (nomeCidade, codEstado) values("Inhapi", "2");
insert into tblCidade (nomeCidade, codEstado) values("Jacaré dos Homens", "2");
insert into tblCidade (nomeCidade, codEstado) values("Jacuípe", "2");
insert into tblCidade (nomeCidade, codEstado) values("Japaratinga", "2");
insert into tblCidade (nomeCidade, codEstado) values("Jaramataia", "2");
insert into tblCidade (nomeCidade, codEstado) values("Jequiá da Praia", "2");
insert into tblCidade (nomeCidade, codEstado) values("Joaquim Gomes", "2");
insert into tblCidade (nomeCidade, codEstado) values("Jundiá", "2");
insert into tblCidade (nomeCidade, codEstado) values("Junqueiro", "2");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa da Canoa", "2");
insert into tblCidade (nomeCidade, codEstado) values("Limoeiro de Anadia", "2");
insert into tblCidade (nomeCidade, codEstado) values("Maceió", "2");
insert into tblCidade (nomeCidade, codEstado) values("Major Isidoro", "2");
insert into tblCidade (nomeCidade, codEstado) values("Mar Vermelho", "2");
insert into tblCidade (nomeCidade, codEstado) values("Maragogi", "2");
insert into tblCidade (nomeCidade, codEstado) values("Maravilha", "2");
insert into tblCidade (nomeCidade, codEstado) values("Marechal Deodoro", "2");
insert into tblCidade (nomeCidade, codEstado) values("Maribondo", "2");
insert into tblCidade (nomeCidade, codEstado) values("Mata Grande", "2");
insert into tblCidade (nomeCidade, codEstado) values("Matriz de Camaragibe", "2");
insert into tblCidade (nomeCidade, codEstado) values("Messias", "2");
insert into tblCidade (nomeCidade, codEstado) values("Minador do Negrão", "2");
insert into tblCidade (nomeCidade, codEstado) values("Monteirópolis", "2");
insert into tblCidade (nomeCidade, codEstado) values("Murici", "2");
insert into tblCidade (nomeCidade, codEstado) values("Novo Lino", "2");
insert into tblCidade (nomeCidade, codEstado) values("Olho d'Água das Flores", "2");
insert into tblCidade (nomeCidade, codEstado) values("Olho d'Água do Casado", "2");
insert into tblCidade (nomeCidade, codEstado) values("Olho d'Água Grande", "2");
insert into tblCidade (nomeCidade, codEstado) values("Olivença", "2");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Branco", "2");
insert into tblCidade (nomeCidade, codEstado) values("Palestina", "2");
insert into tblCidade (nomeCidade, codEstado) values("Palmeira dos Índios", "2");
insert into tblCidade (nomeCidade, codEstado) values("Pão de Açúcar", "2");
insert into tblCidade (nomeCidade, codEstado) values("Pariconha", "2");
insert into tblCidade (nomeCidade, codEstado) values("Paripueira", "2");
insert into tblCidade (nomeCidade, codEstado) values("Passo de Camaragibe", "2");
insert into tblCidade (nomeCidade, codEstado) values("Paulo Jacinto", "2");
insert into tblCidade (nomeCidade, codEstado) values("Penedo", "2");
insert into tblCidade (nomeCidade, codEstado) values("Piaçabuçu", "2");
insert into tblCidade (nomeCidade, codEstado) values("Pilar", "2");
insert into tblCidade (nomeCidade, codEstado) values("Pindoba", "2");
insert into tblCidade (nomeCidade, codEstado) values("Piranhas", "2");
insert into tblCidade (nomeCidade, codEstado) values("Poço das Trincheiras", "2");
insert into tblCidade (nomeCidade, codEstado) values("Porto Calvo", "2");
insert into tblCidade (nomeCidade, codEstado) values("Porto de Pedras", "2");
insert into tblCidade (nomeCidade, codEstado) values("Porto Real do Colégio", "2");
insert into tblCidade (nomeCidade, codEstado) values("Quebrangulo", "2");
insert into tblCidade (nomeCidade, codEstado) values("Rio Largo", "2");
insert into tblCidade (nomeCidade, codEstado) values("Roteiro", "2");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia do Norte", "2");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Ipanema", "2");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Mundaú", "2");
insert into tblCidade (nomeCidade, codEstado) values("São Brás", "2");
insert into tblCidade (nomeCidade, codEstado) values("São José da Laje", "2");
insert into tblCidade (nomeCidade, codEstado) values("São José da Tapera", "2");
insert into tblCidade (nomeCidade, codEstado) values("São Luís do Quitunde", "2");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel dos Campos", "2");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel dos Milagres", "2");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião", "2");
insert into tblCidade (nomeCidade, codEstado) values("Satuba", "2");
insert into tblCidade (nomeCidade, codEstado) values("Senador Rui Palmeira", "2");
insert into tblCidade (nomeCidade, codEstado) values("Tanque d'Arca", "2");
insert into tblCidade (nomeCidade, codEstado) values("Taquarana", "2");
insert into tblCidade (nomeCidade, codEstado) values("Teotônio Vilela", "2");
insert into tblCidade (nomeCidade, codEstado) values("Traipu", "2");
insert into tblCidade (nomeCidade, codEstado) values("União dos Palmares", "2");
insert into tblCidade (nomeCidade, codEstado) values("Viçosa", "2");
insert into tblCidade (nomeCidade, codEstado) values("Amparo de São Francisco", "25");
insert into tblCidade (nomeCidade, codEstado) values("Aquidabã", "25");
insert into tblCidade (nomeCidade, codEstado) values("Aracaju", "25");
insert into tblCidade (nomeCidade, codEstado) values("Arauá", "25");
insert into tblCidade (nomeCidade, codEstado) values("Areia Branca", "25");
insert into tblCidade (nomeCidade, codEstado) values("Barra dos Coqueiros", "25");
insert into tblCidade (nomeCidade, codEstado) values("Boquim", "25");
insert into tblCidade (nomeCidade, codEstado) values("Brejo Grande", "25");
insert into tblCidade (nomeCidade, codEstado) values("Campo do Brito", "25");
insert into tblCidade (nomeCidade, codEstado) values("Canhoba", "25");
insert into tblCidade (nomeCidade, codEstado) values("Canindé de São Francisco", "25");
insert into tblCidade (nomeCidade, codEstado) values("Capela", "25");
insert into tblCidade (nomeCidade, codEstado) values("Carira", "25");
insert into tblCidade (nomeCidade, codEstado) values("Carmópolis", "25");
insert into tblCidade (nomeCidade, codEstado) values("Cedro de São João", "25");
insert into tblCidade (nomeCidade, codEstado) values("Cristinápolis", "25");
insert into tblCidade (nomeCidade, codEstado) values("Cumbe", "25");
insert into tblCidade (nomeCidade, codEstado) values("Divina Pastora", "25");
insert into tblCidade (nomeCidade, codEstado) values("Estância", "25");
insert into tblCidade (nomeCidade, codEstado) values("Feira Nova", "25");
insert into tblCidade (nomeCidade, codEstado) values("Frei Paulo", "25");
insert into tblCidade (nomeCidade, codEstado) values("Gararu", "25");
insert into tblCidade (nomeCidade, codEstado) values("General Maynard", "25");
insert into tblCidade (nomeCidade, codEstado) values("Gracho Cardoso", "25");
insert into tblCidade (nomeCidade, codEstado) values("Ilha das Flores", "25");
insert into tblCidade (nomeCidade, codEstado) values("Indiaroba", "25");
insert into tblCidade (nomeCidade, codEstado) values("Itabaiana", "25");
insert into tblCidade (nomeCidade, codEstado) values("Itabaianinha", "25");
insert into tblCidade (nomeCidade, codEstado) values("Itabi", "25");
insert into tblCidade (nomeCidade, codEstado) values("Itaporanga d'Ajuda", "25");
insert into tblCidade (nomeCidade, codEstado) values("Japaratuba", "25");
insert into tblCidade (nomeCidade, codEstado) values("Japoatã", "25");
insert into tblCidade (nomeCidade, codEstado) values("Lagarto", "25");
insert into tblCidade (nomeCidade, codEstado) values("Laranjeiras", "25");
insert into tblCidade (nomeCidade, codEstado) values("Macambira", "25");
insert into tblCidade (nomeCidade, codEstado) values("Malhada dos Bois", "25");
insert into tblCidade (nomeCidade, codEstado) values("Malhador", "25");
insert into tblCidade (nomeCidade, codEstado) values("Maruim", "25");
insert into tblCidade (nomeCidade, codEstado) values("Moita Bonita", "25");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alegre de Sergipe", "25");
insert into tblCidade (nomeCidade, codEstado) values("Muribeca", "25");
insert into tblCidade (nomeCidade, codEstado) values("Neópolis", "25");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora Aparecida", "25");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora da Glória", "25");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora das Dores", "25");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora de Lourdes", "25");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora do Socorro", "25");
insert into tblCidade (nomeCidade, codEstado) values("Pacatuba", "25");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Mole", "25");
insert into tblCidade (nomeCidade, codEstado) values("Pedrinhas", "25");
insert into tblCidade (nomeCidade, codEstado) values("Pinhão", "25");
insert into tblCidade (nomeCidade, codEstado) values("Pirambu", "25");
insert into tblCidade (nomeCidade, codEstado) values("Poço Redondo", "25");
insert into tblCidade (nomeCidade, codEstado) values("Poço Verde", "25");
insert into tblCidade (nomeCidade, codEstado) values("Porto da Folha", "25");
insert into tblCidade (nomeCidade, codEstado) values("Propriá", "25");
insert into tblCidade (nomeCidade, codEstado) values("Riachão do Dantas", "25");
insert into tblCidade (nomeCidade, codEstado) values("Riachuelo", "25");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirópolis", "25");
insert into tblCidade (nomeCidade, codEstado) values("Rosário do Catete", "25");
insert into tblCidade (nomeCidade, codEstado) values("Salgado", "25");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia do Itanhy", "25");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa de Lima", "25");
insert into tblCidade (nomeCidade, codEstado) values("Santana do São Francisco", "25");
insert into tblCidade (nomeCidade, codEstado) values("Santo Amaro das Brotas", "25");
insert into tblCidade (nomeCidade, codEstado) values("São Cristóvão", "25");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos", "25");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco", "25");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Aleixo", "25");
insert into tblCidade (nomeCidade, codEstado) values("Simão Dias", "25");
insert into tblCidade (nomeCidade, codEstado) values("Siriri", "25");
insert into tblCidade (nomeCidade, codEstado) values("Telha", "25");
insert into tblCidade (nomeCidade, codEstado) values("Tobias Barreto", "25");
insert into tblCidade (nomeCidade, codEstado) values("Tomar do Geru", "25");
insert into tblCidade (nomeCidade, codEstado) values("Umbaúba", "25");
insert into tblCidade (nomeCidade, codEstado) values("Abaíra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Abaré", "5");
insert into tblCidade (nomeCidade, codEstado) values("Acajutiba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Adustina", "5");
insert into tblCidade (nomeCidade, codEstado) values("Água Fria", "5");
insert into tblCidade (nomeCidade, codEstado) values("Aiquara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Alagoinhas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Alcobaça", "5");
insert into tblCidade (nomeCidade, codEstado) values("Almadina", "5");
insert into tblCidade (nomeCidade, codEstado) values("Amargosa", "5");
insert into tblCidade (nomeCidade, codEstado) values("Amélia Rodrigues", "5");
insert into tblCidade (nomeCidade, codEstado) values("América Dourada", "5");
insert into tblCidade (nomeCidade, codEstado) values("Anagé", "5");
insert into tblCidade (nomeCidade, codEstado) values("Andaraí", "5");
insert into tblCidade (nomeCidade, codEstado) values("Andorinha", "5");
insert into tblCidade (nomeCidade, codEstado) values("Angical", "5");
insert into tblCidade (nomeCidade, codEstado) values("Anguera", "5");
insert into tblCidade (nomeCidade, codEstado) values("Antas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Cardoso", "5");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Gonçalves", "5");
insert into tblCidade (nomeCidade, codEstado) values("Aporá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Apuarema", "5");
insert into tblCidade (nomeCidade, codEstado) values("Araças", "5");
insert into tblCidade (nomeCidade, codEstado) values("Aracatu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Araci", "5");
insert into tblCidade (nomeCidade, codEstado) values("Aramari", "5");
insert into tblCidade (nomeCidade, codEstado) values("Arataca", "5");
insert into tblCidade (nomeCidade, codEstado) values("Aratuípe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Aurelino Leal", "5");
insert into tblCidade (nomeCidade, codEstado) values("Baianópolis", "5");
insert into tblCidade (nomeCidade, codEstado) values("Baixa Grande", "5");
insert into tblCidade (nomeCidade, codEstado) values("Banzaê", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barra da Estiva", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Choça", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Mendes", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Rocha", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barreiras", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barro Alto", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barro Preto", "5");
insert into tblCidade (nomeCidade, codEstado) values("Barrocas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Belmonte", "5");
insert into tblCidade (nomeCidade, codEstado) values("Belo Campo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Biritinga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Boa Nova", "5");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista do Tupim", "5");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus da Lapa", "5");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus da Serra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Boninal", "5");
insert into tblCidade (nomeCidade, codEstado) values("Bonito", "5");
insert into tblCidade (nomeCidade, codEstado) values("Boquira", "5");
insert into tblCidade (nomeCidade, codEstado) values("Botuporã", "5");
insert into tblCidade (nomeCidade, codEstado) values("Brejões", "5");
insert into tblCidade (nomeCidade, codEstado) values("Brejolândia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Brotas de Macaúbas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Brumado", "5");
insert into tblCidade (nomeCidade, codEstado) values("Buerarema", "5");
insert into tblCidade (nomeCidade, codEstado) values("Buritirama", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caatiba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cabaceiras do Paraguaçu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caculé", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caém", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caetanos", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caetité", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cafarnaum", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cairu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caldeirão Grande", "5");
insert into tblCidade (nomeCidade, codEstado) values("Camacan", "5");
insert into tblCidade (nomeCidade, codEstado) values("Camaçari", "5");
insert into tblCidade (nomeCidade, codEstado) values("Camamu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Campo Alegre de Lourdes", "5");
insert into tblCidade (nomeCidade, codEstado) values("Campo Formoso", "5");
insert into tblCidade (nomeCidade, codEstado) values("Canápolis", "5");
insert into tblCidade (nomeCidade, codEstado) values("Canarana", "5");
insert into tblCidade (nomeCidade, codEstado) values("Canavieiras", "5");
insert into tblCidade (nomeCidade, codEstado) values("Candeal", "5");
insert into tblCidade (nomeCidade, codEstado) values("Candeias", "5");
insert into tblCidade (nomeCidade, codEstado) values("Candiba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cândido Sales", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cansanção", "5");
insert into tblCidade (nomeCidade, codEstado) values("Canudos", "5");
insert into tblCidade (nomeCidade, codEstado) values("Capela do Alto Alegre", "5");
insert into tblCidade (nomeCidade, codEstado) values("Capim Grosso", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caraíbas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caravelas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cardeal da Silva", "5");
insert into tblCidade (nomeCidade, codEstado) values("Carinhanha", "5");
insert into tblCidade (nomeCidade, codEstado) values("Casa Nova", "5");
insert into tblCidade (nomeCidade, codEstado) values("Castro Alves", "5");
insert into tblCidade (nomeCidade, codEstado) values("Catolândia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Catu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Caturama", "5");
insert into tblCidade (nomeCidade, codEstado) values("Central", "5");
insert into tblCidade (nomeCidade, codEstado) values("Chorrochó", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cícero Dantas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cipó", "5");
insert into tblCidade (nomeCidade, codEstado) values("Coaraci", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cocos", "5");
insert into tblCidade (nomeCidade, codEstado) values("Conceição da Feira", "5");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Almeida", "5");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Coité", "5");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Jacuípe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Conde", "5");
insert into tblCidade (nomeCidade, codEstado) values("Condeúba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Contendas do Sincorá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Coração de Maria", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cordeiros", "5");
insert into tblCidade (nomeCidade, codEstado) values("Coribe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Coronel João Sá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Correntina", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cotegipe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cravolândia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Crisópolis", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cristópolis", "5");
insert into tblCidade (nomeCidade, codEstado) values("Cruz das Almas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Curaçá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Dário Meira", "5");
insert into tblCidade (nomeCidade, codEstado) values("Dias d'Ávila", "5");
insert into tblCidade (nomeCidade, codEstado) values("Dom Basílio", "5");
insert into tblCidade (nomeCidade, codEstado) values("Dom Macedo Costa", "5");
insert into tblCidade (nomeCidade, codEstado) values("Elísio Medrado", "5");
insert into tblCidade (nomeCidade, codEstado) values("Encruzilhada", "5");
insert into tblCidade (nomeCidade, codEstado) values("Entre Rios", "5");
insert into tblCidade (nomeCidade, codEstado) values("Érico Cardoso", "5");
insert into tblCidade (nomeCidade, codEstado) values("Esplanada", "5");
insert into tblCidade (nomeCidade, codEstado) values("Euclides da Cunha", "5");
insert into tblCidade (nomeCidade, codEstado) values("Eunápolis", "5");
insert into tblCidade (nomeCidade, codEstado) values("Fátima", "5");
insert into tblCidade (nomeCidade, codEstado) values("Feira da Mata", "5");
insert into tblCidade (nomeCidade, codEstado) values("Feira de Santana", "5");
insert into tblCidade (nomeCidade, codEstado) values("Filadélfia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Firmino Alves", "5");
insert into tblCidade (nomeCidade, codEstado) values("Floresta Azul", "5");
insert into tblCidade (nomeCidade, codEstado) values("Formosa do Rio Preto", "5");
insert into tblCidade (nomeCidade, codEstado) values("Gandu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Gavião", "5");
insert into tblCidade (nomeCidade, codEstado) values("Gentio do Ouro", "5");
insert into tblCidade (nomeCidade, codEstado) values("Glória", "5");
insert into tblCidade (nomeCidade, codEstado) values("Gongogi", "5");
insert into tblCidade (nomeCidade, codEstado) values("Governador Mangabeira", "5");
insert into tblCidade (nomeCidade, codEstado) values("Guajeru", "5");
insert into tblCidade (nomeCidade, codEstado) values("Guanambi", "5");
insert into tblCidade (nomeCidade, codEstado) values("Guaratinga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Heliópolis", "5");
insert into tblCidade (nomeCidade, codEstado) values("Iaçu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibiassucê", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibicaraí", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibicoara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibicuí", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibipeba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibipitanga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibiquera", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibirapitanga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibirapuã", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibirataia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibitiara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibititá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ibotirama", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ichu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Igaporã", "5");
insert into tblCidade (nomeCidade, codEstado) values("Igrapiúna", "5");
insert into tblCidade (nomeCidade, codEstado) values("Iguaí", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ilhéus", "5");
insert into tblCidade (nomeCidade, codEstado) values("Inhambupe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ipecaetá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ipiaú", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ipirá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ipupiara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Irajuba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Iramaia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Iraquara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Irará", "5");
insert into tblCidade (nomeCidade, codEstado) values("Irecê", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itabela", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itaberaba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itabuna", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itacaré", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itaeté", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itagi", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itagibá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itagimirim", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itaguaçu da Bahia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itaju do Colônia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itajuípe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itamaraju", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itamari", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itambé", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itanagra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itanhém", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itaparica", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itapé", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itapebi", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itapetinga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itapicuru", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itapitanga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itaquara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itarantim", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itatim", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itiruçu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itiúba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Itororó", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ituaçu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ituberá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Iuiú", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jaborandi", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jacaraci", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jacobina", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaquara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jaguarari", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaripe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jandaíra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jequié", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jeremoabo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jiquiriçá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jitaúna", "5");
insert into tblCidade (nomeCidade, codEstado) values("João Dourado", "5");
insert into tblCidade (nomeCidade, codEstado) values("Juazeiro", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jucuruçu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jussara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jussari", "5");
insert into tblCidade (nomeCidade, codEstado) values("Jussiape", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lafaiete Coutinho", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Real", "5");
insert into tblCidade (nomeCidade, codEstado) values("Laje", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lajedão", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lajedinho", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lajedo do Tabocal", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lamarão", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lapão", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lauro de Freitas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Lençóis", "5");
insert into tblCidade (nomeCidade, codEstado) values("Licínio de Almeida", "5");
insert into tblCidade (nomeCidade, codEstado) values("Livramento de Nossa Senhora", "5");
insert into tblCidade (nomeCidade, codEstado) values("Luís Eduardo Magalhães", "5");
insert into tblCidade (nomeCidade, codEstado) values("Macajuba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Macarani", "5");
insert into tblCidade (nomeCidade, codEstado) values("Macaúbas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Macururé", "5");
insert into tblCidade (nomeCidade, codEstado) values("Madre de Deus", "5");
insert into tblCidade (nomeCidade, codEstado) values("Maetinga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Maiquinique", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mairi", "5");
insert into tblCidade (nomeCidade, codEstado) values("Malhada", "5");
insert into tblCidade (nomeCidade, codEstado) values("Malhada de Pedras", "5");
insert into tblCidade (nomeCidade, codEstado) values("Manoel Vitorino", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mansidão", "5");
insert into tblCidade (nomeCidade, codEstado) values("Maracás", "5");
insert into tblCidade (nomeCidade, codEstado) values("Maragogipe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Maraú", "5");
insert into tblCidade (nomeCidade, codEstado) values("Marcionílio Souza", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mascote", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mata de São João", "5");
insert into tblCidade (nomeCidade, codEstado) values("Matina", "5");
insert into tblCidade (nomeCidade, codEstado) values("Medeiros Neto", "5");
insert into tblCidade (nomeCidade, codEstado) values("Miguel Calmon", "5");
insert into tblCidade (nomeCidade, codEstado) values("Milagres", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mirangaba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mirante", "5");
insert into tblCidade (nomeCidade, codEstado) values("Monte Santo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Morpará", "5");
insert into tblCidade (nomeCidade, codEstado) values("Morro do Chapéu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mortugaba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mucugê", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mucuri", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mulungu do Morro", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mundo Novo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Muniz Ferreira", "5");
insert into tblCidade (nomeCidade, codEstado) values("Muquém de São Francisco", "5");
insert into tblCidade (nomeCidade, codEstado) values("Muritiba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Mutuípe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nazaré", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nilo Peçanha", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nordestina", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nova Canaã", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nova Fátima", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nova Ibiá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nova Itarana", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nova Redenção", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nova Soure", "5");
insert into tblCidade (nomeCidade, codEstado) values("Nova Viçosa", "5");
insert into tblCidade (nomeCidade, codEstado) values("Novo Horizonte", "5");
insert into tblCidade (nomeCidade, codEstado) values("Novo Triunfo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Olindina", "5");
insert into tblCidade (nomeCidade, codEstado) values("Oliveira dos Brejinhos", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ouriçangas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ourolândia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Palmas de Monte Alto", "5");
insert into tblCidade (nomeCidade, codEstado) values("Palmeiras", "5");
insert into tblCidade (nomeCidade, codEstado) values("Paramirim", "5");
insert into tblCidade (nomeCidade, codEstado) values("Paratinga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Paripiranga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pau Brasil", "5");
insert into tblCidade (nomeCidade, codEstado) values("Paulo Afonso", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pé de Serra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pedrão", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Alexandre", "5");
insert into tblCidade (nomeCidade, codEstado) values("Piatã", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pilão Arcado", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pindaí", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pindobaçu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pintadas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Piraí do Norte", "5");
insert into tblCidade (nomeCidade, codEstado) values("Piripá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Piritiba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Planaltino", "5");
insert into tblCidade (nomeCidade, codEstado) values("Planalto", "5");
insert into tblCidade (nomeCidade, codEstado) values("Poções", "5");
insert into tblCidade (nomeCidade, codEstado) values("Pojuca", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ponto Novo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Porto Seguro", "5");
insert into tblCidade (nomeCidade, codEstado) values("Potiraguá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Prado", "5");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Dutra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Jânio Quadros", "5");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Tancredo Neves", "5");
insert into tblCidade (nomeCidade, codEstado) values("Queimadas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Quijingue", "5");
insert into tblCidade (nomeCidade, codEstado) values("Quixabeira", "5");
insert into tblCidade (nomeCidade, codEstado) values("Rafael Jambeiro", "5");
insert into tblCidade (nomeCidade, codEstado) values("Remanso", "5");
insert into tblCidade (nomeCidade, codEstado) values("Retirolândia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Riachão das Neves", "5");
insert into tblCidade (nomeCidade, codEstado) values("Riachão do Jacuípe", "5");
insert into tblCidade (nomeCidade, codEstado) values("Riacho de Santana", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ribeira do Amparo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ribeira do Pombal", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão do Largo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Rio de Contas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Rio do Antônio", "5");
insert into tblCidade (nomeCidade, codEstado) values("Rio do Pires", "5");
insert into tblCidade (nomeCidade, codEstado) values("Rio Real", "5");
insert into tblCidade (nomeCidade, codEstado) values("Rodelas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ruy Barbosa", "5");
insert into tblCidade (nomeCidade, codEstado) values("Salinas da Margarida", "5");
insert into tblCidade (nomeCidade, codEstado) values("Salvador", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Brígida", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz Cabrália", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz da Vitória", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Inês", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria da Vitória", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita de Cássia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santa Teresinha", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santaluz", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santana", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santanópolis", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santo Amaro", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio de Jesus", "5");
insert into tblCidade (nomeCidade, codEstado) values("Santo Estêvão", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Desidério", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Felipe", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Félix", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Félix do Coribe", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Conde", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Gabriel", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo dos Campos", "5");
insert into tblCidade (nomeCidade, codEstado) values("São José da Vitória", "5");
insert into tblCidade (nomeCidade, codEstado) values("São José do Jacuípe", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel das Matas", "5");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Passé", "5");
insert into tblCidade (nomeCidade, codEstado) values("Sapeaçu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Sátiro Dias", "5");
insert into tblCidade (nomeCidade, codEstado) values("Saubara", "5");
insert into tblCidade (nomeCidade, codEstado) values("Saúde", "5");
insert into tblCidade (nomeCidade, codEstado) values("Seabra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Sebastião Laranjeiras", "5");
insert into tblCidade (nomeCidade, codEstado) values("Senhor do Bonfim", "5");
insert into tblCidade (nomeCidade, codEstado) values("Sento Sé", "5");
insert into tblCidade (nomeCidade, codEstado) values("Serra do Ramalho", "5");
insert into tblCidade (nomeCidade, codEstado) values("Serra Dourada", "5");
insert into tblCidade (nomeCidade, codEstado) values("Serra Preta", "5");
insert into tblCidade (nomeCidade, codEstado) values("Serrinha", "5");
insert into tblCidade (nomeCidade, codEstado) values("Serrolândia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Simões Filho", "5");
insert into tblCidade (nomeCidade, codEstado) values("Sítio do Mato", "5");
insert into tblCidade (nomeCidade, codEstado) values("Sítio do Quinto", "5");
insert into tblCidade (nomeCidade, codEstado) values("Sobradinho", "5");
insert into tblCidade (nomeCidade, codEstado) values("Souto Soares", "5");
insert into tblCidade (nomeCidade, codEstado) values("Tabocas do Brejo Velho", "5");
insert into tblCidade (nomeCidade, codEstado) values("Tanhaçu", "5");
insert into tblCidade (nomeCidade, codEstado) values("Tanque Novo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Tanquinho", "5");
insert into tblCidade (nomeCidade, codEstado) values("Taperoá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Tapiramutá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Teixeira de Freitas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Teodoro Sampaio", "5");
insert into tblCidade (nomeCidade, codEstado) values("Teofilândia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Teolândia", "5");
insert into tblCidade (nomeCidade, codEstado) values("Terra Nova", "5");
insert into tblCidade (nomeCidade, codEstado) values("Tremedal", "5");
insert into tblCidade (nomeCidade, codEstado) values("Tucano", "5");
insert into tblCidade (nomeCidade, codEstado) values("Uauá", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ubaíra", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ubaitaba", "5");
insert into tblCidade (nomeCidade, codEstado) values("Ubatã", "5");
insert into tblCidade (nomeCidade, codEstado) values("Uibaí", "5");
insert into tblCidade (nomeCidade, codEstado) values("Umburanas", "5");
insert into tblCidade (nomeCidade, codEstado) values("Una", "5");
insert into tblCidade (nomeCidade, codEstado) values("Urandi", "5");
insert into tblCidade (nomeCidade, codEstado) values("Uruçuca", "5");
insert into tblCidade (nomeCidade, codEstado) values("Utinga", "5");
insert into tblCidade (nomeCidade, codEstado) values("Valença", "5");
insert into tblCidade (nomeCidade, codEstado) values("Valente", "5");
insert into tblCidade (nomeCidade, codEstado) values("Várzea da Roça", "5");
insert into tblCidade (nomeCidade, codEstado) values("Várzea do Poço", "5");
insert into tblCidade (nomeCidade, codEstado) values("Várzea Nova", "5");
insert into tblCidade (nomeCidade, codEstado) values("Varzedo", "5");
insert into tblCidade (nomeCidade, codEstado) values("Vera Cruz", "5");
insert into tblCidade (nomeCidade, codEstado) values("Vereda", "5");
insert into tblCidade (nomeCidade, codEstado) values("Vitória da Conquista", "5");
insert into tblCidade (nomeCidade, codEstado) values("Wagner", "5");
insert into tblCidade (nomeCidade, codEstado) values("Wanderley", "5");
insert into tblCidade (nomeCidade, codEstado) values("Wenceslau Guimarães", "5");
insert into tblCidade (nomeCidade, codEstado) values("Xique-Xique", "5");
insert into tblCidade (nomeCidade, codEstado) values("Abadia dos Dourados", "11");
insert into tblCidade (nomeCidade, codEstado) values("Abaeté", "11");
insert into tblCidade (nomeCidade, codEstado) values("Abre Campo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Acaiaca", "11");
insert into tblCidade (nomeCidade, codEstado) values("Açucena", "11");
insert into tblCidade (nomeCidade, codEstado) values("Água Boa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Água Comprida", "11");
insert into tblCidade (nomeCidade, codEstado) values("Aguanil", "11");
insert into tblCidade (nomeCidade, codEstado) values("Águas Formosas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Águas Vermelhas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Aimorés", "11");
insert into tblCidade (nomeCidade, codEstado) values("Aiuruoca", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alagoa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Albertina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Além Paraíba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alfenas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alfredo Vasconcelos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Almenara", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alpercata", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alpinópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alterosa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alto Caparaó", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alto Jequitibá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alto Rio Doce", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alvarenga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alvinópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Alvorada de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Amparo do Serra", "11");
insert into tblCidade (nomeCidade, codEstado) values("Andradas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Andrelândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Angelândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Carlos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Dias", "11");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Prado de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Araçaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Aracitaba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Araçuaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Araguari", "11");
insert into tblCidade (nomeCidade, codEstado) values("Arantina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Araponga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Araporã", "11");
insert into tblCidade (nomeCidade, codEstado) values("Arapuá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Araújos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Araxá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Arceburgo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Arcos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Areado", "11");
insert into tblCidade (nomeCidade, codEstado) values("Argirita", "11");
insert into tblCidade (nomeCidade, codEstado) values("Aricanduva", "11");
insert into tblCidade (nomeCidade, codEstado) values("Arinos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Astolfo Dutra", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ataléia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Augusto de Lima", "11");
insert into tblCidade (nomeCidade, codEstado) values("Baependi", "11");
insert into tblCidade (nomeCidade, codEstado) values("Baldim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bambuí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bandeira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bandeira do Sul", "11");
insert into tblCidade (nomeCidade, codEstado) values("Barão de Cocais", "11");
insert into tblCidade (nomeCidade, codEstado) values("Barão de Monte Alto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Barbacena", "11");
insert into tblCidade (nomeCidade, codEstado) values("Barra Longa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Barroso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bela Vista de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Belmiro Braga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Belo Horizonte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Belo Oriente", "11");
insert into tblCidade (nomeCidade, codEstado) values("Belo Vale", "11");
insert into tblCidade (nomeCidade, codEstado) values("Berilo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Berizal", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bertópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Betim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bias Fortes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bicas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Biquinhas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Boa Esperança", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bocaina de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bocaiúva", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bom Despacho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jardim de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus da Penha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Amparo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Galho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bom Repouso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bom Sucesso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bonfim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bonfinópolis de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bonito de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Borda da Mata", "11");
insert into tblCidade (nomeCidade, codEstado) values("Botelhos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Botumirim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Brás Pires", "11");
insert into tblCidade (nomeCidade, codEstado) values("Brasilândia de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Brasília de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Brasópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Braúnas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Brumadinho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bueno Brandão", "11");
insert into tblCidade (nomeCidade, codEstado) values("Buenópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Bugre", "11");
insert into tblCidade (nomeCidade, codEstado) values("Buritis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Buritizeiro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cabeceira Grande", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cabo Verde", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira da Prata", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira de Pajeú", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira Dourada", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caetanópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caeté", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caiana", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cajuri", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caldas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Camacho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Camanducaia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cambuí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cambuquira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campanário", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campanha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campestre", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campina Verde", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campo Azul", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campo Belo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campo do Meio", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campo Florido", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campos Altos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Campos Gerais", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cana Verde", "11");
insert into tblCidade (nomeCidade, codEstado) values("Canaã", "11");
insert into tblCidade (nomeCidade, codEstado) values("Canápolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Candeias", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cantagalo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caparaó", "11");
insert into tblCidade (nomeCidade, codEstado) values("Capela Nova", "11");
insert into tblCidade (nomeCidade, codEstado) values("Capelinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Capetinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Capim Branco", "11");
insert into tblCidade (nomeCidade, codEstado) values("Capinópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Capitão Andrade", "11");
insert into tblCidade (nomeCidade, codEstado) values("Capitão Enéas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Capitólio", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caputira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caraí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caranaíba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carandaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carangola", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caratinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carbonita", "11");
insert into tblCidade (nomeCidade, codEstado) values("Careaçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carlos Chagas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carmésia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carmo da Cachoeira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carmo da Mata", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carmo de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carmo do Cajuru", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carmo do Paranaíba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carmo do Rio Claro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carmópolis de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carneirinho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carrancas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carvalhópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Carvalhos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Casa Grande", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cascalho Rico", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cássia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cataguases", "11");
insert into tblCidade (nomeCidade, codEstado) values("Catas Altas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Catas Altas da Noruega", "11");
insert into tblCidade (nomeCidade, codEstado) values("Catuji", "11");
insert into tblCidade (nomeCidade, codEstado) values("Catuti", "11");
insert into tblCidade (nomeCidade, codEstado) values("Caxambu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cedro do Abaeté", "11");
insert into tblCidade (nomeCidade, codEstado) values("Central de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Centralina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Chácara", "11");
insert into tblCidade (nomeCidade, codEstado) values("Chalé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Chapada do Norte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Chapada Gaúcha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Chiador", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cipotânea", "11");
insert into tblCidade (nomeCidade, codEstado) values("Claraval", "11");
insert into tblCidade (nomeCidade, codEstado) values("Claro dos Poções", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cláudio", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coimbra", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coluna", "11");
insert into tblCidade (nomeCidade, codEstado) values("Comendador Gomes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Comercinho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição da Aparecida", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição da Barra de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição das Alagoas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição das Pedras", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição de Ipanema", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Mato Dentro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Pará", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Rio Verde", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conceição dos Ouros", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cônego Marinho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Confins", "11");
insert into tblCidade (nomeCidade, codEstado) values("Congonhal", "11");
insert into tblCidade (nomeCidade, codEstado) values("Congonhas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Congonhas do Norte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conquista", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conselheiro Lafaiete", "11");
insert into tblCidade (nomeCidade, codEstado) values("Conselheiro Pena", "11");
insert into tblCidade (nomeCidade, codEstado) values("Consolação", "11");
insert into tblCidade (nomeCidade, codEstado) values("Contagem", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coqueiral", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coração de Jesus", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cordisburgo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cordislândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Corinto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coroaci", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coromandel", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Fabriciano", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Murta", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Pacheco", "11");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Xavier Chaves", "11");
insert into tblCidade (nomeCidade, codEstado) values("Córrego Danta", "11");
insert into tblCidade (nomeCidade, codEstado) values("Córrego do Bom Jesus", "11");
insert into tblCidade (nomeCidade, codEstado) values("Córrego Fundo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Córrego Novo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Couto de Magalhães de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Crisólita", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cristais", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cristália", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cristiano Otoni", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cristina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Crucilândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cruzeiro da Fortaleza", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cruzília", "11");
insert into tblCidade (nomeCidade, codEstado) values("Cuparaque", "11");
insert into tblCidade (nomeCidade, codEstado) values("Curral de Dentro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Curvelo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Datas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Delfim Moreira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Delfinópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Delta", "11");
insert into tblCidade (nomeCidade, codEstado) values("Descoberto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Desterro de Entre Rios", "11");
insert into tblCidade (nomeCidade, codEstado) values("Desterro do Melo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Diamantina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Diogo de Vasconcelos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dionísio", "11");
insert into tblCidade (nomeCidade, codEstado) values("Divinésia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Divino", "11");
insert into tblCidade (nomeCidade, codEstado) values("Divino das Laranjeiras", "11");
insert into tblCidade (nomeCidade, codEstado) values("Divinolândia de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Divinópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Divisa Alegre", "11");
insert into tblCidade (nomeCidade, codEstado) values("Divisa Nova", "11");
insert into tblCidade (nomeCidade, codEstado) values("Divisópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dom Bosco", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dom Cavati", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dom Joaquim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dom Silvério", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dom Viçoso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dona Eusébia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dores de Campos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dores de Guanhães", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dores do Indaiá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Dores do Turvo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Doresópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Douradoquara", "11");
insert into tblCidade (nomeCidade, codEstado) values("Durandé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Elói Mendes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Engenheiro Caldas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Engenheiro Navarro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Entre Folhas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Entre Rios de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ervália", "11");
insert into tblCidade (nomeCidade, codEstado) values("Esmeraldas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Espera Feliz", "11");
insert into tblCidade (nomeCidade, codEstado) values("Espinosa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Espírito Santo do Dourado", "11");
insert into tblCidade (nomeCidade, codEstado) values("Estiva", "11");
insert into tblCidade (nomeCidade, codEstado) values("Estrela Dalva", "11");
insert into tblCidade (nomeCidade, codEstado) values("Estrela do Indaiá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Estrela do Sul", "11");
insert into tblCidade (nomeCidade, codEstado) values("Eugenópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ewbank da Câmara", "11");
insert into tblCidade (nomeCidade, codEstado) values("Extrema", "11");
insert into tblCidade (nomeCidade, codEstado) values("Fama", "11");
insert into tblCidade (nomeCidade, codEstado) values("Faria Lemos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Felício dos Santos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Felisburgo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Felixlândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Fernandes Tourinho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ferros", "11");
insert into tblCidade (nomeCidade, codEstado) values("Fervedouro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Florestal", "11");
insert into tblCidade (nomeCidade, codEstado) values("Formiga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Formoso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Fortaleza de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Fortuna de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Badaró", "11");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Dumont", "11");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Sá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Franciscópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Frei Gaspar", "11");
insert into tblCidade (nomeCidade, codEstado) values("Frei Inocêncio", "11");
insert into tblCidade (nomeCidade, codEstado) values("Frei Lagonegro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Fronteira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Fronteira dos Vales", "11");
insert into tblCidade (nomeCidade, codEstado) values("Fruta de Leite", "11");
insert into tblCidade (nomeCidade, codEstado) values("Frutal", "11");
insert into tblCidade (nomeCidade, codEstado) values("Funilândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Galiléia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Gameleiras", "11");
insert into tblCidade (nomeCidade, codEstado) values("Glaucilândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Goiabeira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Goianá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Gonçalves", "11");
insert into tblCidade (nomeCidade, codEstado) values("Gonzaga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Gouveia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Governador Valadares", "11");
insert into tblCidade (nomeCidade, codEstado) values("Grão Mogol", "11");
insert into tblCidade (nomeCidade, codEstado) values("Grupiara", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guanhães", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guapé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guaraciaba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guaraciama", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guaranésia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guarani", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guarará", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guarda-Mor", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guaxupé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guidoval", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guimarânia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Guiricema", "11");
insert into tblCidade (nomeCidade, codEstado) values("Gurinhatã", "11");
insert into tblCidade (nomeCidade, codEstado) values("Heliodora", "11");
insert into tblCidade (nomeCidade, codEstado) values("Iapu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ibertioga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ibiá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ibiaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ibiracatu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ibiraci", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ibirité", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ibitiúra de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ibituruna", "11");
insert into tblCidade (nomeCidade, codEstado) values("Icaraí de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Igarapé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Igaratinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Iguatama", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ijaci", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ilicínea", "11");
insert into tblCidade (nomeCidade, codEstado) values("Imbé de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Inconfidentes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Indaiabira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Indianópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ingaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Inhapim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Inhaúma", "11");
insert into tblCidade (nomeCidade, codEstado) values("Inimutaba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ipaba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ipanema", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ipatinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ipiaçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ipuiúna", "11");
insert into tblCidade (nomeCidade, codEstado) values("Iraí de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itabira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itabirinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itabirito", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itacambira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itacarambi", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itaguara", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itaipé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itajubá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itamarandiba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itamarati de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itambacuri", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itambé do Mato Dentro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itamogi", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itamonte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itanhandu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itanhomi", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itaobim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itapagipe", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itapecerica", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itapeva", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itatiaiuçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itaú de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itaúna", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itaverava", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itueta", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ituiutaba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itumirim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Iturama", "11");
insert into tblCidade (nomeCidade, codEstado) values("Itutinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jaboticatubas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jacinto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jacuí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jacutinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaraçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jaíba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jampruca", "11");
insert into tblCidade (nomeCidade, codEstado) values("Janaúba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Januária", "11");
insert into tblCidade (nomeCidade, codEstado) values("Japaraíba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Japonvar", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jeceaba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jenipapo de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jequeri", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jequitaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jequitibá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jequitinhonha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jesuânia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Joaíma", "11");
insert into tblCidade (nomeCidade, codEstado) values("Joanésia", "11");
insert into tblCidade (nomeCidade, codEstado) values("João Monlevade", "11");
insert into tblCidade (nomeCidade, codEstado) values("João Pinheiro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Joaquim Felício", "11");
insert into tblCidade (nomeCidade, codEstado) values("Jordânia", "11");
insert into tblCidade (nomeCidade, codEstado) values("José Gonçalves de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("José Raydan", "11");
insert into tblCidade (nomeCidade, codEstado) values("Josenópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Juatuba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Juiz de Fora", "11");
insert into tblCidade (nomeCidade, codEstado) values("Juramento", "11");
insert into tblCidade (nomeCidade, codEstado) values("Juruaia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Juvenília", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ladainha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lagamar", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa da Prata", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa dos Patos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Dourada", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Formosa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Grande", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Santa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lajinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lambari", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lamim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Laranjal", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lassance", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lavras", "11");
insert into tblCidade (nomeCidade, codEstado) values("Leandro Ferreira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Leme do Prado", "11");
insert into tblCidade (nomeCidade, codEstado) values("Leopoldina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Liberdade", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lima Duarte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Limeira do Oeste", "11");
insert into tblCidade (nomeCidade, codEstado) values("Lontra", "11");
insert into tblCidade (nomeCidade, codEstado) values("Luisburgo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Luislândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Luminárias", "11");
insert into tblCidade (nomeCidade, codEstado) values("Luz", "11");
insert into tblCidade (nomeCidade, codEstado) values("Machacalis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Machado", "11");
insert into tblCidade (nomeCidade, codEstado) values("Madre de Deus de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Malacacheta", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mamonas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Manga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Manhuaçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Manhumirim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mantena", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mar de Espanha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Maravilhas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Maria da Fé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mariana", "11");
insert into tblCidade (nomeCidade, codEstado) values("Marilac", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mário Campos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Maripá de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Marliéria", "11");
insert into tblCidade (nomeCidade, codEstado) values("Marmelópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Martinho Campos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Martins Soares", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mata Verde", "11");
insert into tblCidade (nomeCidade, codEstado) values("Materlândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mateus Leme", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mathias Lobato", "11");
insert into tblCidade (nomeCidade, codEstado) values("Matias Barbosa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Matias Cardoso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Matipó", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mato Verde", "11");
insert into tblCidade (nomeCidade, codEstado) values("Matozinhos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Matutina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Medeiros", "11");
insert into tblCidade (nomeCidade, codEstado) values("Medina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mendes Pimentel", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mercês", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mesquita", "11");
insert into tblCidade (nomeCidade, codEstado) values("Minas Novas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Minduri", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mirabela", "11");
insert into tblCidade (nomeCidade, codEstado) values("Miradouro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Miraí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Miravânia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Moeda", "11");
insert into tblCidade (nomeCidade, codEstado) values("Moema", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monjolos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monsenhor Paulo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Montalvânia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alegre de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monte Azul", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monte Belo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monte Carmelo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monte Formoso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monte Santo de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Monte Sião", "11");
insert into tblCidade (nomeCidade, codEstado) values("Montes Claros", "11");
insert into tblCidade (nomeCidade, codEstado) values("Montezuma", "11");
insert into tblCidade (nomeCidade, codEstado) values("Morada Nova de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Morro da Garça", "11");
insert into tblCidade (nomeCidade, codEstado) values("Morro do Pilar", "11");
insert into tblCidade (nomeCidade, codEstado) values("Munhoz", "11");
insert into tblCidade (nomeCidade, codEstado) values("Muriaé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Mutum", "11");
insert into tblCidade (nomeCidade, codEstado) values("Muzambinho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nacip Raydan", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nanuque", "11");
insert into tblCidade (nomeCidade, codEstado) values("Naque", "11");
insert into tblCidade (nomeCidade, codEstado) values("Natalândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Natércia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nazareno", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nepomuceno", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ninheira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova Belém", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova Era", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova Lima", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova Módica", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova Ponte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova Porteirinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova Resende", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova Serrana", "11");
insert into tblCidade (nomeCidade, codEstado) values("Nova União", "11");
insert into tblCidade (nomeCidade, codEstado) values("Novo Cruzeiro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Novo Oriente de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Novorizonte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Olaria", "11");
insert into tblCidade (nomeCidade, codEstado) values("Olhos-d'Água", "11");
insert into tblCidade (nomeCidade, codEstado) values("Olímpio Noronha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Oliveira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Oliveira Fortes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Onça de Pitangui", "11");
insert into tblCidade (nomeCidade, codEstado) values("Oratórios", "11");
insert into tblCidade (nomeCidade, codEstado) values("Orizânia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Branco", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Fino", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Preto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Verde de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Padre Carvalho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Padre Paraíso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pai Pedro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Paineiras", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pains", "11");
insert into tblCidade (nomeCidade, codEstado) values("Paiva", "11");
insert into tblCidade (nomeCidade, codEstado) values("Palma", "11");
insert into tblCidade (nomeCidade, codEstado) values("Palmópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Papagaios", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pará de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Paracatu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Paraguaçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Paraisópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Paraopeba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Passa Quatro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Passa Tempo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Passabém", "11");
insert into tblCidade (nomeCidade, codEstado) values("Passa-Vinte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Passos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Patis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Patos de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Patrocínio", "11");
insert into tblCidade (nomeCidade, codEstado) values("Patrocínio do Muriaé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Paula Cândido", "11");
insert into tblCidade (nomeCidade, codEstado) values("Paulistas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pavão", "11");
insert into tblCidade (nomeCidade, codEstado) values("Peçanha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Azul", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Bonita", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedra do Anta", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedra do Indaiá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Dourada", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedralva", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedras de Maria da Cruz", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedrinópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Leopoldo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Teixeira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pequeri", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pequi", "11");
insert into tblCidade (nomeCidade, codEstado) values("Perdigão", "11");
insert into tblCidade (nomeCidade, codEstado) values("Perdizes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Perdões", "11");
insert into tblCidade (nomeCidade, codEstado) values("Periquito", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pescador", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piau", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piedade de Caratinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piedade de Ponte Nova", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piedade do Rio Grande", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piedade dos Gerais", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pimenta", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pingo-d'Água", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pintópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piracema", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pirajuba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piranga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piranguçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piranguinho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pirapetinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pirapora", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piraúba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pitangui", "11");
insert into tblCidade (nomeCidade, codEstado) values("Piumhi", "11");
insert into tblCidade (nomeCidade, codEstado) values("Planura", "11");
insert into tblCidade (nomeCidade, codEstado) values("Poço Fundo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Poços de Caldas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pocrane", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pompéu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ponte Nova", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ponto Chique", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ponto dos Volantes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Porteirinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Porto Firme", "11");
insert into tblCidade (nomeCidade, codEstado) values("Poté", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pouso Alegre", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pouso Alto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Prados", "11");
insert into tblCidade (nomeCidade, codEstado) values("Prata", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pratápolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Pratinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Bernardes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Juscelino", "11");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Kubitschek", "11");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Olegário", "11");
insert into tblCidade (nomeCidade, codEstado) values("Prudente de Morais", "11");
insert into tblCidade (nomeCidade, codEstado) values("Quartel Geral", "11");
insert into tblCidade (nomeCidade, codEstado) values("Queluzito", "11");
insert into tblCidade (nomeCidade, codEstado) values("Raposos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Raul Soares", "11");
insert into tblCidade (nomeCidade, codEstado) values("Recreio", "11");
insert into tblCidade (nomeCidade, codEstado) values("Reduto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Resende Costa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Resplendor", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ressaquinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Riachinho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Riacho dos Machados", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão das Neves", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Vermelho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Acima", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Casca", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio do Prado", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Doce", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Espera", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Manso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Novo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Paranaíba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Pardo de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Piracicaba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Pomba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Preto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rio Vermelho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ritápolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rochedo de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rodeiro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Romaria", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rosário da Limeira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rubelita", "11");
insert into tblCidade (nomeCidade, codEstado) values("Rubim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sabará", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sabinópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sacramento", "11");
insert into tblCidade (nomeCidade, codEstado) values("Salinas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Salto da Divisa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara do Leste", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara do Monte Verde", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara do Tugúrio", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz de Salinas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz do Escalvado", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Efigênia de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Fé de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Helena de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Juliana", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Luzia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Margarida", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria de Itabira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria do Salto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria do Suaçuí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita de Caldas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita de Ibitipoca", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita de Jacutinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita do Itueto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita do Sapucaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa da Serra", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santa Vitória", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana da Vargem", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana de Cataguases", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana de Pirapama", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Deserto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Garambéu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Jacaré", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Manhuaçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Paraíso", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Riacho", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santana dos Montes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Amparo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Aventureiro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Grama", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Itambé", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Jacinto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Monte", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Retiro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Rio Abaixo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santo Hipólito", "11");
insert into tblCidade (nomeCidade, codEstado) values("Santos Dumont", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Bento Abade", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Brás do Suaçuí", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos das Dores", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos do Prata", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Félix de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco de Paula", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco de Sales", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Glória", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Geraldo", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Geraldo da Piedade", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Geraldo do Baixio", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Abaeté", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Pará", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Rio Abaixo", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Rio Preto", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo do Sapucaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Gotardo", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João Batista do Glória", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João da Lagoa", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João da Mata", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João da Ponte", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João das Missões", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João del Rei", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João do Manhuaçu", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João do Manteninha", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João do Oriente", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João do Pacuí", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João do Paraíso", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João Evangelista", "11");
insert into tblCidade (nomeCidade, codEstado) values("São João Nepomuceno", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Joaquim de Bicas", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José da Barra", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José da Lapa", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José da Safira", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José da Varginha", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José do Alegre", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José do Divino", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José do Goiabal", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José do Jacuri", "11");
insert into tblCidade (nomeCidade, codEstado) values("São José do Mantimento", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Lourenço", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Anta", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro da União", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro do Suaçuí", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro dos Ferros", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Romão", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Roque de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião da Bela Vista", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião da Vargem Alegre", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Anta", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Maranhão", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Oeste", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Paraíso", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Rio Preto", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Rio Verde", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Thomé das Letras", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Tiago", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Tomás de Aquino", "11");
insert into tblCidade (nomeCidade, codEstado) values("São Vicente de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sapucaí-Mirim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sardoá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sarzedo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sem-Peixe", "11");
insert into tblCidade (nomeCidade, codEstado) values("Senador Amaral", "11");
insert into tblCidade (nomeCidade, codEstado) values("Senador Cortes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Senador Firmino", "11");
insert into tblCidade (nomeCidade, codEstado) values("Senador José Bento", "11");
insert into tblCidade (nomeCidade, codEstado) values("Senador Modestino Gonçalves", "11");
insert into tblCidade (nomeCidade, codEstado) values("Senhora de Oliveira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Senhora do Porto", "11");
insert into tblCidade (nomeCidade, codEstado) values("Senhora dos Remédios", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sericita", "11");
insert into tblCidade (nomeCidade, codEstado) values("Seritinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Serra Azul de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Serra da Saudade", "11");
insert into tblCidade (nomeCidade, codEstado) values("Serra do Salitre", "11");
insert into tblCidade (nomeCidade, codEstado) values("Serra dos Aimorés", "11");
insert into tblCidade (nomeCidade, codEstado) values("Serrania", "11");
insert into tblCidade (nomeCidade, codEstado) values("Serranópolis de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Serranos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Serro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sete Lagoas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Setubinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Silveirânia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Silvianópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Simão Pereira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Simonésia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Sobrália", "11");
insert into tblCidade (nomeCidade, codEstado) values("Soledade de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tabuleiro", "11");
insert into tblCidade (nomeCidade, codEstado) values("Taiobeiras", "11");
insert into tblCidade (nomeCidade, codEstado) values("Taparuba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tapira", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tapiraí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Taquaraçu de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tarumirim", "11");
insert into tblCidade (nomeCidade, codEstado) values("Teixeiras", "11");
insert into tblCidade (nomeCidade, codEstado) values("Teófilo Otoni", "11");
insert into tblCidade (nomeCidade, codEstado) values("Timóteo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tiradentes", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tiros", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tocantins", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tocos do Moji", "11");
insert into tblCidade (nomeCidade, codEstado) values("Toledo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tombos", "11");
insert into tblCidade (nomeCidade, codEstado) values("Três Corações", "11");
insert into tblCidade (nomeCidade, codEstado) values("Três Marias", "11");
insert into tblCidade (nomeCidade, codEstado) values("Três Pontas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tumiritinga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Tupaciguara", "11");
insert into tblCidade (nomeCidade, codEstado) values("Turmalina", "11");
insert into tblCidade (nomeCidade, codEstado) values("Turvolândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ubá", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ubaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("Ubaporanga", "11");
insert into tblCidade (nomeCidade, codEstado) values("Uberaba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Uberlândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Umburatiba", "11");
insert into tblCidade (nomeCidade, codEstado) values("Unaí", "11");
insert into tblCidade (nomeCidade, codEstado) values("União de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Uruana de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Urucânia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Urucuia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Vargem Alegre", "11");
insert into tblCidade (nomeCidade, codEstado) values("Vargem Bonita", "11");
insert into tblCidade (nomeCidade, codEstado) values("Vargem Grande do Rio Pardo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Varginha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Varjão de Minas", "11");
insert into tblCidade (nomeCidade, codEstado) values("Várzea da Palma", "11");
insert into tblCidade (nomeCidade, codEstado) values("Varzelândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Vazante", "11");
insert into tblCidade (nomeCidade, codEstado) values("Verdelândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Veredinha", "11");
insert into tblCidade (nomeCidade, codEstado) values("Veríssimo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Vermelho Novo", "11");
insert into tblCidade (nomeCidade, codEstado) values("Vespasiano", "11");
insert into tblCidade (nomeCidade, codEstado) values("Viçosa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Vieiras", "11");
insert into tblCidade (nomeCidade, codEstado) values("Virgem da Lapa", "11");
insert into tblCidade (nomeCidade, codEstado) values("Virgínia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Virginópolis", "11");
insert into tblCidade (nomeCidade, codEstado) values("Virgolândia", "11");
insert into tblCidade (nomeCidade, codEstado) values("Visconde do Rio Branco", "11");
insert into tblCidade (nomeCidade, codEstado) values("Volta Grande", "11");
insert into tblCidade (nomeCidade, codEstado) values("Wenceslau Braz", "11");
insert into tblCidade (nomeCidade, codEstado) values("Afonso Cláudio", "8");
insert into tblCidade (nomeCidade, codEstado) values("Água Doce do Norte", "8");
insert into tblCidade (nomeCidade, codEstado) values("Águia Branca", "8");
insert into tblCidade (nomeCidade, codEstado) values("Alegre", "8");
insert into tblCidade (nomeCidade, codEstado) values("Alfredo Chaves", "8");
insert into tblCidade (nomeCidade, codEstado) values("Alto Rio Novo", "8");
insert into tblCidade (nomeCidade, codEstado) values("Anchieta", "8");
insert into tblCidade (nomeCidade, codEstado) values("Apiacá", "8");
insert into tblCidade (nomeCidade, codEstado) values("Aracruz", "8");
insert into tblCidade (nomeCidade, codEstado) values("Atilio Vivacqua", "8");
insert into tblCidade (nomeCidade, codEstado) values("Baixo Guandu", "8");
insert into tblCidade (nomeCidade, codEstado) values("Barra de São Francisco", "8");
insert into tblCidade (nomeCidade, codEstado) values("Boa Esperança", "8");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Norte", "8");
insert into tblCidade (nomeCidade, codEstado) values("Brejetuba", "8");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeiro de Itapemirim", "8");
insert into tblCidade (nomeCidade, codEstado) values("Cariacica", "8");
insert into tblCidade (nomeCidade, codEstado) values("Castelo", "8");
insert into tblCidade (nomeCidade, codEstado) values("Colatina", "8");
insert into tblCidade (nomeCidade, codEstado) values("Conceição da Barra", "8");
insert into tblCidade (nomeCidade, codEstado) values("Conceição do Castelo", "8");
insert into tblCidade (nomeCidade, codEstado) values("Divino de São Lourenço", "8");
insert into tblCidade (nomeCidade, codEstado) values("Domingos Martins", "8");
insert into tblCidade (nomeCidade, codEstado) values("Dores do Rio Preto", "8");
insert into tblCidade (nomeCidade, codEstado) values("Ecoporanga", "8");
insert into tblCidade (nomeCidade, codEstado) values("Fundão", "8");
insert into tblCidade (nomeCidade, codEstado) values("Governador Lindenberg", "8");
insert into tblCidade (nomeCidade, codEstado) values("Guaçuí", "8");
insert into tblCidade (nomeCidade, codEstado) values("Guarapari", "8");
insert into tblCidade (nomeCidade, codEstado) values("Ibatiba", "8");
insert into tblCidade (nomeCidade, codEstado) values("Ibiraçu", "8");
insert into tblCidade (nomeCidade, codEstado) values("Ibitirama", "8");
insert into tblCidade (nomeCidade, codEstado) values("Iconha", "8");
insert into tblCidade (nomeCidade, codEstado) values("Irupi", "8");
insert into tblCidade (nomeCidade, codEstado) values("Itaguaçu", "8");
insert into tblCidade (nomeCidade, codEstado) values("Itapemirim", "8");
insert into tblCidade (nomeCidade, codEstado) values("Itarana", "8");
insert into tblCidade (nomeCidade, codEstado) values("Iúna", "8");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaré", "8");
insert into tblCidade (nomeCidade, codEstado) values("Jerônimo Monteiro", "8");
insert into tblCidade (nomeCidade, codEstado) values("João Neiva", "8");
insert into tblCidade (nomeCidade, codEstado) values("Laranja da Terra", "8");
insert into tblCidade (nomeCidade, codEstado) values("Linhares", "8");
insert into tblCidade (nomeCidade, codEstado) values("Mantenópolis", "8");
insert into tblCidade (nomeCidade, codEstado) values("Marataízes", "8");
insert into tblCidade (nomeCidade, codEstado) values("Marechal Floriano", "8");
insert into tblCidade (nomeCidade, codEstado) values("Marilândia", "8");
insert into tblCidade (nomeCidade, codEstado) values("Mimoso do Sul", "8");
insert into tblCidade (nomeCidade, codEstado) values("Montanha", "8");
insert into tblCidade (nomeCidade, codEstado) values("Mucurici", "8");
insert into tblCidade (nomeCidade, codEstado) values("Muniz Freire", "8");
insert into tblCidade (nomeCidade, codEstado) values("Muqui", "8");
insert into tblCidade (nomeCidade, codEstado) values("Nova Venécia", "8");
insert into tblCidade (nomeCidade, codEstado) values("Pancas", "8");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Canário", "8");
insert into tblCidade (nomeCidade, codEstado) values("Pinheiros", "8");
insert into tblCidade (nomeCidade, codEstado) values("Piúma", "8");
insert into tblCidade (nomeCidade, codEstado) values("Ponto Belo", "8");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Kennedy", "8");
insert into tblCidade (nomeCidade, codEstado) values("Rio Bananal", "8");
insert into tblCidade (nomeCidade, codEstado) values("Rio Novo do Sul", "8");
insert into tblCidade (nomeCidade, codEstado) values("Santa Leopoldina", "8");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria de Jetibá", "8");
insert into tblCidade (nomeCidade, codEstado) values("Santa Teresa", "8");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos do Norte", "8");
insert into tblCidade (nomeCidade, codEstado) values("São Gabriel da Palha", "8");
insert into tblCidade (nomeCidade, codEstado) values("São José do Calçado", "8");
insert into tblCidade (nomeCidade, codEstado) values("São Mateus", "8");
insert into tblCidade (nomeCidade, codEstado) values("São Roque do Canaã", "8");
insert into tblCidade (nomeCidade, codEstado) values("Serra", "8");
insert into tblCidade (nomeCidade, codEstado) values("Sooretama", "8");
insert into tblCidade (nomeCidade, codEstado) values("Vargem Alta", "8");
insert into tblCidade (nomeCidade, codEstado) values("Venda Nova do Imigrante", "8");
insert into tblCidade (nomeCidade, codEstado) values("Viana", "8");
insert into tblCidade (nomeCidade, codEstado) values("Vila Pavão", "8");
insert into tblCidade (nomeCidade, codEstado) values("Vila Valério", "8");
insert into tblCidade (nomeCidade, codEstado) values("Vila Velha", "8");
insert into tblCidade (nomeCidade, codEstado) values("Vitória", "8");
insert into tblCidade (nomeCidade, codEstado) values("Angra dos Reis", "19");
insert into tblCidade (nomeCidade, codEstado) values("Aperibé", "19");
insert into tblCidade (nomeCidade, codEstado) values("Araruama", "19");
insert into tblCidade (nomeCidade, codEstado) values("Areal", "19");
insert into tblCidade (nomeCidade, codEstado) values("Armação dos Búzios", "19");
insert into tblCidade (nomeCidade, codEstado) values("Arraial do Cabo", "19");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Piraí", "19");
insert into tblCidade (nomeCidade, codEstado) values("Barra Mansa", "19");
insert into tblCidade (nomeCidade, codEstado) values("Belford Roxo", "19");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jardim", "19");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Itabapoana", "19");
insert into tblCidade (nomeCidade, codEstado) values("Cabo Frio", "19");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeiras de Macacu", "19");
insert into tblCidade (nomeCidade, codEstado) values("Cambuci", "19");
insert into tblCidade (nomeCidade, codEstado) values("Campos dos Goytacazes", "19");
insert into tblCidade (nomeCidade, codEstado) values("Cantagalo", "19");
insert into tblCidade (nomeCidade, codEstado) values("Carapebus", "19");
insert into tblCidade (nomeCidade, codEstado) values("Cardoso Moreira", "19");
insert into tblCidade (nomeCidade, codEstado) values("Carmo", "19");
insert into tblCidade (nomeCidade, codEstado) values("Casimiro de Abreu", "19");
insert into tblCidade (nomeCidade, codEstado) values("Comendador Levy Gasparian", "19");
insert into tblCidade (nomeCidade, codEstado) values("Conceição de Macabu", "19");
insert into tblCidade (nomeCidade, codEstado) values("Cordeiro", "19");
insert into tblCidade (nomeCidade, codEstado) values("Duas Barras", "19");
insert into tblCidade (nomeCidade, codEstado) values("Duque de Caxias", "19");
insert into tblCidade (nomeCidade, codEstado) values("Engenheiro Paulo de Frontin", "19");
insert into tblCidade (nomeCidade, codEstado) values("Guapimirim", "19");
insert into tblCidade (nomeCidade, codEstado) values("Iguaba Grande", "19");
insert into tblCidade (nomeCidade, codEstado) values("Itaboraí", "19");
insert into tblCidade (nomeCidade, codEstado) values("Itaguaí", "19");
insert into tblCidade (nomeCidade, codEstado) values("Italva", "19");
insert into tblCidade (nomeCidade, codEstado) values("Itaocara", "19");
insert into tblCidade (nomeCidade, codEstado) values("Itaperuna", "19");
insert into tblCidade (nomeCidade, codEstado) values("Itatiaia", "19");
insert into tblCidade (nomeCidade, codEstado) values("Japeri", "19");
insert into tblCidade (nomeCidade, codEstado) values("Laje do Muriaé", "19");
insert into tblCidade (nomeCidade, codEstado) values("Macaé", "19");
insert into tblCidade (nomeCidade, codEstado) values("Macuco", "19");
insert into tblCidade (nomeCidade, codEstado) values("Magé", "19");
insert into tblCidade (nomeCidade, codEstado) values("Mangaratiba", "19");
insert into tblCidade (nomeCidade, codEstado) values("Maricá", "19");
insert into tblCidade (nomeCidade, codEstado) values("Mendes", "19");
insert into tblCidade (nomeCidade, codEstado) values("Mesquita", "19");
insert into tblCidade (nomeCidade, codEstado) values("Miguel Pereira", "19");
insert into tblCidade (nomeCidade, codEstado) values("Miracema", "19");
insert into tblCidade (nomeCidade, codEstado) values("Natividade", "19");
insert into tblCidade (nomeCidade, codEstado) values("Nilópolis", "19");
insert into tblCidade (nomeCidade, codEstado) values("Niterói", "19");
insert into tblCidade (nomeCidade, codEstado) values("Nova Friburgo", "19");
insert into tblCidade (nomeCidade, codEstado) values("Nova Iguaçu", "19");
insert into tblCidade (nomeCidade, codEstado) values("Paracambi", "19");
insert into tblCidade (nomeCidade, codEstado) values("Paraíba do Sul", "19");
insert into tblCidade (nomeCidade, codEstado) values("Paraty", "19");
insert into tblCidade (nomeCidade, codEstado) values("Paty do Alferes", "19");
insert into tblCidade (nomeCidade, codEstado) values("Petrópolis", "19");
insert into tblCidade (nomeCidade, codEstado) values("Pinheiral", "19");
insert into tblCidade (nomeCidade, codEstado) values("Piraí", "19");
insert into tblCidade (nomeCidade, codEstado) values("Porciúncula", "19");
insert into tblCidade (nomeCidade, codEstado) values("Porto Real", "19");
insert into tblCidade (nomeCidade, codEstado) values("Quatis", "19");
insert into tblCidade (nomeCidade, codEstado) values("Queimados", "19");
insert into tblCidade (nomeCidade, codEstado) values("Quissamã", "19");
insert into tblCidade (nomeCidade, codEstado) values("Resende", "19");
insert into tblCidade (nomeCidade, codEstado) values("Rio Bonito", "19");
insert into tblCidade (nomeCidade, codEstado) values("Rio Claro", "19");
insert into tblCidade (nomeCidade, codEstado) values("Rio das Flores", "19");
insert into tblCidade (nomeCidade, codEstado) values("Rio das Ostras", "19");
insert into tblCidade (nomeCidade, codEstado) values("Rio de Janeiro", "19");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria Madalena", "19");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio de Pádua", "19");
insert into tblCidade (nomeCidade, codEstado) values("São Fidélis", "19");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco de Itabapoana", "19");
insert into tblCidade (nomeCidade, codEstado) values("São Gonçalo", "19");
insert into tblCidade (nomeCidade, codEstado) values("São João da Barra", "19");
insert into tblCidade (nomeCidade, codEstado) values("São João de Meriti", "19");
insert into tblCidade (nomeCidade, codEstado) values("São José de Ubá", "19");
insert into tblCidade (nomeCidade, codEstado) values("São José do Vale do Rio Preto", "19");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro da Aldeia", "19");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Alto", "19");
insert into tblCidade (nomeCidade, codEstado) values("Sapucaia", "19");
insert into tblCidade (nomeCidade, codEstado) values("Saquarema", "19");
insert into tblCidade (nomeCidade, codEstado) values("Seropédica", "19");
insert into tblCidade (nomeCidade, codEstado) values("Silva Jardim", "19");
insert into tblCidade (nomeCidade, codEstado) values("Sumidouro", "19");
insert into tblCidade (nomeCidade, codEstado) values("Tanguá", "19");
insert into tblCidade (nomeCidade, codEstado) values("Teresópolis", "19");
insert into tblCidade (nomeCidade, codEstado) values("Trajano de Moraes", "19");
insert into tblCidade (nomeCidade, codEstado) values("Três Rios", "19");
insert into tblCidade (nomeCidade, codEstado) values("Valença", "19");
insert into tblCidade (nomeCidade, codEstado) values("Varre-Sai", "19");
insert into tblCidade (nomeCidade, codEstado) values("Vassouras", "19");
insert into tblCidade (nomeCidade, codEstado) values("Volta Redonda", "19");
insert into tblCidade (nomeCidade, codEstado) values("Adamantina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Adolfo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Aguaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Águas da Prata", "26");
insert into tblCidade (nomeCidade, codEstado) values("Águas de Lindóia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Águas de Santa Bárbara", "26");
insert into tblCidade (nomeCidade, codEstado) values("Águas de São Pedro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Agudos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Alambari", "26");
insert into tblCidade (nomeCidade, codEstado) values("Alfredo Marcondes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Altair", "26");
insert into tblCidade (nomeCidade, codEstado) values("Altinópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Alto Alegre", "26");
insert into tblCidade (nomeCidade, codEstado) values("Alumínio", "26");
insert into tblCidade (nomeCidade, codEstado) values("Álvares Florence", "26");
insert into tblCidade (nomeCidade, codEstado) values("Álvares Machado", "26");
insert into tblCidade (nomeCidade, codEstado) values("Álvaro de Carvalho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Alvinlândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Americana", "26");
insert into tblCidade (nomeCidade, codEstado) values("Américo Brasiliense", "26");
insert into tblCidade (nomeCidade, codEstado) values("Américo de Campos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Amparo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Analândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Andradina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Angatuba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Anhembi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Anhumas", "26");
insert into tblCidade (nomeCidade, codEstado) values("Aparecida", "26");
insert into tblCidade (nomeCidade, codEstado) values("Aparecida d'Oeste", "26");
insert into tblCidade (nomeCidade, codEstado) values("Apiaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Araçariguama", "26");
insert into tblCidade (nomeCidade, codEstado) values("Araçatuba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Araçoiaba da Serra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Aramina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Arandu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Arapeí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Araraquara", "26");
insert into tblCidade (nomeCidade, codEstado) values("Araras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Arco-Íris", "26");
insert into tblCidade (nomeCidade, codEstado) values("Arealva", "26");
insert into tblCidade (nomeCidade, codEstado) values("Areias", "26");
insert into tblCidade (nomeCidade, codEstado) values("Areiópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ariranha", "26");
insert into tblCidade (nomeCidade, codEstado) values("Artur Nogueira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Arujá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Aspásia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Assis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Atibaia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Auriflama", "26");
insert into tblCidade (nomeCidade, codEstado) values("Avaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Avanhandava", "26");
insert into tblCidade (nomeCidade, codEstado) values("Avaré", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bady Bassitt", "26");
insert into tblCidade (nomeCidade, codEstado) values("Balbinos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bálsamo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bananal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Barão de Antonina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Barbosa", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bariri", "26");
insert into tblCidade (nomeCidade, codEstado) values("Barra Bonita", "26");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Chapéu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Turvo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Barretos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Barrinha", "26");
insert into tblCidade (nomeCidade, codEstado) values("Barueri", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bastos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Batatais", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bauru", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bebedouro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bento de Abreu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bernardino de Campos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bertioga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bilac", "26");
insert into tblCidade (nomeCidade, codEstado) values("Birigui", "26");
insert into tblCidade (nomeCidade, codEstado) values("Biritiba-Mirim", "26");
insert into tblCidade (nomeCidade, codEstado) values("Boa Esperança do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bocaina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bofete", "26");
insert into tblCidade (nomeCidade, codEstado) values("Boituva", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus dos Perdões", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bom Sucesso de Itararé", "26");
insert into tblCidade (nomeCidade, codEstado) values("Borá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Boracéia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Borborema", "26");
insert into tblCidade (nomeCidade, codEstado) values("Borebi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Botucatu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Bragança Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Braúna", "26");
insert into tblCidade (nomeCidade, codEstado) values("Brejo Alegre", "26");
insert into tblCidade (nomeCidade, codEstado) values("Brodowski", "26");
insert into tblCidade (nomeCidade, codEstado) values("Brotas", "26");
insert into tblCidade (nomeCidade, codEstado) values("Buri", "26");
insert into tblCidade (nomeCidade, codEstado) values("Buritama", "26");
insert into tblCidade (nomeCidade, codEstado) values("Buritizal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cabrália Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cabreúva", "26");
insert into tblCidade (nomeCidade, codEstado) values("Caçapava", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Caconde", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cafelândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Caiabu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Caieiras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Caiuá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cajamar", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cajati", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cajobi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cajuru", "26");
insert into tblCidade (nomeCidade, codEstado) values("Campina do Monte Alegre", "26");
insert into tblCidade (nomeCidade, codEstado) values("Campinas", "26");
insert into tblCidade (nomeCidade, codEstado) values("Campo Limpo Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Campos do Jordão", "26");
insert into tblCidade (nomeCidade, codEstado) values("Campos Novos Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cananéia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Canas", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cândido Mota", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cândido Rodrigues", "26");
insert into tblCidade (nomeCidade, codEstado) values("Canitar", "26");
insert into tblCidade (nomeCidade, codEstado) values("Capão Bonito", "26");
insert into tblCidade (nomeCidade, codEstado) values("Capela do Alto", "26");
insert into tblCidade (nomeCidade, codEstado) values("Capivari", "26");
insert into tblCidade (nomeCidade, codEstado) values("Caraguatatuba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Carapicuíba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cardoso", "26");
insert into tblCidade (nomeCidade, codEstado) values("Casa Branca", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cássia dos Coqueiros", "26");
insert into tblCidade (nomeCidade, codEstado) values("Castilho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Catanduva", "26");
insert into tblCidade (nomeCidade, codEstado) values("Catiguá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cedral", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cerqueira César", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cerquilho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cesário Lange", "26");
insert into tblCidade (nomeCidade, codEstado) values("Charqueada", "26");
insert into tblCidade (nomeCidade, codEstado) values("Chavantes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Clementina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Colina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Colômbia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Conchal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Conchas", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cordeirópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Coroados", "26");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Macedo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Corumbataí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cosmópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cosmorama", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cotia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cravinhos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cristais Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cruzália", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cruzeiro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cubatão", "26");
insert into tblCidade (nomeCidade, codEstado) values("Cunha", "26");
insert into tblCidade (nomeCidade, codEstado) values("Descalvado", "26");
insert into tblCidade (nomeCidade, codEstado) values("Diadema", "26");
insert into tblCidade (nomeCidade, codEstado) values("Dirce Reis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Divinolândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Dobrada", "26");
insert into tblCidade (nomeCidade, codEstado) values("Dois Córregos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Dolcinópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Dourado", "26");
insert into tblCidade (nomeCidade, codEstado) values("Dracena", "26");
insert into tblCidade (nomeCidade, codEstado) values("Duartina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Dumont", "26");
insert into tblCidade (nomeCidade, codEstado) values("Echaporã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Eldorado", "26");
insert into tblCidade (nomeCidade, codEstado) values("Elias Fausto", "26");
insert into tblCidade (nomeCidade, codEstado) values("Elisiário", "26");
insert into tblCidade (nomeCidade, codEstado) values("Embaúba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Embu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Embu-Guaçu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Emilianópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Engenheiro Coelho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Espírito Santo do Pinhal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Espírito Santo do Turvo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Estiva Gerbi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Estrela do Norte", "26");
insert into tblCidade (nomeCidade, codEstado) values("Estrela d'Oeste", "26");
insert into tblCidade (nomeCidade, codEstado) values("Euclides da Cunha Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Fartura", "26");
insert into tblCidade (nomeCidade, codEstado) values("Fernando Prestes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Fernandópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Fernão", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ferraz de Vasconcelos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Flora Rica", "26");
insert into tblCidade (nomeCidade, codEstado) values("Floreal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Flórida Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Florínia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Franca", "26");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Morato", "26");
insert into tblCidade (nomeCidade, codEstado) values("Franco da Rocha", "26");
insert into tblCidade (nomeCidade, codEstado) values("Gabriel Monteiro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Gália", "26");
insert into tblCidade (nomeCidade, codEstado) values("Garça", "26");
insert into tblCidade (nomeCidade, codEstado) values("Gastão Vidigal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Gavião Peixoto", "26");
insert into tblCidade (nomeCidade, codEstado) values("General Salgado", "26");
insert into tblCidade (nomeCidade, codEstado) values("Getulina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Glicério", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guaiçara", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guaimbê", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guaíra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guapiaçu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guapiara", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guará", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guaraçaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guaraci", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guarani d'Oeste", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guarantã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guararapes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guararema", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guaratinguetá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guareí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guariba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guarujá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guarulhos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guatapará", "26");
insert into tblCidade (nomeCidade, codEstado) values("Guzolândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Herculândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Holambra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Hortolândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Iacanga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Iacri", "26");
insert into tblCidade (nomeCidade, codEstado) values("Iaras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ibaté", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ibirá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ibirarema", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ibitinga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ibiúna", "26");
insert into tblCidade (nomeCidade, codEstado) values("Icém", "26");
insert into tblCidade (nomeCidade, codEstado) values("Iepê", "26");
insert into tblCidade (nomeCidade, codEstado) values("Igaraçu do Tietê", "26");
insert into tblCidade (nomeCidade, codEstado) values("Igarapava", "26");
insert into tblCidade (nomeCidade, codEstado) values("Igaratá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Iguape", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ilha Comprida", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ilha Solteira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ilhabela", "26");
insert into tblCidade (nomeCidade, codEstado) values("Indaiatuba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Indiana", "26");
insert into tblCidade (nomeCidade, codEstado) values("Indiaporã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Inúbia Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ipaussu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Iperó", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ipeúna", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ipiguá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Iporanga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ipuã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Iracemápolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Irapuã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Irapuru", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itaberá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itajobi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itaju", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itanhaém", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itaóca", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itapecerica da Serra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itapetininga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itapeva", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itapevi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itapira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itapirapuã Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itápolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itaporanga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itapuí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itapura", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itaquaquecetuba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itararé", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itariri", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itatiba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itatinga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itirapina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itirapuã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itobi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Itupeva", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ituverava", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jaborandi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jaboticabal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jacareí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jaci", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jacupiranga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jaguariúna", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jales", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jambeiro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jandira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jardinópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jarinu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jaú", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jeriquara", "26");
insert into tblCidade (nomeCidade, codEstado) values("Joanópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("João Ramalho", "26");
insert into tblCidade (nomeCidade, codEstado) values("José Bonifácio", "26");
insert into tblCidade (nomeCidade, codEstado) values("Júlio Mesquita", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jumirim", "26");
insert into tblCidade (nomeCidade, codEstado) values("Jundiaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Junqueirópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Juquiá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Juquitiba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lagoinha", "26");
insert into tblCidade (nomeCidade, codEstado) values("Laranjal Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lavínia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lavrinhas", "26");
insert into tblCidade (nomeCidade, codEstado) values("Leme", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lençóis Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Limeira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lindóia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lins", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lorena", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lourdes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Louveira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lucélia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lucianópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Luís Antônio", "26");
insert into tblCidade (nomeCidade, codEstado) values("Luiziânia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lupércio", "26");
insert into tblCidade (nomeCidade, codEstado) values("Lutécia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Macatuba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Macaubal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Macedônia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Magda", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mairinque", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mairiporã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Manduri", "26");
insert into tblCidade (nomeCidade, codEstado) values("Marabá Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Maracaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Marapoama", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mariápolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Marília", "26");
insert into tblCidade (nomeCidade, codEstado) values("Marinópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Martinópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Matão", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mauá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mendonça", "26");
insert into tblCidade (nomeCidade, codEstado) values("Meridiano", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mesópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Miguelópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mineiros do Tietê", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mira Estrela", "26");
insert into tblCidade (nomeCidade, codEstado) values("Miracatu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mirandópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mirante do Paranapanema", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mirassol", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mirassolândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mococa", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mogi das Cruzes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mogi Guaçu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Moji Mirim", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mombuca", "26");
insert into tblCidade (nomeCidade, codEstado) values("Monções", "26");
insert into tblCidade (nomeCidade, codEstado) values("Mongaguá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alegre do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alto", "26");
insert into tblCidade (nomeCidade, codEstado) values("Monte Aprazível", "26");
insert into tblCidade (nomeCidade, codEstado) values("Monte Azul Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Monte Castelo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Monte Mor", "26");
insert into tblCidade (nomeCidade, codEstado) values("Monteiro Lobato", "26");
insert into tblCidade (nomeCidade, codEstado) values("Morro Agudo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Morungaba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Motuca", "26");
insert into tblCidade (nomeCidade, codEstado) values("Murutinga do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nantes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Narandiba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Natividade da Serra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nazaré Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Neves Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nhandeara", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nipoã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Aliança", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Campina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Canaã Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Castilho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Europa", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Granada", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Guataporanga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Independência", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Luzitânia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nova Odessa", "26");
insert into tblCidade (nomeCidade, codEstado) values("Novais", "26");
insert into tblCidade (nomeCidade, codEstado) values("Novo Horizonte", "26");
insert into tblCidade (nomeCidade, codEstado) values("Nuporanga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ocauçu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Óleo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Olímpia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Onda Verde", "26");
insert into tblCidade (nomeCidade, codEstado) values("Oriente", "26");
insert into tblCidade (nomeCidade, codEstado) values("Orindiúva", "26");
insert into tblCidade (nomeCidade, codEstado) values("Orlândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Osasco", "26");
insert into tblCidade (nomeCidade, codEstado) values("Oscar Bressane", "26");
insert into tblCidade (nomeCidade, codEstado) values("Osvaldo Cruz", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ourinhos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Verde", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ouroeste", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pacaembu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Palestina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Palmares Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Palmeira d'Oeste", "26");
insert into tblCidade (nomeCidade, codEstado) values("Palmital", "26");
insert into tblCidade (nomeCidade, codEstado) values("Panorama", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paraguaçu Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paraibuna", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paraíso", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paranapanema", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paranapuã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Parapuã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pardinho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pariquera-Açu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Parisi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Patrocínio Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paulicéia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paulínia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paulistânia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Paulo de Faria", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pederneiras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Bela", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pedranópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pedregulho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pedreira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pedrinhas Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pedro de Toledo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Penápolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pereira Barreto", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pereiras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Peruíbe", "26");
insert into tblCidade (nomeCidade, codEstado) values("Piacatu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Piedade", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pilar do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pindamonhangaba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pindorama", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pinhalzinho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Piquerobi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Piquete", "26");
insert into tblCidade (nomeCidade, codEstado) values("Piracaia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Piracicaba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Piraju", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pirajuí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pirangi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pirapora do Bom Jesus", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pirapozinho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pirassununga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Piratininga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pitangueiras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Planalto", "26");
insert into tblCidade (nomeCidade, codEstado) values("Platina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Poá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Poloni", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pompéia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pongaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pontal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pontalinda", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pontes Gestal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Populina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Porangaba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Porto Feliz", "26");
insert into tblCidade (nomeCidade, codEstado) values("Porto Ferreira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Potim", "26");
insert into tblCidade (nomeCidade, codEstado) values("Potirendaba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pracinha", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pradópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Praia Grande", "26");
insert into tblCidade (nomeCidade, codEstado) values("Pratânia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Alves", "26");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Bernardes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Epitácio", "26");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Prudente", "26");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Venceslau", "26");
insert into tblCidade (nomeCidade, codEstado) values("Promissão", "26");
insert into tblCidade (nomeCidade, codEstado) values("Quadra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Quatá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Queiroz", "26");
insert into tblCidade (nomeCidade, codEstado) values("Queluz", "26");
insert into tblCidade (nomeCidade, codEstado) values("Quintana", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rafard", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rancharia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Redenção da Serra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Regente Feijó", "26");
insert into tblCidade (nomeCidade, codEstado) values("Reginópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Registro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Restinga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Bonito", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Branco", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Corrente", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão dos Índios", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Grande", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Pires", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Preto", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rifaina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rincão", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rinópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rio Claro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rio das Pedras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rio Grande da Serra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Riolândia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Riversul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rosana", "26");
insert into tblCidade (nomeCidade, codEstado) values("Roseira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rubiácea", "26");
insert into tblCidade (nomeCidade, codEstado) values("Rubinéia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sabino", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sagres", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sales", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sales Oliveira", "26");
insert into tblCidade (nomeCidade, codEstado) values("Salesópolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Salmourão", "26");
insert into tblCidade (nomeCidade, codEstado) values("Saltinho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Salto", "26");
insert into tblCidade (nomeCidade, codEstado) values("Salto de Pirapora", "26");
insert into tblCidade (nomeCidade, codEstado) values("Salto Grande", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sandovalina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Adélia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Albertina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara d'Oeste", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Branca", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Clara d'Oeste", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz da Conceição", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz da Esperança", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz das Palmeiras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz do Rio Pardo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Ernestina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Fé do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Gertrudes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Isabel", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Lúcia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria da Serra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Mercedes", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita do Passa Quatro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita d'Oeste", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa de Viterbo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santa Salete", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santana da Ponte Pensa", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santana de Parnaíba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santo Anastácio", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santo André", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio da Alegria", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio de Posse", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Aracanguá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Jardim", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Pinhal", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santo Expedito", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santópolis do Aguapeí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Santos", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Bento do Sapucaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Bernardo do Campo", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Caetano do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Carlos", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco", "26");
insert into tblCidade (nomeCidade, codEstado) values("São João da Boa Vista", "26");
insert into tblCidade (nomeCidade, codEstado) values("São João das Duas Pontes", "26");
insert into tblCidade (nomeCidade, codEstado) values("São João de Iracema", "26");
insert into tblCidade (nomeCidade, codEstado) values("São João do Pau d'Alho", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Joaquim da Barra", "26");
insert into tblCidade (nomeCidade, codEstado) values("São José da Bela Vista", "26");
insert into tblCidade (nomeCidade, codEstado) values("São José do Barreiro", "26");
insert into tblCidade (nomeCidade, codEstado) values("São José do Rio Pardo", "26");
insert into tblCidade (nomeCidade, codEstado) values("São José do Rio Preto", "26");
insert into tblCidade (nomeCidade, codEstado) values("São José dos Campos", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Lourenço da Serra", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Luís do Paraitinga", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Manuel", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel Arcanjo", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Paulo", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro do Turvo", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Roque", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião da Grama", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Simão", "26");
insert into tblCidade (nomeCidade, codEstado) values("São Vicente", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sarapuí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sarutaiá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sebastianópolis do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Serra Azul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Serra Negra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Serrana", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sertãozinho", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sete Barras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Severínia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Silveiras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Socorro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sorocaba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sud Mennucci", "26");
insert into tblCidade (nomeCidade, codEstado) values("Sumaré", "26");
insert into tblCidade (nomeCidade, codEstado) values("Suzanápolis", "26");
insert into tblCidade (nomeCidade, codEstado) values("Suzano", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tabapuã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tabatinga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taboão da Serra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taciba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taguaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taiaçu", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taiúva", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tambaú", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tanabi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tapiraí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tapiratiba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taquaral", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taquaritinga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taquarituba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taquarivaí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tarabai", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tarumã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tatuí", "26");
insert into tblCidade (nomeCidade, codEstado) values("Taubaté", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tejupá", "26");
insert into tblCidade (nomeCidade, codEstado) values("Teodoro Sampaio", "26");
insert into tblCidade (nomeCidade, codEstado) values("Terra Roxa", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tietê", "26");
insert into tblCidade (nomeCidade, codEstado) values("Timburi", "26");
insert into tblCidade (nomeCidade, codEstado) values("Torre de Pedra", "26");
insert into tblCidade (nomeCidade, codEstado) values("Torrinha", "26");
insert into tblCidade (nomeCidade, codEstado) values("Trabiju", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tremembé", "26");
insert into tblCidade (nomeCidade, codEstado) values("Três Fronteiras", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tuiuti", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tupã", "26");
insert into tblCidade (nomeCidade, codEstado) values("Tupi Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Turiúba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Turmalina", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ubarana", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ubatuba", "26");
insert into tblCidade (nomeCidade, codEstado) values("Ubirajara", "26");
insert into tblCidade (nomeCidade, codEstado) values("Uchoa", "26");
insert into tblCidade (nomeCidade, codEstado) values("União Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Urânia", "26");
insert into tblCidade (nomeCidade, codEstado) values("Uru", "26");
insert into tblCidade (nomeCidade, codEstado) values("Urupês", "26");
insert into tblCidade (nomeCidade, codEstado) values("Valentim Gentil", "26");
insert into tblCidade (nomeCidade, codEstado) values("Valinhos", "26");
insert into tblCidade (nomeCidade, codEstado) values("Valparaíso", "26");
insert into tblCidade (nomeCidade, codEstado) values("Vargem", "26");
insert into tblCidade (nomeCidade, codEstado) values("Vargem Grande do Sul", "26");
insert into tblCidade (nomeCidade, codEstado) values("Vargem Grande Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Várzea Paulista", "26");
insert into tblCidade (nomeCidade, codEstado) values("Vera Cruz", "26");
insert into tblCidade (nomeCidade, codEstado) values("Vinhedo", "26");
insert into tblCidade (nomeCidade, codEstado) values("Viradouro", "26");
insert into tblCidade (nomeCidade, codEstado) values("Vista Alegre do Alto", "26");
insert into tblCidade (nomeCidade, codEstado) values("Vitória Brasil", "26");
insert into tblCidade (nomeCidade, codEstado) values("Votorantim", "26");
insert into tblCidade (nomeCidade, codEstado) values("Votuporanga", "26");
insert into tblCidade (nomeCidade, codEstado) values("Zacarias", "26");
insert into tblCidade (nomeCidade, codEstado) values("Abatiá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Adrianópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Agudos do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Almirante Tamandaré", "18");
insert into tblCidade (nomeCidade, codEstado) values("Altamira do Paraná", "18");
insert into tblCidade (nomeCidade, codEstado) values("Alto Paraíso", "18");
insert into tblCidade (nomeCidade, codEstado) values("Alto Paraná", "18");
insert into tblCidade (nomeCidade, codEstado) values("Alto Piquiri", "18");
insert into tblCidade (nomeCidade, codEstado) values("Altônia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Alvorada do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Amaporã", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ampére", "18");
insert into tblCidade (nomeCidade, codEstado) values("Anahy", "18");
insert into tblCidade (nomeCidade, codEstado) values("Andirá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ângulo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Antonina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Olinto", "18");
insert into tblCidade (nomeCidade, codEstado) values("Apucarana", "18");
insert into tblCidade (nomeCidade, codEstado) values("Arapongas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Arapoti", "18");
insert into tblCidade (nomeCidade, codEstado) values("Arapuã", "18");
insert into tblCidade (nomeCidade, codEstado) values("Araruna", "18");
insert into tblCidade (nomeCidade, codEstado) values("Araucária", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ariranha do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Assaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Assis Chateaubriand", "18");
insert into tblCidade (nomeCidade, codEstado) values("Astorga", "18");
insert into tblCidade (nomeCidade, codEstado) values("Atalaia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Balsa Nova", "18");
insert into tblCidade (nomeCidade, codEstado) values("Bandeirantes", "18");
insert into tblCidade (nomeCidade, codEstado) values("Barbosa Ferraz", "18");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Jacaré", "18");
insert into tblCidade (nomeCidade, codEstado) values("Barracão", "18");
insert into tblCidade (nomeCidade, codEstado) values("Bela Vista da Caroba", "18");
insert into tblCidade (nomeCidade, codEstado) values("Bela Vista do Paraíso", "18");
insert into tblCidade (nomeCidade, codEstado) values("Bituruna", "18");
insert into tblCidade (nomeCidade, codEstado) values("Boa Esperança", "18");
insert into tblCidade (nomeCidade, codEstado) values("Boa Esperança do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Boa Ventura de São Roque", "18");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista da Aparecida", "18");
insert into tblCidade (nomeCidade, codEstado) values("Bocaiúva do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Bom Sucesso", "18");
insert into tblCidade (nomeCidade, codEstado) values("Bom Sucesso do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Borrazópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Braganey", "18");
insert into tblCidade (nomeCidade, codEstado) values("Brasilândia do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cafeara", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cafelândia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cafezal do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Califórnia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cambará", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cambé", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cambira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Campina da Lagoa", "18");
insert into tblCidade (nomeCidade, codEstado) values("Campina do Simão", "18");
insert into tblCidade (nomeCidade, codEstado) values("Campina Grande do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Campo Bonito", "18");
insert into tblCidade (nomeCidade, codEstado) values("Campo do Tenente", "18");
insert into tblCidade (nomeCidade, codEstado) values("Campo Largo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Campo Magro", "18");
insert into tblCidade (nomeCidade, codEstado) values("Campo Mourão", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cândido de Abreu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Candói", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cantagalo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Capanema", "18");
insert into tblCidade (nomeCidade, codEstado) values("Capitão Leônidas Marques", "18");
insert into tblCidade (nomeCidade, codEstado) values("Carambeí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Carlópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cascavel", "18");
insert into tblCidade (nomeCidade, codEstado) values("Castro", "18");
insert into tblCidade (nomeCidade, codEstado) values("Catanduvas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Centenário do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cerro Azul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Céu Azul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Chopinzinho", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cianorte", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cidade Gaúcha", "18");
insert into tblCidade (nomeCidade, codEstado) values("Clevelândia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Colombo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Colorado", "18");
insert into tblCidade (nomeCidade, codEstado) values("Congonhinhas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Conselheiro Mairinck", "18");
insert into tblCidade (nomeCidade, codEstado) values("Contenda", "18");
insert into tblCidade (nomeCidade, codEstado) values("Corbélia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cornélio Procópio", "18");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Domingos Soares", "18");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Vivida", "18");
insert into tblCidade (nomeCidade, codEstado) values("Corumbataí do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cruz Machado", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cruzeiro do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cruzeiro do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cruzeiro do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Cruzmaltina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Curitiba", "18");
insert into tblCidade (nomeCidade, codEstado) values("Curiúva", "18");
insert into tblCidade (nomeCidade, codEstado) values("Diamante do Norte", "18");
insert into tblCidade (nomeCidade, codEstado) values("Diamante do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Diamante D'Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Dois Vizinhos", "18");
insert into tblCidade (nomeCidade, codEstado) values("Douradina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Doutor Camargo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Doutor Ulysses", "18");
insert into tblCidade (nomeCidade, codEstado) values("Enéas Marques", "18");
insert into tblCidade (nomeCidade, codEstado) values("Engenheiro Beltrão", "18");
insert into tblCidade (nomeCidade, codEstado) values("Entre Rios do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Esperança Nova", "18");
insert into tblCidade (nomeCidade, codEstado) values("Espigão Alto do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Farol", "18");
insert into tblCidade (nomeCidade, codEstado) values("Faxinal", "18");
insert into tblCidade (nomeCidade, codEstado) values("Fazenda Rio Grande", "18");
insert into tblCidade (nomeCidade, codEstado) values("Fênix", "18");
insert into tblCidade (nomeCidade, codEstado) values("Fernandes Pinheiro", "18");
insert into tblCidade (nomeCidade, codEstado) values("Figueira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Flor da Serra do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Floraí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Floresta", "18");
insert into tblCidade (nomeCidade, codEstado) values("Florestópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Flórida", "18");
insert into tblCidade (nomeCidade, codEstado) values("Formosa do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Foz do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Foz do Jordão", "18");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Alves", "18");
insert into tblCidade (nomeCidade, codEstado) values("Francisco Beltrão", "18");
insert into tblCidade (nomeCidade, codEstado) values("General Carneiro", "18");
insert into tblCidade (nomeCidade, codEstado) values("Godoy Moreira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Goioerê", "18");
insert into tblCidade (nomeCidade, codEstado) values("Goioxim", "18");
insert into tblCidade (nomeCidade, codEstado) values("Grandes Rios", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guaíra", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guairaçá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guamiranga", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guapirama", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guaporema", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guaraci", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guaraniaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guarapuava", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guaraqueçaba", "18");
insert into tblCidade (nomeCidade, codEstado) values("Guaratuba", "18");
insert into tblCidade (nomeCidade, codEstado) values("Honório Serpa", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ibaiti", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ibema", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ibiporã", "18");
insert into tblCidade (nomeCidade, codEstado) values("Icaraíma", "18");
insert into tblCidade (nomeCidade, codEstado) values("Iguaraçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Iguatu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Imbaú", "18");
insert into tblCidade (nomeCidade, codEstado) values("Imbituva", "18");
insert into tblCidade (nomeCidade, codEstado) values("Inácio Martins", "18");
insert into tblCidade (nomeCidade, codEstado) values("Inajá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Indianópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ipiranga", "18");
insert into tblCidade (nomeCidade, codEstado) values("Iporã", "18");
insert into tblCidade (nomeCidade, codEstado) values("Iracema do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Irati", "18");
insert into tblCidade (nomeCidade, codEstado) values("Iretama", "18");
insert into tblCidade (nomeCidade, codEstado) values("Itaguajé", "18");
insert into tblCidade (nomeCidade, codEstado) values("Itaipulândia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Itambaracá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Itambé", "18");
insert into tblCidade (nomeCidade, codEstado) values("Itapejara d'Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Itaperuçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Itaúna do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ivaiporã", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ivaté", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ivatuba", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jaboti", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jacarezinho", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jaguapitã", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jaguariaíva", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jandaia do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Janiópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Japira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Japurá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jardim Alegre", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jardim Olinda", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jataizinho", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jesuítas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Joaquim Távora", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jundiaí do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Juranda", "18");
insert into tblCidade (nomeCidade, codEstado) values("Jussara", "18");
insert into tblCidade (nomeCidade, codEstado) values("Kaloré", "18");
insert into tblCidade (nomeCidade, codEstado) values("Lapa", "18");
insert into tblCidade (nomeCidade, codEstado) values("Laranjal", "18");
insert into tblCidade (nomeCidade, codEstado) values("Laranjeiras do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Leópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Lidianópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Lindoeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Loanda", "18");
insert into tblCidade (nomeCidade, codEstado) values("Lobato", "18");
insert into tblCidade (nomeCidade, codEstado) values("Londrina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Luiziana", "18");
insert into tblCidade (nomeCidade, codEstado) values("Lunardelli", "18");
insert into tblCidade (nomeCidade, codEstado) values("Lupionópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mallet", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mamborê", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mandaguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mandaguari", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mandirituba", "18");
insert into tblCidade (nomeCidade, codEstado) values("Manfrinópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mangueirinha", "18");
insert into tblCidade (nomeCidade, codEstado) values("Manoel Ribas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Marechal Cândido Rondon", "18");
insert into tblCidade (nomeCidade, codEstado) values("Maria Helena", "18");
insert into tblCidade (nomeCidade, codEstado) values("Marialva", "18");
insert into tblCidade (nomeCidade, codEstado) values("Marilândia do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Marilena", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mariluz", "18");
insert into tblCidade (nomeCidade, codEstado) values("Maringá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mariópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Maripá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Marmeleiro", "18");
insert into tblCidade (nomeCidade, codEstado) values("Marquinho", "18");
insert into tblCidade (nomeCidade, codEstado) values("Marumbi", "18");
insert into tblCidade (nomeCidade, codEstado) values("Matelândia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Matinhos", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mato Rico", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mauá da Serra", "18");
insert into tblCidade (nomeCidade, codEstado) values("Medianeira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mercedes", "18");
insert into tblCidade (nomeCidade, codEstado) values("Mirador", "18");
insert into tblCidade (nomeCidade, codEstado) values("Miraselva", "18");
insert into tblCidade (nomeCidade, codEstado) values("Missal", "18");
insert into tblCidade (nomeCidade, codEstado) values("Moreira Sales", "18");
insert into tblCidade (nomeCidade, codEstado) values("Morretes", "18");
insert into tblCidade (nomeCidade, codEstado) values("Munhoz de Melo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora das Graças", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Aliança do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova América da Colina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Aurora", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Cantu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Esperança", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Esperança do Sudoeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Fátima", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Laranjeiras", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Londrina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Olímpia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Prata do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Santa Bárbara", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Santa Rosa", "18");
insert into tblCidade (nomeCidade, codEstado) values("Nova Tebas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Novo Itacolomi", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ortigueira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ourizona", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Verde do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Paiçandu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Palmas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Palmeira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Palmital", "18");
insert into tblCidade (nomeCidade, codEstado) values("Palotina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Paraíso do Norte", "18");
insert into tblCidade (nomeCidade, codEstado) values("Paranacity", "18");
insert into tblCidade (nomeCidade, codEstado) values("Paranaguá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Paranapoema", "18");
insert into tblCidade (nomeCidade, codEstado) values("Paranavaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pato Bragado", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pato Branco", "18");
insert into tblCidade (nomeCidade, codEstado) values("Paula Freitas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Paulo Frontin", "18");
insert into tblCidade (nomeCidade, codEstado) values("Peabiru", "18");
insert into tblCidade (nomeCidade, codEstado) values("Perobal", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pérola", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pérola d'Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Piên", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pinhais", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pinhal de São Bento", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pinhalão", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pinhão", "18");
insert into tblCidade (nomeCidade, codEstado) values("Piraí do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Piraquara", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pitanga", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pitangueiras", "18");
insert into tblCidade (nomeCidade, codEstado) values("Planaltina do Paraná", "18");
insert into tblCidade (nomeCidade, codEstado) values("Planalto", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ponta Grossa", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pontal do Paraná", "18");
insert into tblCidade (nomeCidade, codEstado) values("Porecatu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Porto Amazonas", "18");
insert into tblCidade (nomeCidade, codEstado) values("Porto Barreiro", "18");
insert into tblCidade (nomeCidade, codEstado) values("Porto Rico", "18");
insert into tblCidade (nomeCidade, codEstado) values("Porto Vitória", "18");
insert into tblCidade (nomeCidade, codEstado) values("Prado Ferreira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Pranchita", "18");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Castelo Branco", "18");
insert into tblCidade (nomeCidade, codEstado) values("Primeiro de Maio", "18");
insert into tblCidade (nomeCidade, codEstado) values("Prudentópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Quarto Centenário", "18");
insert into tblCidade (nomeCidade, codEstado) values("Quatiguá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Quatro Barras", "18");
insert into tblCidade (nomeCidade, codEstado) values("Quatro Pontes", "18");
insert into tblCidade (nomeCidade, codEstado) values("Quedas do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Querência do Norte", "18");
insert into tblCidade (nomeCidade, codEstado) values("Quinta do Sol", "18");
insert into tblCidade (nomeCidade, codEstado) values("Quitandinha", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ramilândia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rancho Alegre", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rancho Alegre D'Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Realeza", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rebouças", "18");
insert into tblCidade (nomeCidade, codEstado) values("Renascença", "18");
insert into tblCidade (nomeCidade, codEstado) values("Reserva", "18");
insert into tblCidade (nomeCidade, codEstado) values("Reserva do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Claro", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão do Pinhal", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rio Azul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rio Bom", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rio Bonito do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rio Branco do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rio Branco do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rio Negro", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rolândia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Roncador", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rondon", "18");
insert into tblCidade (nomeCidade, codEstado) values("Rosário do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Sabáudia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Salgado Filho", "18");
insert into tblCidade (nomeCidade, codEstado) values("Salto do Itararé", "18");
insert into tblCidade (nomeCidade, codEstado) values("Salto do Lontra", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Amélia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cecília do Pavão", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz de Monte Castelo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Fé", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Helena", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Inês", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Isabel do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Izabel do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Lúcia", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Mariana", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Mônica", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Tereza do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santa Terezinha de Itaipu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santana do Itararé", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio da Platina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Caiuá", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Paraíso", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Sudoeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Santo Inácio", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Carlos do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Jerônimo da Serra", "18");
insert into tblCidade (nomeCidade, codEstado) values("São João", "18");
insert into tblCidade (nomeCidade, codEstado) values("São João do Caiuá", "18");
insert into tblCidade (nomeCidade, codEstado) values("São João do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("São João do Triunfo", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Jorge do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Jorge do Patrocínio", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Jorge d'Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("São José da Boa Vista", "18");
insert into tblCidade (nomeCidade, codEstado) values("São José das Palmeiras", "18");
insert into tblCidade (nomeCidade, codEstado) values("São José dos Pinhais", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Manoel do Paraná", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Mateus do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro do Ivaí", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro do Paraná", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião da Amoreira", "18");
insert into tblCidade (nomeCidade, codEstado) values("São Tomé", "18");
insert into tblCidade (nomeCidade, codEstado) values("Sapopema", "18");
insert into tblCidade (nomeCidade, codEstado) values("Sarandi", "18");
insert into tblCidade (nomeCidade, codEstado) values("Saudade do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Sengés", "18");
insert into tblCidade (nomeCidade, codEstado) values("Serranópolis do Iguaçu", "18");
insert into tblCidade (nomeCidade, codEstado) values("Sertaneja", "18");
insert into tblCidade (nomeCidade, codEstado) values("Sertanópolis", "18");
insert into tblCidade (nomeCidade, codEstado) values("Siqueira Campos", "18");
insert into tblCidade (nomeCidade, codEstado) values("Sulina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tamarana", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tamboara", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tapejara", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tapira", "18");
insert into tblCidade (nomeCidade, codEstado) values("Teixeira Soares", "18");
insert into tblCidade (nomeCidade, codEstado) values("Telêmaco Borba", "18");
insert into tblCidade (nomeCidade, codEstado) values("Terra Boa", "18");
insert into tblCidade (nomeCidade, codEstado) values("Terra Rica", "18");
insert into tblCidade (nomeCidade, codEstado) values("Terra Roxa", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tibagi", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tijucas do Sul", "18");
insert into tblCidade (nomeCidade, codEstado) values("Toledo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tomazina", "18");
insert into tblCidade (nomeCidade, codEstado) values("Três Barras do Paraná", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tunas do Paraná", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tuneiras do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Tupãssi", "18");
insert into tblCidade (nomeCidade, codEstado) values("Turvo", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ubiratã", "18");
insert into tblCidade (nomeCidade, codEstado) values("Umuarama", "18");
insert into tblCidade (nomeCidade, codEstado) values("União da Vitória", "18");
insert into tblCidade (nomeCidade, codEstado) values("Uniflor", "18");
insert into tblCidade (nomeCidade, codEstado) values("Uraí", "18");
insert into tblCidade (nomeCidade, codEstado) values("Ventania", "18");
insert into tblCidade (nomeCidade, codEstado) values("Vera Cruz do Oeste", "18");
insert into tblCidade (nomeCidade, codEstado) values("Verê", "18");
insert into tblCidade (nomeCidade, codEstado) values("Virmond", "18");
insert into tblCidade (nomeCidade, codEstado) values("Vitorino", "18");
insert into tblCidade (nomeCidade, codEstado) values("Wenceslau Braz", "18");
insert into tblCidade (nomeCidade, codEstado) values("Xambrê", "18");
insert into tblCidade (nomeCidade, codEstado) values("Abdon Batista", "24");
insert into tblCidade (nomeCidade, codEstado) values("Abelardo Luz", "24");
insert into tblCidade (nomeCidade, codEstado) values("Agrolândia", "24");
insert into tblCidade (nomeCidade, codEstado) values("Agronômica", "24");
insert into tblCidade (nomeCidade, codEstado) values("Água Doce", "24");
insert into tblCidade (nomeCidade, codEstado) values("Águas de Chapecó", "24");
insert into tblCidade (nomeCidade, codEstado) values("Águas Frias", "24");
insert into tblCidade (nomeCidade, codEstado) values("Águas Mornas", "24");
insert into tblCidade (nomeCidade, codEstado) values("Alfredo Wagner", "24");
insert into tblCidade (nomeCidade, codEstado) values("Alto Bela Vista", "24");
insert into tblCidade (nomeCidade, codEstado) values("Anchieta", "24");
insert into tblCidade (nomeCidade, codEstado) values("Angelina", "24");
insert into tblCidade (nomeCidade, codEstado) values("Anita Garibaldi", "24");
insert into tblCidade (nomeCidade, codEstado) values("Anitápolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Carlos", "24");
insert into tblCidade (nomeCidade, codEstado) values("Apiúna", "24");
insert into tblCidade (nomeCidade, codEstado) values("Arabutã", "24");
insert into tblCidade (nomeCidade, codEstado) values("Araquari", "24");
insert into tblCidade (nomeCidade, codEstado) values("Araranguá", "24");
insert into tblCidade (nomeCidade, codEstado) values("Armazém", "24");
insert into tblCidade (nomeCidade, codEstado) values("Arroio Trinta", "24");
insert into tblCidade (nomeCidade, codEstado) values("Arvoredo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ascurra", "24");
insert into tblCidade (nomeCidade, codEstado) values("Atalanta", "24");
insert into tblCidade (nomeCidade, codEstado) values("Aurora", "24");
insert into tblCidade (nomeCidade, codEstado) values("Balneário Arroio do Silva", "24");
insert into tblCidade (nomeCidade, codEstado) values("Balneário Barra do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Balneário Camboriú", "24");
insert into tblCidade (nomeCidade, codEstado) values("Balneário Gaivota", "24");
insert into tblCidade (nomeCidade, codEstado) values("Balneário Piçarras", "24");
insert into tblCidade (nomeCidade, codEstado) values("Bandeirante", "24");
insert into tblCidade (nomeCidade, codEstado) values("Barra Bonita", "24");
insert into tblCidade (nomeCidade, codEstado) values("Barra Velha", "24");
insert into tblCidade (nomeCidade, codEstado) values("Bela Vista do Toldo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Belmonte", "24");
insert into tblCidade (nomeCidade, codEstado) values("Benedito Novo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Biguaçu", "24");
insert into tblCidade (nomeCidade, codEstado) values("Blumenau", "24");
insert into tblCidade (nomeCidade, codEstado) values("Bocaina do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jardim da Serra", "24");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus", "24");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Oeste", "24");
insert into tblCidade (nomeCidade, codEstado) values("Bom Retiro", "24");
insert into tblCidade (nomeCidade, codEstado) values("Bombinhas", "24");
insert into tblCidade (nomeCidade, codEstado) values("Botuverá", "24");
insert into tblCidade (nomeCidade, codEstado) values("Braço do Norte", "24");
insert into tblCidade (nomeCidade, codEstado) values("Braço do Trombudo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Brunópolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Brusque", "24");
insert into tblCidade (nomeCidade, codEstado) values("Caçador", "24");
insert into tblCidade (nomeCidade, codEstado) values("Caibi", "24");
insert into tblCidade (nomeCidade, codEstado) values("Calmon", "24");
insert into tblCidade (nomeCidade, codEstado) values("Camboriú", "24");
insert into tblCidade (nomeCidade, codEstado) values("Campo Alegre", "24");
insert into tblCidade (nomeCidade, codEstado) values("Campo Belo do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Campo Erê", "24");
insert into tblCidade (nomeCidade, codEstado) values("Campos Novos", "24");
insert into tblCidade (nomeCidade, codEstado) values("Canelinha", "24");
insert into tblCidade (nomeCidade, codEstado) values("Canoinhas", "24");
insert into tblCidade (nomeCidade, codEstado) values("Capão Alto", "24");
insert into tblCidade (nomeCidade, codEstado) values("Capinzal", "24");
insert into tblCidade (nomeCidade, codEstado) values("Capivari de Baixo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Catanduvas", "24");
insert into tblCidade (nomeCidade, codEstado) values("Caxambu do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Celso Ramos", "24");
insert into tblCidade (nomeCidade, codEstado) values("Cerro Negro", "24");
insert into tblCidade (nomeCidade, codEstado) values("Chapadão do Lageado", "24");
insert into tblCidade (nomeCidade, codEstado) values("Chapecó", "24");
insert into tblCidade (nomeCidade, codEstado) values("Cocal do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Concórdia", "24");
insert into tblCidade (nomeCidade, codEstado) values("Cordilheira Alta", "24");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Freitas", "24");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Martins", "24");
insert into tblCidade (nomeCidade, codEstado) values("Correia Pinto", "24");
insert into tblCidade (nomeCidade, codEstado) values("Corupá", "24");
insert into tblCidade (nomeCidade, codEstado) values("Criciúma", "24");
insert into tblCidade (nomeCidade, codEstado) values("Cunha Porã", "24");
insert into tblCidade (nomeCidade, codEstado) values("Cunhataí", "24");
insert into tblCidade (nomeCidade, codEstado) values("Curitibanos", "24");
insert into tblCidade (nomeCidade, codEstado) values("Descanso", "24");
insert into tblCidade (nomeCidade, codEstado) values("Dionísio Cerqueira", "24");
insert into tblCidade (nomeCidade, codEstado) values("Dona Emma", "24");
insert into tblCidade (nomeCidade, codEstado) values("Doutor Pedrinho", "24");
insert into tblCidade (nomeCidade, codEstado) values("Entre Rios", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ermo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Erval Velho", "24");
insert into tblCidade (nomeCidade, codEstado) values("Faxinal dos Guedes", "24");
insert into tblCidade (nomeCidade, codEstado) values("Flor do Sertão", "24");
insert into tblCidade (nomeCidade, codEstado) values("Florianópolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Formosa do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Forquilhinha", "24");
insert into tblCidade (nomeCidade, codEstado) values("Fraiburgo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Frei Rogério", "24");
insert into tblCidade (nomeCidade, codEstado) values("Galvão", "24");
insert into tblCidade (nomeCidade, codEstado) values("Garopaba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Garuva", "24");
insert into tblCidade (nomeCidade, codEstado) values("Gaspar", "24");
insert into tblCidade (nomeCidade, codEstado) values("Governador Celso Ramos", "24");
insert into tblCidade (nomeCidade, codEstado) values("Grão Pará", "24");
insert into tblCidade (nomeCidade, codEstado) values("Gravatal", "24");
insert into tblCidade (nomeCidade, codEstado) values("Guabiruba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Guaraciaba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Guaramirim", "24");
insert into tblCidade (nomeCidade, codEstado) values("Guarujá do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Guatambú", "24");
insert into tblCidade (nomeCidade, codEstado) values("Herval d'Oeste", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ibiam", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ibicaré", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ibirama", "24");
insert into tblCidade (nomeCidade, codEstado) values("Içara", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ilhota", "24");
insert into tblCidade (nomeCidade, codEstado) values("Imaruí", "24");
insert into tblCidade (nomeCidade, codEstado) values("Imbituba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Imbuia", "24");
insert into tblCidade (nomeCidade, codEstado) values("Indaial", "24");
insert into tblCidade (nomeCidade, codEstado) values("Iomerê", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ipira", "24");
insert into tblCidade (nomeCidade, codEstado) values("Iporã do Oeste", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ipuaçu", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ipumirim", "24");
insert into tblCidade (nomeCidade, codEstado) values("Iraceminha", "24");
insert into tblCidade (nomeCidade, codEstado) values("Irani", "24");
insert into tblCidade (nomeCidade, codEstado) values("Irati", "24");
insert into tblCidade (nomeCidade, codEstado) values("Irineópolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Itá", "24");
insert into tblCidade (nomeCidade, codEstado) values("Itaiópolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Itajaí", "24");
insert into tblCidade (nomeCidade, codEstado) values("Itapema", "24");
insert into tblCidade (nomeCidade, codEstado) values("Itapiranga", "24");
insert into tblCidade (nomeCidade, codEstado) values("Itapoá", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ituporanga", "24");
insert into tblCidade (nomeCidade, codEstado) values("Jaborá", "24");
insert into tblCidade (nomeCidade, codEstado) values("Jacinto Machado", "24");
insert into tblCidade (nomeCidade, codEstado) values("Jaguaruna", "24");
insert into tblCidade (nomeCidade, codEstado) values("Jaraguá do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Jardinópolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Joaçaba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Joinville", "24");
insert into tblCidade (nomeCidade, codEstado) values("José Boiteux", "24");
insert into tblCidade (nomeCidade, codEstado) values("Jupiá", "24");
insert into tblCidade (nomeCidade, codEstado) values("Lacerdópolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Lages", "24");
insert into tblCidade (nomeCidade, codEstado) values("Laguna", "24");
insert into tblCidade (nomeCidade, codEstado) values("Lajeado Grande", "24");
insert into tblCidade (nomeCidade, codEstado) values("Laurentino", "24");
insert into tblCidade (nomeCidade, codEstado) values("Lauro Muller", "24");
insert into tblCidade (nomeCidade, codEstado) values("Lebon Régis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Leoberto Leal", "24");
insert into tblCidade (nomeCidade, codEstado) values("Lindóia do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Lontras", "24");
insert into tblCidade (nomeCidade, codEstado) values("Luiz Alves", "24");
insert into tblCidade (nomeCidade, codEstado) values("Luzerna", "24");
insert into tblCidade (nomeCidade, codEstado) values("Macieira", "24");
insert into tblCidade (nomeCidade, codEstado) values("Mafra", "24");
insert into tblCidade (nomeCidade, codEstado) values("Major Gercino", "24");
insert into tblCidade (nomeCidade, codEstado) values("Major Vieira", "24");
insert into tblCidade (nomeCidade, codEstado) values("Maracajá", "24");
insert into tblCidade (nomeCidade, codEstado) values("Maravilha", "24");
insert into tblCidade (nomeCidade, codEstado) values("Marema", "24");
insert into tblCidade (nomeCidade, codEstado) values("Massaranduba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Matos Costa", "24");
insert into tblCidade (nomeCidade, codEstado) values("Meleiro", "24");
insert into tblCidade (nomeCidade, codEstado) values("Mirim Doce", "24");
insert into tblCidade (nomeCidade, codEstado) values("Modelo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Mondaí", "24");
insert into tblCidade (nomeCidade, codEstado) values("Monte Carlo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Monte Castelo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Morro da Fumaça", "24");
insert into tblCidade (nomeCidade, codEstado) values("Morro Grande", "24");
insert into tblCidade (nomeCidade, codEstado) values("Navegantes", "24");
insert into tblCidade (nomeCidade, codEstado) values("Nova Erechim", "24");
insert into tblCidade (nomeCidade, codEstado) values("Nova Itaberaba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Nova Trento", "24");
insert into tblCidade (nomeCidade, codEstado) values("Nova Veneza", "24");
insert into tblCidade (nomeCidade, codEstado) values("Novo Horizonte", "24");
insert into tblCidade (nomeCidade, codEstado) values("Orleans", "24");
insert into tblCidade (nomeCidade, codEstado) values("Otacílio Costa", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ouro", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Verde", "24");
insert into tblCidade (nomeCidade, codEstado) values("Paial", "24");
insert into tblCidade (nomeCidade, codEstado) values("Painel", "24");
insert into tblCidade (nomeCidade, codEstado) values("Palhoça", "24");
insert into tblCidade (nomeCidade, codEstado) values("Palma Sola", "24");
insert into tblCidade (nomeCidade, codEstado) values("Palmeira", "24");
insert into tblCidade (nomeCidade, codEstado) values("Palmitos", "24");
insert into tblCidade (nomeCidade, codEstado) values("Papanduva", "24");
insert into tblCidade (nomeCidade, codEstado) values("Paraíso", "24");
insert into tblCidade (nomeCidade, codEstado) values("Passo de Torres", "24");
insert into tblCidade (nomeCidade, codEstado) values("Passos Maia", "24");
insert into tblCidade (nomeCidade, codEstado) values("Paulo Lopes", "24");
insert into tblCidade (nomeCidade, codEstado) values("Pedras Grandes", "24");
insert into tblCidade (nomeCidade, codEstado) values("Penha", "24");
insert into tblCidade (nomeCidade, codEstado) values("Peritiba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Petrolândia", "24");
insert into tblCidade (nomeCidade, codEstado) values("Pinhalzinho", "24");
insert into tblCidade (nomeCidade, codEstado) values("Pinheiro Preto", "24");
insert into tblCidade (nomeCidade, codEstado) values("Piratuba", "24");
insert into tblCidade (nomeCidade, codEstado) values("Planalto Alegre", "24");
insert into tblCidade (nomeCidade, codEstado) values("Pomerode", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ponte Alta", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ponte Alta do Norte", "24");
insert into tblCidade (nomeCidade, codEstado) values("Ponte Serrada", "24");
insert into tblCidade (nomeCidade, codEstado) values("Porto Belo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Porto União", "24");
insert into tblCidade (nomeCidade, codEstado) values("Pouso Redondo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Praia Grande", "24");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Castello Branco", "24");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Getúlio", "24");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Nereu", "24");
insert into tblCidade (nomeCidade, codEstado) values("Princesa", "24");
insert into tblCidade (nomeCidade, codEstado) values("Quilombo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rancho Queimado", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rio das Antas", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rio do Campo", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rio do Oeste", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rio do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rio dos Cedros", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rio Fortuna", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rio Negrinho", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rio Rufino", "24");
insert into tblCidade (nomeCidade, codEstado) values("Riqueza", "24");
insert into tblCidade (nomeCidade, codEstado) values("Rodeio", "24");
insert into tblCidade (nomeCidade, codEstado) values("Romelândia", "24");
insert into tblCidade (nomeCidade, codEstado) values("Salete", "24");
insert into tblCidade (nomeCidade, codEstado) values("Saltinho", "24");
insert into tblCidade (nomeCidade, codEstado) values("Salto Veloso", "24");
insert into tblCidade (nomeCidade, codEstado) values("Sangão", "24");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cecília", "24");
insert into tblCidade (nomeCidade, codEstado) values("Santa Helena", "24");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa de Lima", "24");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Santa Terezinha", "24");
insert into tblCidade (nomeCidade, codEstado) values("Santa Terezinha do Progresso", "24");
insert into tblCidade (nomeCidade, codEstado) values("Santiago do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Santo Amaro da Imperatriz", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Bento do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Bernardino", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Bonifácio", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Carlos", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Cristovão do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("São João Batista", "24");
insert into tblCidade (nomeCidade, codEstado) values("São João do Itaperiú", "24");
insert into tblCidade (nomeCidade, codEstado) values("São João do Oeste", "24");
insert into tblCidade (nomeCidade, codEstado) values("São João do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Joaquim", "24");
insert into tblCidade (nomeCidade, codEstado) values("São José", "24");
insert into tblCidade (nomeCidade, codEstado) values("São José do Cedro", "24");
insert into tblCidade (nomeCidade, codEstado) values("São José do Cerrito", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Lourenço do Oeste", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Ludgero", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Martinho", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel da Boa Vista", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Oeste", "24");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro de Alcântara", "24");
insert into tblCidade (nomeCidade, codEstado) values("Saudades", "24");
insert into tblCidade (nomeCidade, codEstado) values("Schroeder", "24");
insert into tblCidade (nomeCidade, codEstado) values("Seara", "24");
insert into tblCidade (nomeCidade, codEstado) values("Serra Alta", "24");
insert into tblCidade (nomeCidade, codEstado) values("Siderópolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Sombrio", "24");
insert into tblCidade (nomeCidade, codEstado) values("Sul Brasil", "24");
insert into tblCidade (nomeCidade, codEstado) values("Taió", "24");
insert into tblCidade (nomeCidade, codEstado) values("Tangará", "24");
insert into tblCidade (nomeCidade, codEstado) values("Tigrinhos", "24");
insert into tblCidade (nomeCidade, codEstado) values("Tijucas", "24");
insert into tblCidade (nomeCidade, codEstado) values("Timbé do Sul", "24");
insert into tblCidade (nomeCidade, codEstado) values("Timbó", "24");
insert into tblCidade (nomeCidade, codEstado) values("Timbó Grande", "24");
insert into tblCidade (nomeCidade, codEstado) values("Três Barras", "24");
insert into tblCidade (nomeCidade, codEstado) values("Treviso", "24");
insert into tblCidade (nomeCidade, codEstado) values("Treze de Maio", "24");
insert into tblCidade (nomeCidade, codEstado) values("Treze Tílias", "24");
insert into tblCidade (nomeCidade, codEstado) values("Trombudo Central", "24");
insert into tblCidade (nomeCidade, codEstado) values("Tubarão", "24");
insert into tblCidade (nomeCidade, codEstado) values("Tunápolis", "24");
insert into tblCidade (nomeCidade, codEstado) values("Turvo", "24");
insert into tblCidade (nomeCidade, codEstado) values("União do Oeste", "24");
insert into tblCidade (nomeCidade, codEstado) values("Urubici", "24");
insert into tblCidade (nomeCidade, codEstado) values("Urupema", "24");
insert into tblCidade (nomeCidade, codEstado) values("Urussanga", "24");
insert into tblCidade (nomeCidade, codEstado) values("Vargeão", "24");
insert into tblCidade (nomeCidade, codEstado) values("Vargem", "24");
insert into tblCidade (nomeCidade, codEstado) values("Vargem Bonita", "24");
insert into tblCidade (nomeCidade, codEstado) values("Vidal Ramos", "24");
insert into tblCidade (nomeCidade, codEstado) values("Videira", "24");
insert into tblCidade (nomeCidade, codEstado) values("Vitor Meireles", "24");
insert into tblCidade (nomeCidade, codEstado) values("Witmarsum", "24");
insert into tblCidade (nomeCidade, codEstado) values("Xanxerê", "24");
insert into tblCidade (nomeCidade, codEstado) values("Xavantina", "24");
insert into tblCidade (nomeCidade, codEstado) values("Xaxim", "24");
insert into tblCidade (nomeCidade, codEstado) values("Zortéa", "24");
insert into tblCidade (nomeCidade, codEstado) values("Aceguá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Água Santa", "23");
insert into tblCidade (nomeCidade, codEstado) values("Agudo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ajuricaba", "23");
insert into tblCidade (nomeCidade, codEstado) values("Alecrim", "23");
insert into tblCidade (nomeCidade, codEstado) values("Alegrete", "23");
insert into tblCidade (nomeCidade, codEstado) values("Alegria", "23");
insert into tblCidade (nomeCidade, codEstado) values("Almirante Tamandaré do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Alpestre", "23");
insert into tblCidade (nomeCidade, codEstado) values("Alto Alegre", "23");
insert into tblCidade (nomeCidade, codEstado) values("Alto Feliz", "23");
insert into tblCidade (nomeCidade, codEstado) values("Alvorada", "23");
insert into tblCidade (nomeCidade, codEstado) values("Amaral Ferrador", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ametista do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("André da Rocha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Anta Gorda", "23");
insert into tblCidade (nomeCidade, codEstado) values("Antônio Prado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Arambaré", "23");
insert into tblCidade (nomeCidade, codEstado) values("Araricá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Aratiba", "23");
insert into tblCidade (nomeCidade, codEstado) values("Arroio do Meio", "23");
insert into tblCidade (nomeCidade, codEstado) values("Arroio do Padre", "23");
insert into tblCidade (nomeCidade, codEstado) values("Arroio do Sal", "23");
insert into tblCidade (nomeCidade, codEstado) values("Arroio do Tigre", "23");
insert into tblCidade (nomeCidade, codEstado) values("Arroio dos Ratos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Arroio Grande", "23");
insert into tblCidade (nomeCidade, codEstado) values("Arvorezinha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Augusto Pestana", "23");
insert into tblCidade (nomeCidade, codEstado) values("Áurea", "23");
insert into tblCidade (nomeCidade, codEstado) values("Bagé", "23");
insert into tblCidade (nomeCidade, codEstado) values("Balneário Pinhal", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barão de Cotegipe", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barão do Triunfo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Guarita", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Quaraí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Ribeiro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Rio Azul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barra Funda", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barracão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Barros Cassal", "23");
insert into tblCidade (nomeCidade, codEstado) values("Benjamin Constant do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Bento Gonçalves", "23");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista do Buricá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista do Cadeado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista do Incra", "23");
insert into tblCidade (nomeCidade, codEstado) values("Boa Vista do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus", "23");
insert into tblCidade (nomeCidade, codEstado) values("Bom Princípio", "23");
insert into tblCidade (nomeCidade, codEstado) values("Bom Progresso", "23");
insert into tblCidade (nomeCidade, codEstado) values("Bom Retiro do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Boqueirão do Leão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Bossoroca", "23");
insert into tblCidade (nomeCidade, codEstado) values("Bozano", "23");
insert into tblCidade (nomeCidade, codEstado) values("Braga", "23");
insert into tblCidade (nomeCidade, codEstado) values("Brochier", "23");
insert into tblCidade (nomeCidade, codEstado) values("Butiá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Caçapava do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cacequi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeirinha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cacique Doble", "23");
insert into tblCidade (nomeCidade, codEstado) values("Caibaté", "23");
insert into tblCidade (nomeCidade, codEstado) values("Caiçara", "23");
insert into tblCidade (nomeCidade, codEstado) values("Camaquã", "23");
insert into tblCidade (nomeCidade, codEstado) values("Camargo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cambará do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Campestre da Serra", "23");
insert into tblCidade (nomeCidade, codEstado) values("Campina das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Campinas do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Campo Bom", "23");
insert into tblCidade (nomeCidade, codEstado) values("Campo Novo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Campos Borges", "23");
insert into tblCidade (nomeCidade, codEstado) values("Candelária", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cândido Godói", "23");
insert into tblCidade (nomeCidade, codEstado) values("Candiota", "23");
insert into tblCidade (nomeCidade, codEstado) values("Canela", "23");
insert into tblCidade (nomeCidade, codEstado) values("Canguçu", "23");
insert into tblCidade (nomeCidade, codEstado) values("Canoas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Canudos do Vale", "23");
insert into tblCidade (nomeCidade, codEstado) values("Capão Bonito do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Capão da Canoa", "23");
insert into tblCidade (nomeCidade, codEstado) values("Capão do Cipó", "23");
insert into tblCidade (nomeCidade, codEstado) values("Capão do Leão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Capela de Santana", "23");
insert into tblCidade (nomeCidade, codEstado) values("Capitão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Capivari do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Caraá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Carazinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Carlos Barbosa", "23");
insert into tblCidade (nomeCidade, codEstado) values("Carlos Gomes", "23");
insert into tblCidade (nomeCidade, codEstado) values("Casca", "23");
insert into tblCidade (nomeCidade, codEstado) values("Caseiros", "23");
insert into tblCidade (nomeCidade, codEstado) values("Catuípe", "23");
insert into tblCidade (nomeCidade, codEstado) values("Caxias do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Centenário", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cerrito", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cerro Branco", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cerro Grande", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cerro Grande do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cerro Largo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Chapada", "23");
insert into tblCidade (nomeCidade, codEstado) values("Charqueadas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Charrua", "23");
insert into tblCidade (nomeCidade, codEstado) values("Chiapetta", "23");
insert into tblCidade (nomeCidade, codEstado) values("Chuí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Chuvisca", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cidreira", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ciríaco", "23");
insert into tblCidade (nomeCidade, codEstado) values("Colinas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Colorado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Condor", "23");
insert into tblCidade (nomeCidade, codEstado) values("Constantina", "23");
insert into tblCidade (nomeCidade, codEstado) values("Coqueiro Baixo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Coqueiros do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Barros", "23");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Bicaco", "23");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Pilar", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cotiporã", "23");
insert into tblCidade (nomeCidade, codEstado) values("Coxilha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Crissiumal", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cristal", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cristal do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cruz Alta", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cruzaltense", "23");
insert into tblCidade (nomeCidade, codEstado) values("Cruzeiro do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("David Canabarro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Derrubadas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dezesseis de Novembro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dilermando de Aguiar", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dois Irmãos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dois Irmãos das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dois Lajeados", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dom Feliciano", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dom Pedrito", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dom Pedro de Alcântara", "23");
insert into tblCidade (nomeCidade, codEstado) values("Dona Francisca", "23");
insert into tblCidade (nomeCidade, codEstado) values("Doutor Maurício Cardoso", "23");
insert into tblCidade (nomeCidade, codEstado) values("Doutor Ricardo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Eldorado do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Encantado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Encruzilhada do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Engenho Velho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Entre Rios do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Entre-Ijuís", "23");
insert into tblCidade (nomeCidade, codEstado) values("Erebango", "23");
insert into tblCidade (nomeCidade, codEstado) values("Erechim", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ernestina", "23");
insert into tblCidade (nomeCidade, codEstado) values("Erval Grande", "23");
insert into tblCidade (nomeCidade, codEstado) values("Erval Seco", "23");
insert into tblCidade (nomeCidade, codEstado) values("Esmeralda", "23");
insert into tblCidade (nomeCidade, codEstado) values("Esperança do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Espumoso", "23");
insert into tblCidade (nomeCidade, codEstado) values("Estação", "23");
insert into tblCidade (nomeCidade, codEstado) values("Estância Velha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Esteio", "23");
insert into tblCidade (nomeCidade, codEstado) values("Estrela", "23");
insert into tblCidade (nomeCidade, codEstado) values("Estrela Velha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Eugênio de Castro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Fagundes Varela", "23");
insert into tblCidade (nomeCidade, codEstado) values("Farroupilha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Faxinal do Soturno", "23");
insert into tblCidade (nomeCidade, codEstado) values("Faxinalzinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Fazenda Vilanova", "23");
insert into tblCidade (nomeCidade, codEstado) values("Feliz", "23");
insert into tblCidade (nomeCidade, codEstado) values("Flores da Cunha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Floriano Peixoto", "23");
insert into tblCidade (nomeCidade, codEstado) values("Fontoura Xavier", "23");
insert into tblCidade (nomeCidade, codEstado) values("Formigueiro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Forquetinha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Fortaleza dos Valos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Frederico Westphalen", "23");
insert into tblCidade (nomeCidade, codEstado) values("Garibaldi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Garruchos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Gaurama", "23");
insert into tblCidade (nomeCidade, codEstado) values("General Câmara", "23");
insert into tblCidade (nomeCidade, codEstado) values("Gentil", "23");
insert into tblCidade (nomeCidade, codEstado) values("Getúlio Vargas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Giruá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Glorinha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Gramado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Gramado dos Loureiros", "23");
insert into tblCidade (nomeCidade, codEstado) values("Gramado Xavier", "23");
insert into tblCidade (nomeCidade, codEstado) values("Gravataí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Guabiju", "23");
insert into tblCidade (nomeCidade, codEstado) values("Guaíba", "23");
insert into tblCidade (nomeCidade, codEstado) values("Guaporé", "23");
insert into tblCidade (nomeCidade, codEstado) values("Guarani das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Harmonia", "23");
insert into tblCidade (nomeCidade, codEstado) values("Herval", "23");
insert into tblCidade (nomeCidade, codEstado) values("Herveiras", "23");
insert into tblCidade (nomeCidade, codEstado) values("Horizontina", "23");
insert into tblCidade (nomeCidade, codEstado) values("Hulha Negra", "23");
insert into tblCidade (nomeCidade, codEstado) values("Humaitá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ibarama", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ibiaçá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ibiraiaras", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ibirapuitã", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ibirubá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Igrejinha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ijuí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ilópolis", "23");
insert into tblCidade (nomeCidade, codEstado) values("Imbé", "23");
insert into tblCidade (nomeCidade, codEstado) values("Imigrante", "23");
insert into tblCidade (nomeCidade, codEstado) values("Independência", "23");
insert into tblCidade (nomeCidade, codEstado) values("Inhacorá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ipê", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ipiranga do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Iraí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Itaara", "23");
insert into tblCidade (nomeCidade, codEstado) values("Itacurubi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Itapuca", "23");
insert into tblCidade (nomeCidade, codEstado) values("Itaqui", "23");
insert into tblCidade (nomeCidade, codEstado) values("Itati", "23");
insert into tblCidade (nomeCidade, codEstado) values("Itatiba do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ivorá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ivoti", "23");
insert into tblCidade (nomeCidade, codEstado) values("Jaboticaba", "23");
insert into tblCidade (nomeCidade, codEstado) values("Jacuizinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Jacutinga", "23");
insert into tblCidade (nomeCidade, codEstado) values("Jaguarão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Jaguari", "23");
insert into tblCidade (nomeCidade, codEstado) values("Jaquirana", "23");
insert into tblCidade (nomeCidade, codEstado) values("Jari", "23");
insert into tblCidade (nomeCidade, codEstado) values("Jóia", "23");
insert into tblCidade (nomeCidade, codEstado) values("Júlio de Castilhos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Bonita do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa dos Três Cantos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Vermelha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Lagoão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Lajeado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Lajeado do Bugre", "23");
insert into tblCidade (nomeCidade, codEstado) values("Lavras do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Liberato Salzano", "23");
insert into tblCidade (nomeCidade, codEstado) values("Lindolfo Collor", "23");
insert into tblCidade (nomeCidade, codEstado) values("Linha Nova", "23");
insert into tblCidade (nomeCidade, codEstado) values("Maçambará", "23");
insert into tblCidade (nomeCidade, codEstado) values("Machadinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mampituba", "23");
insert into tblCidade (nomeCidade, codEstado) values("Manoel Viana", "23");
insert into tblCidade (nomeCidade, codEstado) values("Maquiné", "23");
insert into tblCidade (nomeCidade, codEstado) values("Maratá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Marau", "23");
insert into tblCidade (nomeCidade, codEstado) values("Marcelino Ramos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mariana Pimentel", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mariano Moro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Marques de Souza", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mata", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mato Castelhano", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mato Leitão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mato Queimado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Maximiliano de Almeida", "23");
insert into tblCidade (nomeCidade, codEstado) values("Minas do Leão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Miraguaí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Montauri", "23");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alegre dos Campos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Monte Belo do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Montenegro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mormaço", "23");
insert into tblCidade (nomeCidade, codEstado) values("Morrinhos do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Morro Redondo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Morro Reuter", "23");
insert into tblCidade (nomeCidade, codEstado) values("Mostardas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Muçum", "23");
insert into tblCidade (nomeCidade, codEstado) values("Muitos Capões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Muliterno", "23");
insert into tblCidade (nomeCidade, codEstado) values("Não-Me-Toque", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nicolau Vergueiro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nonoai", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Alvorada", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Araçá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Bassano", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Boa Vista", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Bréscia", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Candelária", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Esperança do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Hartz", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Pádua", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Palma", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Petrópolis", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Prata", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Ramada", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Roma do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Nova Santa Rita", "23");
insert into tblCidade (nomeCidade, codEstado) values("Novo Barreiro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Novo Cabrais", "23");
insert into tblCidade (nomeCidade, codEstado) values("Novo Hamburgo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Novo Machado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Novo Tiradentes", "23");
insert into tblCidade (nomeCidade, codEstado) values("Novo Xingu", "23");
insert into tblCidade (nomeCidade, codEstado) values("Osório", "23");
insert into tblCidade (nomeCidade, codEstado) values("Paim Filho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Palmares do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Palmeira das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Palmitinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Panambi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pantano Grande", "23");
insert into tblCidade (nomeCidade, codEstado) values("Paraí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Paraíso do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pareci Novo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Parobé", "23");
insert into tblCidade (nomeCidade, codEstado) values("Passa Sete", "23");
insert into tblCidade (nomeCidade, codEstado) values("Passo do Sobrado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Passo Fundo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Paulo Bento", "23");
insert into tblCidade (nomeCidade, codEstado) values("Paverama", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pedras Altas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Osório", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pejuçara", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pelotas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Picada Café", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pinhal", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pinhal da Serra", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pinhal Grande", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pinheirinho do Vale", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pinheiro Machado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pirapó", "23");
insert into tblCidade (nomeCidade, codEstado) values("Piratini", "23");
insert into tblCidade (nomeCidade, codEstado) values("Planalto", "23");
insert into tblCidade (nomeCidade, codEstado) values("Poço das Antas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pontão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ponte Preta", "23");
insert into tblCidade (nomeCidade, codEstado) values("Portão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Porto Alegre", "23");
insert into tblCidade (nomeCidade, codEstado) values("Porto Lucena", "23");
insert into tblCidade (nomeCidade, codEstado) values("Porto Mauá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Porto Vera Cruz", "23");
insert into tblCidade (nomeCidade, codEstado) values("Porto Xavier", "23");
insert into tblCidade (nomeCidade, codEstado) values("Pouso Novo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Presidente Lucena", "23");
insert into tblCidade (nomeCidade, codEstado) values("Progresso", "23");
insert into tblCidade (nomeCidade, codEstado) values("Protásio Alves", "23");
insert into tblCidade (nomeCidade, codEstado) values("Putinga", "23");
insert into tblCidade (nomeCidade, codEstado) values("Quaraí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Quatro Irmãos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Quevedos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Quinze de Novembro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Redentora", "23");
insert into tblCidade (nomeCidade, codEstado) values("Relvado", "23");
insert into tblCidade (nomeCidade, codEstado) values("Restinga Seca", "23");
insert into tblCidade (nomeCidade, codEstado) values("Rio dos Índios", "23");
insert into tblCidade (nomeCidade, codEstado) values("Rio Grande", "23");
insert into tblCidade (nomeCidade, codEstado) values("Rio Pardo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Riozinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Roca Sales", "23");
insert into tblCidade (nomeCidade, codEstado) values("Rodeio Bonito", "23");
insert into tblCidade (nomeCidade, codEstado) values("Rolador", "23");
insert into tblCidade (nomeCidade, codEstado) values("Rolante", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ronda Alta", "23");
insert into tblCidade (nomeCidade, codEstado) values("Rondinha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Roque Gonzales", "23");
insert into tblCidade (nomeCidade, codEstado) values("Rosário do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sagrada Família", "23");
insert into tblCidade (nomeCidade, codEstado) values("Saldanha Marinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Salto do Jacuí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Salvador das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Salvador do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sananduva", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cecília do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Clara do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Margarida do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Maria do Herval", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Tereza", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santa Vitória do Palmar", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santana da Boa Vista", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sant'Ana do Livramento", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santiago", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santo Ângelo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio da Patrulha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Palma", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Planalto", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santo Augusto", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santo Cristo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Santo Expedito do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Borja", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco de Assis", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco de Paula", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Gabriel", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Jerônimo", "23");
insert into tblCidade (nomeCidade, codEstado) values("São João da Urtiga", "23");
insert into tblCidade (nomeCidade, codEstado) values("São João do Polêsine", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Jorge", "23");
insert into tblCidade (nomeCidade, codEstado) values("São José das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("São José do Herval", "23");
insert into tblCidade (nomeCidade, codEstado) values("São José do Hortêncio", "23");
insert into tblCidade (nomeCidade, codEstado) values("São José do Inhacorá", "23");
insert into tblCidade (nomeCidade, codEstado) values("São José do Norte", "23");
insert into tblCidade (nomeCidade, codEstado) values("São José do Ouro", "23");
insert into tblCidade (nomeCidade, codEstado) values("São José do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("São José dos Ausentes", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Leopoldo", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Lourenço do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Luiz Gonzaga", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Marcos", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Martinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Martinho da Serra", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Nicolau", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Paulo das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro da Serra", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro do Butiá", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Sebastião do Caí", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Sepé", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Valentim", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Valentim do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Valério do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Vendelino", "23");
insert into tblCidade (nomeCidade, codEstado) values("São Vicente do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sapiranga", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sapucaia do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sarandi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Seberi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sede Nova", "23");
insert into tblCidade (nomeCidade, codEstado) values("Segredo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Selbach", "23");
insert into tblCidade (nomeCidade, codEstado) values("Senador Salgado Filho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sentinela do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Serafina Corrêa", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sério", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sertão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sertão Santana", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sete de Setembro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Severiano de Almeida", "23");
insert into tblCidade (nomeCidade, codEstado) values("Silveira Martins", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sinimbu", "23");
insert into tblCidade (nomeCidade, codEstado) values("Sobradinho", "23");
insert into tblCidade (nomeCidade, codEstado) values("Soledade", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tabaí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tapejara", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tapera", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tapes", "23");
insert into tblCidade (nomeCidade, codEstado) values("Taquara", "23");
insert into tblCidade (nomeCidade, codEstado) values("Taquari", "23");
insert into tblCidade (nomeCidade, codEstado) values("Taquaruçu do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tavares", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tenente Portela", "23");
insert into tblCidade (nomeCidade, codEstado) values("Terra de Areia", "23");
insert into tblCidade (nomeCidade, codEstado) values("Teutônia", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tio Hugo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tiradentes do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Toropi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Torres", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tramandaí", "23");
insert into tblCidade (nomeCidade, codEstado) values("Travesseiro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Três Arroios", "23");
insert into tblCidade (nomeCidade, codEstado) values("Três Cachoeiras", "23");
insert into tblCidade (nomeCidade, codEstado) values("Três Coroas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Três de Maio", "23");
insert into tblCidade (nomeCidade, codEstado) values("Três Forquilhas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Três Palmeiras", "23");
insert into tblCidade (nomeCidade, codEstado) values("Três Passos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Trindade do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Triunfo", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tucunduva", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tunas", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tupanci do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tupanciretã", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tupandi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Tuparendi", "23");
insert into tblCidade (nomeCidade, codEstado) values("Turuçu", "23");
insert into tblCidade (nomeCidade, codEstado) values("Ubiretama", "23");
insert into tblCidade (nomeCidade, codEstado) values("União da Serra", "23");
insert into tblCidade (nomeCidade, codEstado) values("Unistalda", "23");
insert into tblCidade (nomeCidade, codEstado) values("Uruguaiana", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vacaria", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vale do Sol", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vale Real", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vale Verde", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vanini", "23");
insert into tblCidade (nomeCidade, codEstado) values("Venâncio Aires", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vera Cruz", "23");
insert into tblCidade (nomeCidade, codEstado) values("Veranópolis", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vespasiano Correa", "23");
insert into tblCidade (nomeCidade, codEstado) values("Viadutos", "23");
insert into tblCidade (nomeCidade, codEstado) values("Viamão", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vicente Dutra", "23");
insert into tblCidade (nomeCidade, codEstado) values("Victor Graeff", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vila Flores", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vila Lângaro", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vila Maria", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vila Nova do Sul", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vista Alegre", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vista Alegre do Prata", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vista Gaúcha", "23");
insert into tblCidade (nomeCidade, codEstado) values("Vitória das Missões", "23");
insert into tblCidade (nomeCidade, codEstado) values("Westfalia", "23");
insert into tblCidade (nomeCidade, codEstado) values("Xangri-lá", "23");
insert into tblCidade (nomeCidade, codEstado) values("Água Clara", "12");
insert into tblCidade (nomeCidade, codEstado) values("Alcinópolis", "12");
insert into tblCidade (nomeCidade, codEstado) values("Amambai", "12");
insert into tblCidade (nomeCidade, codEstado) values("Anastácio", "12");
insert into tblCidade (nomeCidade, codEstado) values("Anaurilândia", "12");
insert into tblCidade (nomeCidade, codEstado) values("Angélica", "12");
insert into tblCidade (nomeCidade, codEstado) values("Antônio João", "12");
insert into tblCidade (nomeCidade, codEstado) values("Aparecida do Taboado", "12");
insert into tblCidade (nomeCidade, codEstado) values("Aquidauana", "12");
insert into tblCidade (nomeCidade, codEstado) values("Aral Moreira", "12");
insert into tblCidade (nomeCidade, codEstado) values("Bandeirantes", "12");
insert into tblCidade (nomeCidade, codEstado) values("Bataguassu", "12");
insert into tblCidade (nomeCidade, codEstado) values("Batayporã", "12");
insert into tblCidade (nomeCidade, codEstado) values("Bela Vista", "12");
insert into tblCidade (nomeCidade, codEstado) values("Bodoquena", "12");
insert into tblCidade (nomeCidade, codEstado) values("Bonito", "12");
insert into tblCidade (nomeCidade, codEstado) values("Brasilândia", "12");
insert into tblCidade (nomeCidade, codEstado) values("Caarapó", "12");
insert into tblCidade (nomeCidade, codEstado) values("Camapuã", "12");
insert into tblCidade (nomeCidade, codEstado) values("Campo Grande", "12");
insert into tblCidade (nomeCidade, codEstado) values("Caracol", "12");
insert into tblCidade (nomeCidade, codEstado) values("Cassilândia", "12");
insert into tblCidade (nomeCidade, codEstado) values("Chapadão do Sul", "12");
insert into tblCidade (nomeCidade, codEstado) values("Corguinho", "12");
insert into tblCidade (nomeCidade, codEstado) values("Coronel Sapucaia", "12");
insert into tblCidade (nomeCidade, codEstado) values("Corumbá", "12");
insert into tblCidade (nomeCidade, codEstado) values("Costa Rica", "12");
insert into tblCidade (nomeCidade, codEstado) values("Coxim", "12");
insert into tblCidade (nomeCidade, codEstado) values("Deodápolis", "12");
insert into tblCidade (nomeCidade, codEstado) values("Dois Irmãos do Buriti", "12");
insert into tblCidade (nomeCidade, codEstado) values("Douradina", "12");
insert into tblCidade (nomeCidade, codEstado) values("Dourados", "12");
insert into tblCidade (nomeCidade, codEstado) values("Eldorado", "12");
insert into tblCidade (nomeCidade, codEstado) values("Fátima do Sul", "12");
insert into tblCidade (nomeCidade, codEstado) values("Figueirão", "12");
insert into tblCidade (nomeCidade, codEstado) values("Glória de Dourados", "12");
insert into tblCidade (nomeCidade, codEstado) values("Guia Lopes da Laguna", "12");
insert into tblCidade (nomeCidade, codEstado) values("Iguatemi", "12");
insert into tblCidade (nomeCidade, codEstado) values("Inocência", "12");
insert into tblCidade (nomeCidade, codEstado) values("Itaporã", "12");
insert into tblCidade (nomeCidade, codEstado) values("Itaquiraí", "12");
insert into tblCidade (nomeCidade, codEstado) values("Ivinhema", "12");
insert into tblCidade (nomeCidade, codEstado) values("Japorã", "12");
insert into tblCidade (nomeCidade, codEstado) values("Jaraguari", "12");
insert into tblCidade (nomeCidade, codEstado) values("Jardim", "12");
insert into tblCidade (nomeCidade, codEstado) values("Jateí", "12");
insert into tblCidade (nomeCidade, codEstado) values("Juti", "12");
insert into tblCidade (nomeCidade, codEstado) values("Ladário", "12");
insert into tblCidade (nomeCidade, codEstado) values("Laguna Carapã", "12");
insert into tblCidade (nomeCidade, codEstado) values("Maracaju", "12");
insert into tblCidade (nomeCidade, codEstado) values("Miranda", "12");
insert into tblCidade (nomeCidade, codEstado) values("Mundo Novo", "12");
insert into tblCidade (nomeCidade, codEstado) values("Naviraí", "12");
insert into tblCidade (nomeCidade, codEstado) values("Nioaque", "12");
insert into tblCidade (nomeCidade, codEstado) values("Nova Alvorada do Sul", "12");
insert into tblCidade (nomeCidade, codEstado) values("Nova Andradina", "12");
insert into tblCidade (nomeCidade, codEstado) values("Novo Horizonte do Sul", "12");
insert into tblCidade (nomeCidade, codEstado) values("Paranaíba", "12");
insert into tblCidade (nomeCidade, codEstado) values("Paranhos", "12");
insert into tblCidade (nomeCidade, codEstado) values("Pedro Gomes", "12");
insert into tblCidade (nomeCidade, codEstado) values("Ponta Porã", "12");
insert into tblCidade (nomeCidade, codEstado) values("Porto Murtinho", "12");
insert into tblCidade (nomeCidade, codEstado) values("Ribas do Rio Pardo", "12");
insert into tblCidade (nomeCidade, codEstado) values("Rio Brilhante", "12");
insert into tblCidade (nomeCidade, codEstado) values("Rio Negro", "12");
insert into tblCidade (nomeCidade, codEstado) values("Rio Verde de Mato Grosso", "12");
insert into tblCidade (nomeCidade, codEstado) values("Rochedo", "12");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita do Pardo", "12");
insert into tblCidade (nomeCidade, codEstado) values("São Gabriel do Oeste", "12");
insert into tblCidade (nomeCidade, codEstado) values("Selvíria", "12");
insert into tblCidade (nomeCidade, codEstado) values("Sete Quedas", "12");
insert into tblCidade (nomeCidade, codEstado) values("Sidrolândia", "12");
insert into tblCidade (nomeCidade, codEstado) values("Sonora", "12");
insert into tblCidade (nomeCidade, codEstado) values("Tacuru", "12");
insert into tblCidade (nomeCidade, codEstado) values("Taquarussu", "12");
insert into tblCidade (nomeCidade, codEstado) values("Terenos", "12");
insert into tblCidade (nomeCidade, codEstado) values("Três Lagoas", "12");
insert into tblCidade (nomeCidade, codEstado) values("Vicentina", "12");
insert into tblCidade (nomeCidade, codEstado) values("Acorizal", "13");
insert into tblCidade (nomeCidade, codEstado) values("Água Boa", "13");
insert into tblCidade (nomeCidade, codEstado) values("Alta Floresta", "13");
insert into tblCidade (nomeCidade, codEstado) values("Alto Araguaia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Alto Boa Vista", "13");
insert into tblCidade (nomeCidade, codEstado) values("Alto Garças", "13");
insert into tblCidade (nomeCidade, codEstado) values("Alto Paraguai", "13");
insert into tblCidade (nomeCidade, codEstado) values("Alto Taquari", "13");
insert into tblCidade (nomeCidade, codEstado) values("Apiacás", "13");
insert into tblCidade (nomeCidade, codEstado) values("Araguaiana", "13");
insert into tblCidade (nomeCidade, codEstado) values("Araguainha", "13");
insert into tblCidade (nomeCidade, codEstado) values("Araputanga", "13");
insert into tblCidade (nomeCidade, codEstado) values("Arenápolis", "13");
insert into tblCidade (nomeCidade, codEstado) values("Aripuanã", "13");
insert into tblCidade (nomeCidade, codEstado) values("Barão de Melgaço", "13");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Bugres", "13");
insert into tblCidade (nomeCidade, codEstado) values("Barra do Garças", "13");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus do Araguaia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Brasnorte", "13");
insert into tblCidade (nomeCidade, codEstado) values("Cáceres", "13");
insert into tblCidade (nomeCidade, codEstado) values("Campinápolis", "13");
insert into tblCidade (nomeCidade, codEstado) values("Campo Novo do Parecis", "13");
insert into tblCidade (nomeCidade, codEstado) values("Campo Verde", "13");
insert into tblCidade (nomeCidade, codEstado) values("Campos de Júlio", "13");
insert into tblCidade (nomeCidade, codEstado) values("Canabrava do Norte", "13");
insert into tblCidade (nomeCidade, codEstado) values("Canarana", "13");
insert into tblCidade (nomeCidade, codEstado) values("Carlinda", "13");
insert into tblCidade (nomeCidade, codEstado) values("Castanheira", "13");
insert into tblCidade (nomeCidade, codEstado) values("Chapada dos Guimarães", "13");
insert into tblCidade (nomeCidade, codEstado) values("Cláudia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Cocalinho", "13");
insert into tblCidade (nomeCidade, codEstado) values("Colíder", "13");
insert into tblCidade (nomeCidade, codEstado) values("Colniza", "13");
insert into tblCidade (nomeCidade, codEstado) values("Comodoro", "13");
insert into tblCidade (nomeCidade, codEstado) values("Confresa", "13");
insert into tblCidade (nomeCidade, codEstado) values("Conquista D'Oeste", "13");
insert into tblCidade (nomeCidade, codEstado) values("Cotriguaçu", "13");
insert into tblCidade (nomeCidade, codEstado) values("Cuiabá", "13");
insert into tblCidade (nomeCidade, codEstado) values("Curvelândia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Denise", "13");
insert into tblCidade (nomeCidade, codEstado) values("Diamantino", "13");
insert into tblCidade (nomeCidade, codEstado) values("Dom Aquino", "13");
insert into tblCidade (nomeCidade, codEstado) values("Feliz Natal", "13");
insert into tblCidade (nomeCidade, codEstado) values("Figueirópolis D'Oeste", "13");
insert into tblCidade (nomeCidade, codEstado) values("Gaúcha do Norte", "13");
insert into tblCidade (nomeCidade, codEstado) values("General Carneiro", "13");
insert into tblCidade (nomeCidade, codEstado) values("Glória D'Oeste", "13");
insert into tblCidade (nomeCidade, codEstado) values("Guarantã do Norte", "13");
insert into tblCidade (nomeCidade, codEstado) values("Guiratinga", "13");
insert into tblCidade (nomeCidade, codEstado) values("Indiavaí", "13");
insert into tblCidade (nomeCidade, codEstado) values("Ipiranga do Norte", "13");
insert into tblCidade (nomeCidade, codEstado) values("Itanhangá", "13");
insert into tblCidade (nomeCidade, codEstado) values("Itaúba", "13");
insert into tblCidade (nomeCidade, codEstado) values("Itiquira", "13");
insert into tblCidade (nomeCidade, codEstado) values("Jaciara", "13");
insert into tblCidade (nomeCidade, codEstado) values("Jangada", "13");
insert into tblCidade (nomeCidade, codEstado) values("Jauru", "13");
insert into tblCidade (nomeCidade, codEstado) values("Juara", "13");
insert into tblCidade (nomeCidade, codEstado) values("Juína", "13");
insert into tblCidade (nomeCidade, codEstado) values("Juruena", "13");
insert into tblCidade (nomeCidade, codEstado) values("Juscimeira", "13");
insert into tblCidade (nomeCidade, codEstado) values("Lambari D'Oeste", "13");
insert into tblCidade (nomeCidade, codEstado) values("Lucas do Rio Verde", "13");
insert into tblCidade (nomeCidade, codEstado) values("Luciara", "13");
insert into tblCidade (nomeCidade, codEstado) values("Marcelândia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Matupá", "13");
insert into tblCidade (nomeCidade, codEstado) values("Mirassol d'Oeste", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nobres", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nortelândia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nossa Senhora do Livramento", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Bandeirantes", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Brasilândia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Canaã do Norte", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Guarita", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Lacerda", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Marilândia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Maringá", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Monte Verde", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Mutum", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Nazaré", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Olímpia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Santa Helena", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Ubiratã", "13");
insert into tblCidade (nomeCidade, codEstado) values("Nova Xavantina", "13");
insert into tblCidade (nomeCidade, codEstado) values("Novo Horizonte do Norte", "13");
insert into tblCidade (nomeCidade, codEstado) values("Novo Mundo", "13");
insert into tblCidade (nomeCidade, codEstado) values("Novo Santo Antônio", "13");
insert into tblCidade (nomeCidade, codEstado) values("Novo São Joaquim", "13");
insert into tblCidade (nomeCidade, codEstado) values("Paranaíta", "13");
insert into tblCidade (nomeCidade, codEstado) values("Paranatinga", "13");
insert into tblCidade (nomeCidade, codEstado) values("Pedra Preta", "13");
insert into tblCidade (nomeCidade, codEstado) values("Peixoto de Azevedo", "13");
insert into tblCidade (nomeCidade, codEstado) values("Planalto da Serra", "13");
insert into tblCidade (nomeCidade, codEstado) values("Poconé", "13");
insert into tblCidade (nomeCidade, codEstado) values("Pontal do Araguaia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Ponte Branca", "13");
insert into tblCidade (nomeCidade, codEstado) values("Pontes e Lacerda", "13");
insert into tblCidade (nomeCidade, codEstado) values("Porto Alegre do Norte", "13");
insert into tblCidade (nomeCidade, codEstado) values("Porto dos Gaúchos", "13");
insert into tblCidade (nomeCidade, codEstado) values("Porto Esperidião", "13");
insert into tblCidade (nomeCidade, codEstado) values("Porto Estrela", "13");
insert into tblCidade (nomeCidade, codEstado) values("Poxoréo", "13");
insert into tblCidade (nomeCidade, codEstado) values("Primavera do Leste", "13");
insert into tblCidade (nomeCidade, codEstado) values("Querência", "13");
insert into tblCidade (nomeCidade, codEstado) values("Reserva do Cabaçal", "13");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirão Cascalheira", "13");
insert into tblCidade (nomeCidade, codEstado) values("Ribeirãozinho", "13");
insert into tblCidade (nomeCidade, codEstado) values("Rio Branco", "13");
insert into tblCidade (nomeCidade, codEstado) values("Rondolândia", "13");
insert into tblCidade (nomeCidade, codEstado) values("Rondonópolis", "13");
insert into tblCidade (nomeCidade, codEstado) values("Rosário Oeste", "13");
insert into tblCidade (nomeCidade, codEstado) values("Salto do Céu", "13");
insert into tblCidade (nomeCidade, codEstado) values("Santa Carmem", "13");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz do Xingu", "13");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita do Trivelato", "13");
insert into tblCidade (nomeCidade, codEstado) values("Santa Terezinha", "13");
insert into tblCidade (nomeCidade, codEstado) values("Santo Afonso", "13");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Leste", "13");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Leverger", "13");
insert into tblCidade (nomeCidade, codEstado) values("São Félix do Araguaia", "13");
insert into tblCidade (nomeCidade, codEstado) values("São José do Povo", "13");
insert into tblCidade (nomeCidade, codEstado) values("São José do Rio Claro", "13");
insert into tblCidade (nomeCidade, codEstado) values("São José do Xingu", "13");
insert into tblCidade (nomeCidade, codEstado) values("São José dos Quatro Marcos", "13");
insert into tblCidade (nomeCidade, codEstado) values("São Pedro da Cipa", "13");
insert into tblCidade (nomeCidade, codEstado) values("Sapezal", "13");
insert into tblCidade (nomeCidade, codEstado) values("Serra Nova Dourada", "13");
insert into tblCidade (nomeCidade, codEstado) values("Sinop", "13");
insert into tblCidade (nomeCidade, codEstado) values("Sorriso", "13");
insert into tblCidade (nomeCidade, codEstado) values("Tabaporã", "13");
insert into tblCidade (nomeCidade, codEstado) values("Tangará da Serra", "13");
insert into tblCidade (nomeCidade, codEstado) values("Tapurah", "13");
insert into tblCidade (nomeCidade, codEstado) values("Terra Nova do Norte", "13");
insert into tblCidade (nomeCidade, codEstado) values("Tesouro", "13");
insert into tblCidade (nomeCidade, codEstado) values("Torixoréu", "13");
insert into tblCidade (nomeCidade, codEstado) values("União do Sul", "13");
insert into tblCidade (nomeCidade, codEstado) values("Vale de São Domingos", "13");
insert into tblCidade (nomeCidade, codEstado) values("Várzea Grande", "13");
insert into tblCidade (nomeCidade, codEstado) values("Vera", "13");
insert into tblCidade (nomeCidade, codEstado) values("Vila Bela da Santíssima Trindade", "13");
insert into tblCidade (nomeCidade, codEstado) values("Vila Rica", "13");
insert into tblCidade (nomeCidade, codEstado) values("Abadia de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Abadiânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Acreúna", "9");
insert into tblCidade (nomeCidade, codEstado) values("Adelândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Água Fria de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Água Limpa", "9");
insert into tblCidade (nomeCidade, codEstado) values("Águas Lindas de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Alexânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Aloândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Alto Horizonte", "9");
insert into tblCidade (nomeCidade, codEstado) values("Alto Paraíso de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Alvorada do Norte", "9");
insert into tblCidade (nomeCidade, codEstado) values("Amaralina", "9");
insert into tblCidade (nomeCidade, codEstado) values("Americano do Brasil", "9");
insert into tblCidade (nomeCidade, codEstado) values("Amorinópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Anápolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Anhanguera", "9");
insert into tblCidade (nomeCidade, codEstado) values("Anicuns", "9");
insert into tblCidade (nomeCidade, codEstado) values("Aparecida de Goiânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Aparecida do Rio Doce", "9");
insert into tblCidade (nomeCidade, codEstado) values("Aporé", "9");
insert into tblCidade (nomeCidade, codEstado) values("Araçu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Aragarças", "9");
insert into tblCidade (nomeCidade, codEstado) values("Aragoiânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Araguapaz", "9");
insert into tblCidade (nomeCidade, codEstado) values("Arenópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Aruanã", "9");
insert into tblCidade (nomeCidade, codEstado) values("Aurilândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Avelinópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Baliza", "9");
insert into tblCidade (nomeCidade, codEstado) values("Barro Alto", "9");
insert into tblCidade (nomeCidade, codEstado) values("Bela Vista de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jardim de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Bom Jesus de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Bonfinópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Bonópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Brazabrantes", "9");
insert into tblCidade (nomeCidade, codEstado) values("Britânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Buriti Alegre", "9");
insert into tblCidade (nomeCidade, codEstado) values("Buriti de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Buritinópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cabeceiras", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira Alta", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cachoeira Dourada", "9");
insert into tblCidade (nomeCidade, codEstado) values("Caçu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Caiapônia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Caldas Novas", "9");
insert into tblCidade (nomeCidade, codEstado) values("Caldazinha", "9");
insert into tblCidade (nomeCidade, codEstado) values("Campestre de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Campinaçu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Campinorte", "9");
insert into tblCidade (nomeCidade, codEstado) values("Campo Alegre de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Campo Limpo de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Campos Belos", "9");
insert into tblCidade (nomeCidade, codEstado) values("Campos Verdes", "9");
insert into tblCidade (nomeCidade, codEstado) values("Carmo do Rio Verde", "9");
insert into tblCidade (nomeCidade, codEstado) values("Castelândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Catalão", "9");
insert into tblCidade (nomeCidade, codEstado) values("Caturaí", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cavalcante", "9");
insert into tblCidade (nomeCidade, codEstado) values("Ceres", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cezarina", "9");
insert into tblCidade (nomeCidade, codEstado) values("Chapadão do Céu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cidade Ocidental", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cocalzinho de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Colinas do Sul", "9");
insert into tblCidade (nomeCidade, codEstado) values("Córrego do Ouro", "9");
insert into tblCidade (nomeCidade, codEstado) values("Corumbá de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Corumbaíba", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cristalina", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cristianópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Crixás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cromínia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Cumari", "9");
insert into tblCidade (nomeCidade, codEstado) values("Damianópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Damolândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Davinópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Diorama", "9");
insert into tblCidade (nomeCidade, codEstado) values("Divinópolis de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Doverlândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Edealina", "9");
insert into tblCidade (nomeCidade, codEstado) values("Edéia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Estrela do Norte", "9");
insert into tblCidade (nomeCidade, codEstado) values("Faina", "9");
insert into tblCidade (nomeCidade, codEstado) values("Fazenda Nova", "9");
insert into tblCidade (nomeCidade, codEstado) values("Firminópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Flores de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Formosa", "9");
insert into tblCidade (nomeCidade, codEstado) values("Formoso", "9");
insert into tblCidade (nomeCidade, codEstado) values("Gameleira de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Goianápolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Goiandira", "9");
insert into tblCidade (nomeCidade, codEstado) values("Goianésia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Goiânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Goianira", "9");
insert into tblCidade (nomeCidade, codEstado) values("Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Goiatuba", "9");
insert into tblCidade (nomeCidade, codEstado) values("Gouvelândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Guapó", "9");
insert into tblCidade (nomeCidade, codEstado) values("Guaraíta", "9");
insert into tblCidade (nomeCidade, codEstado) values("Guarani de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Guarinos", "9");
insert into tblCidade (nomeCidade, codEstado) values("Heitoraí", "9");
insert into tblCidade (nomeCidade, codEstado) values("Hidrolândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Hidrolina", "9");
insert into tblCidade (nomeCidade, codEstado) values("Iaciara", "9");
insert into tblCidade (nomeCidade, codEstado) values("Inaciolândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Indiara", "9");
insert into tblCidade (nomeCidade, codEstado) values("Inhumas", "9");
insert into tblCidade (nomeCidade, codEstado) values("Ipameri", "9");
insert into tblCidade (nomeCidade, codEstado) values("Ipiranga de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Iporá", "9");
insert into tblCidade (nomeCidade, codEstado) values("Israelândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itaberaí", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itaguari", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itaguaru", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itajá", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itapaci", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itapirapuã", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itapuranga", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itarumã", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itauçu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Itumbiara", "9");
insert into tblCidade (nomeCidade, codEstado) values("Ivolândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Jandaia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Jaraguá", "9");
insert into tblCidade (nomeCidade, codEstado) values("Jataí", "9");
insert into tblCidade (nomeCidade, codEstado) values("Jaupaci", "9");
insert into tblCidade (nomeCidade, codEstado) values("Jesúpolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Joviânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Jussara", "9");
insert into tblCidade (nomeCidade, codEstado) values("Lagoa Santa", "9");
insert into tblCidade (nomeCidade, codEstado) values("Leopoldo de Bulhões", "9");
insert into tblCidade (nomeCidade, codEstado) values("Luziânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mairipotaba", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mambaí", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mara Rosa", "9");
insert into tblCidade (nomeCidade, codEstado) values("Marzagão", "9");
insert into tblCidade (nomeCidade, codEstado) values("Matrinchã", "9");
insert into tblCidade (nomeCidade, codEstado) values("Maurilândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mimoso de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Minaçu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mineiros", "9");
insert into tblCidade (nomeCidade, codEstado) values("Moiporá", "9");
insert into tblCidade (nomeCidade, codEstado) values("Monte Alegre de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Montes Claros de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Montividiu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Montividiu do Norte", "9");
insert into tblCidade (nomeCidade, codEstado) values("Morrinhos", "9");
insert into tblCidade (nomeCidade, codEstado) values("Morro Agudo de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mossâmedes", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mozarlândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mundo Novo", "9");
insert into tblCidade (nomeCidade, codEstado) values("Mutunópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nazário", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nerópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Niquelândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nova América", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nova Aurora", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nova Crixás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nova Glória", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nova Iguaçu de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nova Roma", "9");
insert into tblCidade (nomeCidade, codEstado) values("Nova Veneza", "9");
insert into tblCidade (nomeCidade, codEstado) values("Novo Brasil", "9");
insert into tblCidade (nomeCidade, codEstado) values("Novo Gama", "9");
insert into tblCidade (nomeCidade, codEstado) values("Novo Planalto", "9");
insert into tblCidade (nomeCidade, codEstado) values("Orizona", "9");
insert into tblCidade (nomeCidade, codEstado) values("Ouro Verde de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Ouvidor", "9");
insert into tblCidade (nomeCidade, codEstado) values("Padre Bernardo", "9");
insert into tblCidade (nomeCidade, codEstado) values("Palestina de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Palmeiras de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Palmelo", "9");
insert into tblCidade (nomeCidade, codEstado) values("Palminópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Panamá", "9");
insert into tblCidade (nomeCidade, codEstado) values("Paranaiguara", "9");
insert into tblCidade (nomeCidade, codEstado) values("Paraúna", "9");
insert into tblCidade (nomeCidade, codEstado) values("Perolândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Petrolina de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Pilar de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Piracanjuba", "9");
insert into tblCidade (nomeCidade, codEstado) values("Piranhas", "9");
insert into tblCidade (nomeCidade, codEstado) values("Pirenópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Pires do Rio", "9");
insert into tblCidade (nomeCidade, codEstado) values("Planaltina", "9");
insert into tblCidade (nomeCidade, codEstado) values("Pontalina", "9");
insert into tblCidade (nomeCidade, codEstado) values("Porangatu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Porteirão", "9");
insert into tblCidade (nomeCidade, codEstado) values("Portelândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Posse", "9");
insert into tblCidade (nomeCidade, codEstado) values("Professor Jamil", "9");
insert into tblCidade (nomeCidade, codEstado) values("Quirinópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Rialma", "9");
insert into tblCidade (nomeCidade, codEstado) values("Rianápolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Rio Quente", "9");
insert into tblCidade (nomeCidade, codEstado) values("Rio Verde", "9");
insert into tblCidade (nomeCidade, codEstado) values("Rubiataba", "9");
insert into tblCidade (nomeCidade, codEstado) values("Sanclerlândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Bárbara de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Cruz de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Fé de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Helena de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Isabel", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita do Araguaia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rita do Novo Destino", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Rosa de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Tereza de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santa Terezinha de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio da Barra", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Santo Antônio do Descoberto", "9");
insert into tblCidade (nomeCidade, codEstado) values("São Domingos", "9");
insert into tblCidade (nomeCidade, codEstado) values("São Francisco de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("São João da Paraúna", "9");
insert into tblCidade (nomeCidade, codEstado) values("São João d'Aliança", "9");
insert into tblCidade (nomeCidade, codEstado) values("São Luís de Montes Belos", "9");
insert into tblCidade (nomeCidade, codEstado) values("São Luíz do Norte", "9");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Araguaia", "9");
insert into tblCidade (nomeCidade, codEstado) values("São Miguel do Passa Quatro", "9");
insert into tblCidade (nomeCidade, codEstado) values("São Patrício", "9");
insert into tblCidade (nomeCidade, codEstado) values("São Simão", "9");
insert into tblCidade (nomeCidade, codEstado) values("Senador Canedo", "9");
insert into tblCidade (nomeCidade, codEstado) values("Serranópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Silvânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Simolândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Sítio d'Abadia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Taquaral de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Teresina de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Terezópolis de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Três Ranchos", "9");
insert into tblCidade (nomeCidade, codEstado) values("Trindade", "9");
insert into tblCidade (nomeCidade, codEstado) values("Trombas", "9");
insert into tblCidade (nomeCidade, codEstado) values("Turvânia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Turvelândia", "9");
insert into tblCidade (nomeCidade, codEstado) values("Uirapuru", "9");
insert into tblCidade (nomeCidade, codEstado) values("Uruaçu", "9");
insert into tblCidade (nomeCidade, codEstado) values("Uruana", "9");
insert into tblCidade (nomeCidade, codEstado) values("Urutaí", "9");
insert into tblCidade (nomeCidade, codEstado) values("Valparaíso de Goiás", "9");
insert into tblCidade (nomeCidade, codEstado) values("Varjão", "9");
insert into tblCidade (nomeCidade, codEstado) values("Vianópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Vicentinópolis", "9");
insert into tblCidade (nomeCidade, codEstado) values("Vila Boa", "9");
insert into tblCidade (nomeCidade, codEstado) values("Vila Propício", "9");
insert into tblCidade (nomeCidade, codEstado) values("Brasília", "7");


INSERT INTO tblCliente
	(nomeCliente, cpfCliente, dtNascCliente, peso, altura, telefoneCliente, celularCliente, emailCliente, sexo) 
VALUES 
	('cliente 1','111.111.111-11','1990-10-02','75.2','1.75', '(11)1111-1111','(22)2222-2222', 'cliente1@cliente.com','M');

SET @id_cliente = LAST_INSERT_ID();

INSERT INTO tblEndereco
	(logradouro, cep, numero, bairro, complemento, codCidade) 
VALUES 
	('Rua das arvores', '22222-222', '2222' , 'Jd folhas 2', null, 3645);
    
SET @id_endereco = LAST_INSERT_ID();

INSERT INTO tblClienteEnd
	(codEndereco, codCliente) 
VALUES (@id_endereco, @id_cliente);


INSERT INTO `tblCliente`
	(`nomeCliente`, `cpfCliente`, `dtNascCliente`, `peso`, `altura`, `telefoneCliente`, `celularCliente`, `emailCliente`, `sexo`) 
VALUES 
	('cliente 2','222.222.222-22','1989-11-22','80.2','1.82', '(33)3333-3333','(44)4444-4444', 'cliente2@cliente.com','F');

SET @id_cliente = LAST_INSERT_ID();

INSERT INTO `tblEndereco`
	(`logradouro`, `cep`, `numero`, `bairro`, `complemento`, `codCidade`) 
VALUES 
	('Rua das laranjas', '11111-111', '1111' , 'Pq caule ', null, 2214);

SET @id_endereco = LAST_INSERT_ID();

INSERT INTO tblClienteEnd
	(codEndereco, codCliente) 
VALUES (@id_endereco, @id_cliente);


INSERT INTO `tblCliente`
	(`nomeCliente`, `cpfCliente`, `dtNascCliente`, `peso`, `altura`, `telefoneCliente`, `celularCliente`, `emailCliente`, `sexo`) 
VALUES 
	('cliente 3','333.333.333-33','1984-04-11','65.0','1.68', '(55)5555-5555','(66)6666-6666', 'cliente3@cliente.com','F');

SET @id_cliente = LAST_INSERT_ID();

INSERT INTO `tblEndereco`
	(`logradouro`, `cep`, `numero`, `bairro`, `complemento`, `codCidade`) 
VALUES 
	('Rua peras', '33333-333', '3333' , 'Jd pedas', null, 4125);

SET @id_endereco = LAST_INSERT_ID();

INSERT INTO tblClienteEnd
	(codEndereco, codCliente) 
VALUES (@id_endereco, @id_cliente);

INSERT INTO `tblCliente`
	(`nomeCliente`, `cpfCliente`, `dtNascCliente`, `peso`, `altura`, `telefoneCliente`, `celularCliente`, `emailCliente`, `sexo`) 
VALUES 
	('cliente 4','444.444.444-44','1992-05-20','73.0','1.78', '(77)7777-7777','(88)8888-8888', 'cliente4@cliente.com','M');

SET @id_cliente = LAST_INSERT_ID();

INSERT INTO `tblEndereco`
	(`logradouro`, `cep`, `numero`, `bairro`, `complemento`, `codCidade`) 
VALUES 
	('Rua castanhas', '44444-444', '44444' , 'Jd coqueiros', null, 3554);

SET @id_endereco = LAST_INSERT_ID();

INSERT INTO tblClienteEnd
	(codEndereco, codCliente) 
VALUES (@id_endereco, @id_cliente);

INSERT INTO tblClienteJuridico
	(nomeContato, razaoSocial, inscricaoEstadual, telefonePrincipal, telefoneContato, emailPrincipal, emailContato) 
VALUES 
	('juridico 1','juridico um', '111111111','(11)1111-1111','(22)2222-2222','juridico_um@jurico.com', 'contato_um@jurico.com' );
SET @id_cliente_juridico = LAST_INSERT_ID();

SET @id_cliente_juridico = LAST_INSERT_ID();

INSERT INTO tblEndereco
	(logradouro, cep, numero, bairro, complemento, codCidade) 
VALUES 
	('Rua das águas', '44444-444','444' , 'Jd molhado ', null, 2145);

SET @id_endereco = LAST_INSERT_ID();

INSERT INTO tblClienteJuridicoEnd
	(codEndereco, codClienteJuridico) 
VALUES 
	(@id_endereco, @id_cliente_juridico);

INSERT INTO tblClienteJuridico
	(nomeContato, razaoSocial, inscricaoEstadual, telefonePrincipal, telefoneContato, emailPrincipal, emailContato) 
VALUES 
	('juridico 2','juridico dois', '222222222','(33)3333-3333','(44)4444-4444','juridico_dois@jurico.com', 'contato_dois@jurico.com' );
    
SET @id_cliente_juridico = LAST_INSERT_ID();

INSERT INTO tblEndereco
	(logradouro, cep, numero, bairro, complemento, codCidade) 
VALUES 
	('Rua dos fogos', '77777-777', '777' , 'Jd queimado', null, 1234);

SET @id_endereco = LAST_INSERT_ID();

INSERT INTO tblClienteJuridicoEnd
	(codEndereco, codClienteJuridico) 
VALUES 
	(@id_endereco, @id_cliente_juridico);

INSERT INTO tblClienteJuridico
	(nomeContato, razaoSocial, inscricaoEstadual, telefonePrincipal, telefoneContato, emailPrincipal, emailContato) 
VALUES 
	('juridico 3','juridico tres', '333333333','(55)5555-5555','(66)6666-6666','juridico_tres@jurico.com', 'contato_tres@jurico.com' );
    
SET @id_cliente_juridico = LAST_INSERT_ID();

INSERT INTO tblEndereco
	(logradouro, cep, numero, bairro, complemento, codCidade) 
VALUES 
	('Rua dos ventos', '99999-999', '999' , 'Jd do Mar', null, 1223);

SET @id_endereco = LAST_INSERT_ID();

INSERT INTO tblClienteJuridicoEnd
	(codEndereco, codClienteJuridico) 
VALUES 
	(@id_endereco, @id_cliente_juridico);

INSERT INTO tblClienteJuridico
	(nomeContato, razaoSocial, inscricaoEstadual, telefonePrincipal, telefoneContato, emailPrincipal, emailContato) 
VALUES 
	('juridico 4','juridico quatro', '444444444','(77)7777-7777','(88)8888-8888','juridico_quatro@jurico.com', 'contato_quatro@jurico.com' );

SET @id_cliente_juridico = LAST_INSERT_ID();

INSERT INTO tblEndereco
	(logradouro, cep, numero, bairro, complemento, codCidade) 
VALUES 
	('Rua sem asfalto', '55555-555', '2222' , 'Pq prefeitura', null, 2145);

SET @id_endereco = LAST_INSERT_ID();

INSERT INTO tblClienteJuridicoEnd
	(codEndereco, codClienteJuridico) 
VALUES 
	(@id_endereco, @id_cliente_juridico);
    
INSERT INTO tblStatus (statusPedido) VALUES ('Aguardando Pagamento');
INSERT INTO tblStatus (statusPedido) VALUES ('Aguardando Separação de Estoque');
INSERT INTO tblStatus (statusPedido) VALUES ('Prato em Produção');
INSERT INTO tblStatus (statusPedido) VALUES ('Enviado para a Transportadora');
INSERT INTO tblStatus (statusPedido) VALUES ('Produto em Transporte');
INSERT INTO tblStatus (statusPedido) VALUES ('Produto Entregue');

INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Moto 1');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Van 1');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Caminhão 1');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Mini van 1');

INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Moto 2');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Van 2');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Caminhão 2');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Mini van 2');

INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Moto 3');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Van 3');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Caminhão 3');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Mini van 3');

INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Moto 4');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Van 4');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Caminhão 4');
INSERT INTO `tblTipoVeiculo` (`nomeTipoVeiculo`) VALUES ('Mini van 4');

INSERT INTO `tblEndereco`
	(`logradouro`, `cep`, `numero`, `bairro`, `complemento`, `codCidade`) 
VALUES 
	('Rua Transp 1', '11111-111', '1111' , 'Pq Transp 1', null, 3331);

INSERT INTO 
	`tblTransportadora`
(`razaoSocial`, `nomeFantasia`, `cnpjTransportadora`, `telefonePrincipal`, `telefoneContato`, `emailPrincipal`, `emailContato`, `responsavelTransportadora`, `codEndereco`) 
VALUES 
('Transp 1','Transp um','11.111.111/1111-11','(11)1111-1111','(22)2222-2222', 'transp1@transp.com','transp_um@transp.com','Mohammed Med', last_insert_id());

INSERT INTO `tblEndereco`
	(`logradouro`, `cep`, `numero`, `bairro`, `complemento`, `codCidade`) 
VALUES 
	('Rua Transp 2', '22222-222', '2222' , 'Jd Transp 2', null, 3656);

INSERT INTO 
	`tblTransportadora`
(`razaoSocial`, `nomeFantasia`, `cnpjTransportadora`, `telefonePrincipal`, `telefoneContato`, `emailPrincipal`, `emailContato`, `responsavelTransportadora`, `codEndereco`) 
VALUES 
('Transp 2','Transp 2','22.222.222/2222-22','(33)3333-3333','(44)4444-4444', 'transp2@transp.com','transp_dois@transp.com','Evie Amelia', last_insert_id());

INSERT INTO `tblEndereco`
	(`logradouro`, `cep`, `numero`, `bairro`, `complemento`, `codCidade`) 
VALUES 
	('Rua Transp 3', '33333-333', '3333' , 'Jd Transp 3', null, 3552);

INSERT INTO 
	`tblTransportadora`
(`razaoSocial`, `nomeFantasia`, `cnpjTransportadora`, `telefonePrincipal`, `telefoneContato`, `emailPrincipal`, `emailContato`, `responsavelTransportadora`, `codEndereco`) 
VALUES 
('Transp 3','Transp 3','33.333.333/3333-33','(55)5555-5555','(66)6666-6666', 'transp3transp.com','transp_tres@transp.com','Thomas Joshua', last_insert_id());


INSERT INTO `tblEndereco`
	(`logradouro`, `cep`, `numero`, `bairro`, `complemento`, `codCidade`) 
VALUES 
	('Rua Transp 4', '44444-444', '4444' , 'Pq Transp 4', null, 3526);

INSERT INTO 
	`tblTransportadora`
(`razaoSocial`, `nomeFantasia`, `cnpjTransportadora`, `telefonePrincipal`, `telefoneContato`, `emailPrincipal`, `emailContato`, `responsavelTransportadora`, `codEndereco`) 
VALUES 
('Transp 4','Transp 4','44.444.444/4444-44','(77)7777-7777','(88)8888-8888', 'transp4transp.com','transp_quatro@transp.com','Ruby Sophie', last_insert_id());



INSERT INTO `tblEndereco`
	(`logradouro`, `cep`, `numero`, `bairro`, `complemento`, `codCidade`) 
VALUES 
	('Rua Transp 0', '00000-000', '0000' , 'Pq Transp 0', null, 3526);

INSERT INTO 
	`tblTransportadora`
(`razaoSocial`, `nomeFantasia`, `cnpjTransportadora`, `telefonePrincipal`, `telefoneContato`, `emailPrincipal`, `emailContato`, `responsavelTransportadora`, `codEndereco`) 
VALUES 
('Transp teste','Transp teste','00.000.000/0000-00','(00)0000-0000','(00)0000-0000', 'transp_teste@transp.com','transp_teste@transp.com','Teste Teste', last_insert_id());

INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('AAA-1111',1 , 1);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('BBB-2222',2 , 1);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('CCC-3333',3 , 1);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('DDD-4444',4 , 1);

INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('EEE-5555',5 , 2);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('FFF-6666',6 , 2);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('GGG-7777',7 , 2);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('HHH-8888',8 , 2);

INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('III-9999',9 , 3);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('JJJ-1010',10 , 3);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('KKK-1110',11 , 3);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('LLL-1112',12 , 3);

INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('MMM-1113',13 , 4);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('NNN-1114',14 , 4);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('OOO-1115',15 , 4);
INSERT INTO `tblVeiculoTransp` (`placaVeiculo`, `codTipoVeiculo`, `codTransportadora`) VALUES ('PPP-1116',16 , 4);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '854.12', 1, 1, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '254.24', 2, 1, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '684.85', 3, 1, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '142.14', 4, 1, null);
    
    
INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '123.65', 1, 2, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '521.32', 2, 2, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '1127.51', 3, 2, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '125.64', 4, 2, null);
    
    
    
INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '120.32', 1, 3, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '2518.65', 2, 3, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '125.65', 3, 3, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '654.24', 4, 3, null);
    
    
INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '1524.48', 1, 4, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '684.54', 2, 4, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '5683.44', 3, 4, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '2111.10', 4, 4, null);
    
    
    
INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '123.56', 1, 5, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '369.85', 2, 5, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '3586.45', 3, 5, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '743.89', 4, 5, null);
    
    
INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '8745.44', 1, 6, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '7841.45', 2, 6, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('web', now() + INTERVAL 5 DAY, now() , '4217.15', 3, 6, null);

INSERT INTO `tblPedido`
	(`tipoPedido`, `dtEntrega`, `dtCompra`, `total`, `codCliente`, `codStatus`, `codVeiculoTransp`) 
VALUES 
	('telefone', now() + INTERVAL 5 DAY, now() , '6465.64', 4, 6, null);

DROP PROCEDURE IF EXISTS pcd_buscaveiculo;

delimiter //    
CREATE PROCEDURE pcd_buscaveiculo(nome_veiculo varchar(100))
BEGIN
	
	SELECT vt.* , tv.* 
	FROM tblVeiculoTransp vt 
	LEFT JOIN tblTipoVeiculo tv 
	ON(vt.codTipoVeiculo = tv.codTipoVeiculo) 
	WHERE tv.nomeTipoVeiculo LIKE nome_veiculo;
    
END //
delimiter ;

DROP PROCEDURE IF EXISTS pcd_filtro_pedido;

delimiter //    
CREATE PROCEDURE pcd_filtro_pedido(codPedido int)
BEGIN

	SELECT 
		p.*, vt.*, cl.*, s.*, tv.*, t.*, v.*
	FROM tblPedido AS p
	LEFT JOIN tblCliente AS cl
	ON (p.codCliente = cl.codCliente)
	LEFT JOIN tblStatus AS s
	ON (p.codStatus = s.codStatus )
	LEFT JOIN tblVeiculoTransp AS vt
	ON (p.codVeiculoTransp = vt.codVeiculoTransp)
	LEFT JOIN tblTipoVeiculo AS tv
	ON (tv.codTipoVeiculo = vt.codTipoVeiculo)
	LEFT JOIN tblTransportadora AS t
	ON (t.codTransportadora = vt.codTransportadora)
	LEFT JOIN tblTipoVeiculo AS v
	ON (v.codTipoVeiculo = vt.codTipoVeiculo)
	WHERE p.codPedido = codPedido
	ORDER BY s.codStatus;

END //
delimiter ;

DROP PROCEDURE IF EXISTS pcd_filtro_status;
    
delimiter //    
CREATE PROCEDURE pcd_filtro_status(cod_status int)
BEGIN

	SELECT 
		p.*, vt.*, cl.*, s.*, tv.*, t.*, v.*
	FROM tblPedido AS p
	LEFT JOIN tblCliente AS cl
	ON (p.codCliente = cl.codCliente)
	LEFT JOIN tblStatus AS s
	ON (p.codStatus = s.codStatus )
	LEFT JOIN tblVeiculoTransp AS vt
	ON (p.codVeiculoTransp = vt.codVeiculoTransp)
	LEFT JOIN tblTipoVeiculo AS tv
	ON (tv.codTipoVeiculo = vt.codTipoVeiculo)
	LEFT JOIN tblTransportadora AS t
	ON (t.codTransportadora = vt.codTransportadora)
	LEFT JOIN tblTipoVeiculo AS v
	ON (v.codTipoVeiculo = vt.codTipoVeiculo)
	WHERE s.codStatus = cod_status;

END //
delimiter ;

DROP PROCEDURE IF EXISTS pcd_tipoveiculo_transp;

delimiter //    
CREATE PROCEDURE pcd_tipoveiculo_transp(codTransp int)
BEGIN
	
	SELECT 
		vt.*, t.*, tv.*
	FROM tblTransportadora t
	LEFT JOIN tblVeiculoTransp vt
	ON (vt.codTransportadora = t.codTransportadora)
	LEFT JOIN tblTipoVeiculo tv 
	ON (tv.codTipoVeiculo = vt.codTipoVeiculo)
	WHERE t.codTransportadora = codTransp;
    
END //
delimiter ;

DROP PROCEDURE IF EXISTS pcd_lista_pedi_clie_sta_tipoveic_trans_veictrans;

delimiter //    
CREATE PROCEDURE pcd_lista_pedi_clie_sta_tipoveic_trans_veictrans()
BEGIN
	
    SELECT 
		p.*, vt.*, cl.*, s.*, tv.*, t.*, v.*
	FROM tblPedido AS p
	LEFT JOIN tblCliente AS cl
	ON (p.codCliente = cl.codCliente)
	LEFT JOIN tblStatus AS s
	ON (p.codStatus = s.codStatus )
	LEFT JOIN tblVeiculoTransp AS vt
	ON (p.codVeiculoTransp = vt.codVeiculoTransp)
	LEFT JOIN tblTipoVeiculo AS tv
	ON (tv.codTipoVeiculo = vt.codTipoVeiculo)
	LEFT JOIN tblTransportadora AS t
	ON (t.codTransportadora = vt.codTransportadora)
	LEFT JOIN tblTipoVeiculo AS v
	ON (v.codTipoVeiculo = vt.codTipoVeiculo)
	ORDER BY s.codStatus;

END //
delimiter ;

insert into tblObjetivo (nomeObjetivo,descricaoObjetivo) values ("Emagrecimento","Perder Peso");
insert into tblObjetivo (nomeObjetivo,descricaoObjetivo) values ("Força","Ter Força");
insert into tblObjetivo (nomeObjetivo,descricaoObjetivo) values ("Resistência","Está cansado?");
insert into tblObjetivo (nomeObjetivo,descricaoObjetivo) values ("Ganho de Massa","Ajuda a adquirir massa muscular");

insert into tblCategoriaMateria (nomeCategoriaMateria) values("Frios");
insert into tblCategoriaMateria (nomeCategoriaMateria) values("Farinha");
insert into tblCategoriaMateria (nomeCategoriaMateria) values("Carne");
insert into tblCategoriaMateria (nomeCategoriaMateria) values("Frutos do Mar");
insert into tblCategoriaMateria (nomeCategoriaMateria) values("Salada");
insert into tblCategoriaMateria (nomeCategoriaMateria) values("Sobremesa");
insert into tblCategoriaMateria (nomeCategoriaMateria) values("Suco");

insert into tblCategoriaPrato (nomeCategoriaPrato, descricaoCategoriaPrato, imagemCategoriaPrato) 
values("Carnes","Versátil, a carne está sempre presente na mesa da maioria dos brasileiros. E o melhor: ela pode se adequar a diferentes pratos.","conteudo/imagem/carne.jpg");

insert into tblCategoriaPrato (nomeCategoriaPrato, descricaoCategoriaPrato, imagemCategoriaPrato) 
values("Massas","Impossível não experimentar este saboroso prato italiano","conteudo/imagem/massa.jpg");

insert into tblCategoriaPrato (nomeCategoriaPrato, descricaoCategoriaPrato, imagemCategoriaPrato) 
values("Massas","Impossível não experimentar este saboroso prato italiano","conteudo/imagem/massa.jpg");

insert into tblCategoriaPrato (nomeCategoriaPrato, descricaoCategoriaPrato, imagemCategoriaPrato) 
values("Vegetariano","As melhores receitas da culinária vegetariana você só encontra!","conteudo/imagem/vegetariano.jpg");

insert into tblCategoriaPrato (nomeCategoriaPrato, descricaoCategoriaPrato, imagemCategoriaPrato) 
values("Peixes","E para quem ama frutos do mar temos diversas opções de pratos!","conteudo/imagem/peixe.jpg");

insert into tblCategoriaPrato (nomeCategoriaPrato, descricaoCategoriaPrato, imagemCategoriaPrato) 
values("Aves","Aqui você encontrará receitas de frango, de galinha, peru, pato e muitas mais!","conteudo/imagem/frango.jpg");

INSERT INTO `tblCliente`
	(`nomeCliente`, `cpfCliente`, `dtNascCliente`, `peso`, `altura`, `telefoneCliente`, `celularCliente`, `emailCliente`,`sexo`) 
VALUES 
	('Julia Pereira ','437-137-648/75','1997-01-02', '65', '1', '11 3655-3419', '11 4 8941-929', 'juliapcosta97@gmail.com','F');

set @id = LAST_INSERT_ID();

INSERT INTO tblObjetivoCliente 
	(codObjetivo, codCliente) 
values 
	('1',@id);

insert into tblEndereco 
	(logradouro,cep,numero,bairro,complemento,codCidade) 
values 
	('Rua Santa Josefina Bakhita', '06160-209','34','Bandeiras','nenhum', '85');
	
INSERT INTO `tblClienteEnd`
	(`codEndereco`, `codCliente`) 
VALUES 
	(LAST_INSERT_ID(),@id);
	
insert into tblUsuario 
	(usuario,senha) 
values 
	('Julia','123');
insert into tblUsuarioCliente 
	(codCliente, codUsuario) 
values 
	(@id, LAST_INSERT_ID());

insert into tblDica 
	(tituloDica, descricaoDica, imagemDica)
values
	('Aumente e varie o consumo de frutas!','Frutas, legumes e verduras. Elas são ricas em vitaminas, minerais e fibras. As vitaminas e minerais colaboram na manutenção e no bom funcionamento do organismo. E as fibras regulam o funcionamento intestinal, dão sensação de saciedade, e podem atuar prevenindo várias doenças.', 'conteudo/imagem/dica_alimentacao.jpg');
    
insert into tblExercicio 
	(tituloExercicio, descricaoExercicio, imagemExercicio) 
values
	('Fracione o treino','Alguns estudos recentes vêm demonstrando que sessões de exercícios curtas e cumulativas durante o dia são tão benéficas quanto períodos longos e isolados de treino.', 'conteudo/imagem/dica_exercicios.jpg');
    
insert into tblPrato (nomePrato, precoPrato, descricaoPrato, caloria, valorEnergetico, carboidrato, proteina, sodio, gorduras, imagemPrato) 
values ('Macarrão', 30, 'O melhor da Culinária Italiana', 10, 10, 10, 10, 10, 10, 'conteudo/imagem/frango.jpg');

insert into tblCatPrato (codPrato,codCategoriaPrato) values (LAST_INSERT_ID(),1);

insert into tblPrato (nomePrato, precoPrato, descricaoPrato, caloria, valorEnergetico, carboidrato, proteina, sodio, gorduras, imagemPrato) 
values ('Frango com Batata Doce', 30, 'O melhor da Culinária Italiana', 10, 10, 10, 10, 10, 10, 'conteudo/imagem/frango.jpg');

insert into tblCatPrato (codPrato,codCategoriaPrato) values (LAST_INSERT_ID(),1);

insert into tblPrato (nomePrato, precoPrato, descricaoPrato, caloria, valorEnergetico, carboidrato, proteina, sodio, gorduras, imagemPrato) 
values ('Lasanha', 30, 'O melhor da Culinária Italiana', 10, 10, 10, 10, 10, 10, 'conteudo/imagem/frango.jpg');

insert into tblCatPrato (codPrato,codCategoriaPrato) values (LAST_INSERT_ID(),1);

insert into tblPrato (nomePrato, precoPrato, descricaoPrato, caloria, valorEnergetico, carboidrato, proteina, sodio, gorduras, imagemPrato) 
values ('Salmão Assada', 30, 'O melhor da Culinária Italiana', 10, 10, 10, 10, 10, 10, 'conteudo/imagem/frango.jpg');

insert into tblCatPrato (codPrato,codCategoriaPrato) values (LAST_INSERT_ID(),1);

insert into tblPrato (nomePrato, precoPrato, descricaoPrato, caloria, valorEnergetico, carboidrato, proteina, sodio, gorduras, imagemPrato) 
values ('Camarão', 30, 'O melhor da Culinária Italiana', 10, 10, 10, 10, 10, 10, 'conteudo/imagem/frango.jpg');

insert into tblCatPrato (codPrato,codCategoriaPrato) values (LAST_INSERT_ID(),1);

insert into tblPrato (nomePrato, precoPrato, descricaoPrato, caloria, valorEnergetico, carboidrato, proteina, sodio, gorduras, imagemPrato) 
values ('Frango Assada', 30, 'O melhor da Culinária Italiana', 10, 10, 10, 10, 10, 10, 'conteudo/imagem/frango.jpg');

insert into tblCatPrato (codPrato,codCategoriaPrato) values (LAST_INSERT_ID(),1);

insert into tblPrato (nomePrato, precoPrato, descricaoPrato, caloria, valorEnergetico, carboidrato, proteina, sodio, gorduras, imagemPrato) 
values ('Carne de Panela', 30, 'O melhor da Culinária Italiana', 10, 10, 10, 10, 10, 10, 'conteudo/imagem/frango.jpg');

insert into tblCatPrato (codPrato,codCategoriaPrato) values (LAST_INSERT_ID(),1);


insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Frango Grelhado', '10', 'Frango grelhado com o melhor tempero caseiro.', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/frango_grelhado.jpg');

insert into tblCatProduto (codCategoriaMateria, codProduto) values ('3', LAST_INSERT_ID());

insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Batata Doce', '10', 'Batata Doce', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/batata.jpg');

insert into tblCatProduto (codCategoriaMateria, codProduto) values ('2', LAST_INSERT_ID());

insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Arroz Integral', '10', 'Arroz Integral', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/arroz.jpg');
	
insert into tblCatProduto (codCategoriaMateria, codProduto) values ('1', LAST_INSERT_ID());

insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Carne Assada', '10', 'Carne Assada', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/carne.jpg');

insert into tblCatProduto (codCategoriaMateria, codProduto) values ('1', LAST_INSERT_ID());

insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Lasanha ', '10', 'Lasanha', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/lasanha.jpg');
insert into tblCatProduto (codCategoriaMateria, codProduto) values ('1', LAST_INSERT_ID());

insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Feijão', '10', 'Feijão', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/feijão.jpg');
	
insert into tblCatProduto (codCategoriaMateria, codProduto) values ('1', LAST_INSERT_ID());

insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Salada', '10', 'Salada', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/salada.jpg');
	
insert into tblCatProduto (codCategoriaMateria, codProduto) values ('1', LAST_INSERT_ID());


insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Salmão Assada', '10', 'Salmão Assada', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/salmao.jpg');
	
insert into tblCatProduto (codCategoriaMateria, codProduto) values ('1', LAST_INSERT_ID());


insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Macarrão', '10', 'Macarrão', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/macarrao.jpg');
		
insert into tblCatProduto (codCategoriaMateria, codProduto) values ('1', LAST_INSERT_ID());

insert into tblProduto 
	(nomeProduto, precoProduto, descricaoProduto, caloriaProduto, valorEnergeticoProduto, carboidratoProduto, proteinaProduto, sodioProduto, gordurasProduto, imagemProduto) 
values 
	('Farofa', '10', 'Farofa', '20', '20', '20', '20', '20', '20', 'conteudo/imagem/farofa.jpg');
	
insert into tblCatProduto (codCategoriaMateria, codProduto) values ('1', LAST_INSERT_ID());

insert into tblTipoUsuario (nomeTipoUsuario) values ("Administrador");
insert into tblTipoUsuario (nomeTipoUsuario) values ("Cataloguista");
insert into tblTipoUsuario (nomeTipoUsuario) values ("Marketing");
insert into tblTipoUsuario (nomeTipoUsuario) values ("Operacional");

insert into tblFuncionarioLoja 
	(nomeFuncionarioLoja,cpfFuncionarioLoja) 
values 
	('Amanda Barreto', '123-456-789/10');

set @id = LAST_INSERT_ID();

insert into tblUsuario 
	(usuario, senha, codTipoUsuario) 
values 
	('Amanda','123','1');

insert into tblUsuarioFuncionarioLoja 
	(codFuncionarioLoja, codUsuario) 
values 
	(@id, LAST_INSERT_ID());
	
    