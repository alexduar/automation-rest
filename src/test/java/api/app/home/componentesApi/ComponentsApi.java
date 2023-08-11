package api.app.home.componentesApi;

import api.CommonsUtils;
import api.RequisicaoService;
import api.app.AppApiService;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.rest.SerenityRest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

public class ComponentsApi extends AppApiService {

    Response response;
    String local;
    RequestSpecification request;
    Headers headers;
    private URI basePath;

    public Headers defineHeaders(String token, String permissoes, String versao) {
        Header one = new Header("Authorization", "Bearer " + token + "");
        Header two = new Header("app", "BANCODIGITAL_PF");
        Header three = new Header("permissoes", permissoes);
        Header fuor = new Header("content-type", "application/json");
        Header five = new Header("appVersion", versao);

        List<Header> header = new ArrayList<Header>();
        header.add(one);
        header.add(two);
        header.add(three);
        header.add(fuor);
        header.add(five);

        return this.headers = new Headers(header);
    }

    public Response defineRequest(Headers header, String parametros) throws URISyntaxException {
        request = SerenityRest.given();
            request
                .headers(header);
            basePath = RequisicaoService.adicionaParametros
                    (CommonsUtils.getEnvironmentVariable("componentesAPIURL"), parametros);
            request.log().all();
            response = request.get(basePath);
            return response;
    }

    public String buscaValorJsonPeloIndiceCAAPI(String indice){
        return response.path(ApiComponentsENUM.valueOf(indice).getComponente()).toString();
    }

    public boolean encontravaloresJSON(String indice, String configs) {
        ArrayList<Boolean> results = new ArrayList<>();
        String[] datas = configs.split(", ");
        String value = buscaValorJsonPeloIndiceCAAPI(indice);
        System.out.println("Response: " + value);
        if (datas.length >= 1){
            for (String data : datas) {
                System.out.println("Valor buscado: " + data);
                results.add(value.contains(data));
            }
        }
        return !results.contains(false);
    }

    public boolean validaValoresComponentes(String payload, String indiceBusca) throws ParseException {
        ArrayList<Boolean> valida = new ArrayList<>();
        JSONParser parse = new JSONParser();

        JSONObject json = (JSONObject) parse.parse(payload);
        JSONArray text = (JSONArray) json.get("componentes");
        String[] valores = buscaValorJsonPeloIndiceCAAPI(indiceBusca).split(",");
        for (int i = 0; i < text.size(); i++){
            System.out.println(CommonsUtils.regex(valores[i]));
            valida.add(text
                    .get(i).toString()
                    .contains(CommonsUtils.regex(valores[i]))
            );
        }
        System.out.println(valida);
        return !valida.contains(false);
    }

    public boolean validaVisibilidadeCorretaComponentes(String payload) {
        return true;
    }

    public ValidatableResponse validaEstruturaContrato(String arquivo){
        return validaContratoAPI(response, CommonsUtils.pegaContratoJson(arquivo));
    }
}