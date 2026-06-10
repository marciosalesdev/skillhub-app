# SkillHub App

> Aplicativo mobile do SkillHub — desenvolvido em Flutter com autenticação JWT e integração à SkillHub API.

---

## Sobre o projeto

O **SkillHub App** é o front-end mobile da plataforma SkillHub, que conecta prestadores de serviços a contratantes. Desenvolvido em Flutter com suporte a Android e iOS, o app se integra à [SkillHub API](https://github.com/marciosalesdev/skillhub-api) via HTTP REST, gerenciando autenticação com JWT armazenado de forma segura no dispositivo.

---

## Funcionalidades

- Autenticação de usuários com JWT (login e manutenção de sessão)
- Armazenamento seguro do token com `flutter_secure_storage`
- Consumo da SkillHub API via HTTP
- Navegação entre telas com suporte a Material Design
- Suporte multiplataforma: Android, iOS e Web

---

## Tecnologias

| Categoria | Tecnologia / Pacote |
|---|---|
| Linguagem | Dart 3.5+ |
| Framework | Flutter |
| HTTP | `http ^1.2.0` |
| Autenticação | `jwt_decoder ^2.0.1` |
| Armazenamento seguro | `flutter_secure_storage ^9.0.0` |
| Ícones | `cupertino_icons ^1.0.8` |
| Plataformas | Android · iOS · Web |

---

## Arquitetura do projeto

```
skillhub-app/
├── android/              # Configurações nativas Android
├── ios/                  # Configurações nativas iOS
├── web/                  # Suporte à versão web
├── lib/                  # Código-fonte principal (Dart)
│   └── main.dart         # Entry point da aplicação
├── assets/
│   └── images/           # Recursos visuais (logo, banners)
├── test/                 # Testes do aplicativo
└── pubspec.yaml          # Dependências e configurações
```

---

## Integração com a API

O app consome a **SkillHub API** (back-end Spring Boot). O token JWT obtido no login é decodificado com `jwt_decoder` e armazenado com segurança via `flutter_secure_storage`, sendo enviado automaticamente nas requisições autenticadas.

Repositório da API: [github.com/marciosalesdev/skillhub-api](https://github.com/marciosalesdev/skillhub-api)

---

## Como executar

### Pré-requisitos

- Flutter SDK 3.5+
- Android Studio ou VS Code com extensão Flutter
- Emulador Android/iOS ou dispositivo físico
- SkillHub API em execução localmente ou em servidor

### Passos

1. Clone o repositório:
```bash
git clone https://github.com/marciosalesdev/skillhub-app.git
cd skillhub-app
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Configure a URL base da API no projeto (ex: `lib/constants.dart` ou direto no serviço HTTP):
```dart
const String baseUrl = 'http://localhost:8080';
```

4. Execute o app:
```bash
flutter run
```

---

## Build para produção

```bash
# Android APK
flutter build apk --release

# Android App Bundle (Google Play)
flutter build appbundle --release

# Web
flutter build web
```

---

## Autor

**Marcio Serra Sales**
- LinkedIn: [linkedin.com/in/marciosalesdev](https://www.linkedin.com/in/marciosalesdev)
- GitHub: [github.com/marciosalesdev](https://github.com/marciosalesdev)
