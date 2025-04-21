# Sistema de Reservas de Salas para Instituições de Ensino 📚🏫

Este é um sistema web desenvolvido em **Ruby on Rails 6** com **Ruby 3.3.0** e **PostgreSQL** como banco de dados. O projeto foi criado com o objetivo de gerenciar e reservar salas de instituições de ensino, que também pode ser facilamente adaptado e usado em outros contextos, permitindo que usuários autenticados — como professores e administradores — possam agendar o uso de salas em horários disponíveis.

## ✨ Funcionalidades Principais

- Autenticação de usuários com **Devise**
- Autorizações por perfis de usuário (usuário comum e administrador) com **CanCanCan**
- Gerenciamento de instituições, blocos, andares e salas
- Sistema de reservas com verificação de disponibilidade por horário
- Tempo fixo de 2 horas por reserva em cada sala
- Seleção dinâmica da instituição ativa (automática se existir apenas uma) - cada sala, bloco e andar é associado a uma instituição
- Busca avançada e filtragem com **Ransack**
- Paginação com **Will_paginate**
- Geração de relatórios dos dados do sistema em PDF com **Wicked PDF**
- Painel administrativo com **Rails Admin**
- Interface dinâmica com uso de **AJAX**
- Testes automatizados com **RSpec** e **FactoryBot**

## 🛠️ Tecnologias e Gems Utilizadas

- **Ruby 3.3.0**
- **Rails 6.x**
- **PostgreSQL**
- **HTML, CSS, Bootstrap**
- **JavaScript & AJAX**
- **Gems:**
  - `devise`
  - `cancancan`
  - `will_paginate`
  - `ransack`
  - `wicked_pdf`
  - `wkhtmltopdf-binary`
  - `rails_admin`
  - `rspec-rails`
  - `factory_bot_rails`
  - `faker`
  - `dotenv-rails`
  - `hirb`

## 🧪 Testes

O projeto conta com uma suíte de testes utilizando **RSpec**, **FactoryBot** e **Faker**, cobrindo:

- Validações de modelos
- Métodos principais
- Comportamentos dos controllers
- Consultas SQL relacionadas à lógica de reserva

## 🔐 Autenticação e Autorização

- A autenticação é feita com a gem `Devise`
- A autorização de acessos e ações por tipo de usuário (comum e admin) é gerenciada com `CanCanCan`
- Apenas usuários logados podem criar ou visualizar reservas

## 🧠 Lógica de Negócio

- Cada reserva possui duração fixa de **2 horas**
- O sistema verifica se há conflitos de horário antes de permitir a criação de uma nova reserva
- Reservas podem ser feitas apenas por usuários autenticados
- As instituições funcionam como escopo: os recursos só aparecem após a seleção da instituição ativa

## 📈 Painel Administrativo

- Através do **Rails Admin**, administradores podem:
  - Acompanhar um dashboard de atividades
  - Gerenciar dados e recursos do sistema
  - Visualizar e editar registros de reservas, usuários, salas, blocos, etc.

## 📄 Relatórios

- Os relatórios em PDF são gerados usando as gems:
  - `wicked_pdf`
  - `wkhtmltopdf-binary`

## ⚙️ Configuração do Projeto

1. Clone o repositório  
   `git clone https://github.com/lucasMenezesM/reserva-de-sala`

2. Instale as dependências  
   `bundle install`

3. Configure o banco de dados  
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed

## **Contato**

- **GitHub**: [LucasMenezesM](https://github.com/lucasMenezesM)
- **Email**: livedolux@gmail.com
- **LinkedIn**: [linkedin.com/in/lucas-menezes-023600279](https://www.linkedin.com/in/lucas-menezes-023600279/)