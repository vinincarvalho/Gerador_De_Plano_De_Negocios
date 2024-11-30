# Gerador de Plano de Negócios

## Descrição
Este projeto é uma aplicação web projetada para auxiliar no desenvolvimento de planos de negócios de forma prática e intuitiva. Com um ambiente interativo, o usuário pode preencher informações relevantes e gerar um plano de negócios personalizado.

## Estrutura do Projeto
- **`app.js`**: Arquivo principal que inicializa a aplicação.
- **`bin/`**: Contém scripts de inicialização do servidor.
- **`config/`**: Configurações do aplicativo, como conexões de banco de dados.
- **`models/`**: Modelos de dados usados na aplicação.
- **`public/`**: Recursos estáticos (CSS, JavaScript, imagens, etc.).
- **`routes/`**: Define as rotas da aplicação.
- **`views/`**: Templates das páginas HTML renderizadas.
- **`.env`**: Arquivo para variáveis de ambiente (não incluído no repositório por questões de segurança).

## Tecnologias Utilizadas
- **Node.js**: Para o backend.
- **Express**: Framework para gerenciamento de rotas e middleware.
- **EJS**: Para renderização das views.
- **MySQL**: Para gerenciamento de dados.

## Pré-requisitos
- **Node.js** (v14+ recomendado)
- **NPM**
- Banco de dados configurado (ver configurações no arquivo `.env`)

## Instalação
1. Clone o repositório:
   ```bash
   git clone https://github.com/vinincarvalho/Gerador_De_Plano_De_Negocios.git
   ```
2. Acesse o diretório do projeto:
   ```bash
   cd Projeto-Gerador-de-Plano-de-Negocios
   ```
3. Instale as dependências:
   ```bash
   npm install
   ```
4. Configure o arquivo `.env` com suas credenciais de banco de dados e outras variáveis de ambiente.

## Uso
1. Inicie o servidor:
   ```bash
   npm start
   ```
2. Acesse a aplicação em [http://localhost:3000](http://localhost:3000).
