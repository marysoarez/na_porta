# na_porta

Desafio de desenvolvimento NaPorta
## Instalação

1. Clone o Repositório:
```bash
git clone https://github.com/marysoarez/na_porta.git

2. Altere a chave da API do Google Maps em `android/app/src/main/AndroidManifest.xml´ :
       
        <meta-data
            android:name="com.google.android.geo.API_KEY"
            android:value="SUA_API_KEY" />
        <meta-data
            android:name="com.google.android.gms.version"
            android:value="@integer/google_play_services_version" />
            
3. Altere a chave da API do Google Maps em `lib/scr/repository/map_repository.dart´ :
 const String google_api_key ="SUA_API_KEY";

4. Navegue até o diretório:
    cd na_porta
5.  Execute o aplicativo:
   
    flutter run



O aplicativo busca os dados na API "https://fb472438-131d-43e7-945d-e6231af5239a.mock.pstmn.io/api" e salva-os no banco de dados local, ficando disponível onffline.



