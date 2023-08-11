package api.app.home.buscaParcialApi;

import api.CommonsUtils;
import api.RequisicaoService;
import api.app.AppApiService;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.rest.SerenityRest;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

public class BuscaParcialApi extends AppApiService {

    private Headers headers;
    private Response response;
    public RequestSpecification request;
    private URI basePath;

    public Headers defineHeaders(String termo, String pagina, String tamanho, String token) {
        Header one = new Header("Authorization", "Bearer " + token + "");
        Header two = new Header("termo", termo);
        Header three = new Header("pagina", pagina);
        Header fuor = new Header("tamanho", tamanho);

        List<Header> header = new ArrayList<Header>();
        header.add(one);
        header.add(two);
        header.add(three);
        header.add(fuor);

        return this.headers = new Headers(header);
    }

    public Response defineRequest(Headers headers) throws URISyntaxException {
        request = SerenityRest.given();
            request.headers(headers);
        basePath = new URI(CommonsUtils.getEnvironmentVariable("buscaParcialAPIURL"));
        response = request.get(basePath);
        System.out.println(response.getBody().asString());
        return response;
    }

    public boolean encontravaloresJSON(Response response, String configs, String indice) {
        ArrayList<Boolean> results = new ArrayList<>();
        String[] datas = configs.split(", ");
        String value = buscaValorJsonPeloIndice(response,
                BuscaParcialApiENUM.valueOf(indice).getIndice().toString());
        System.out.println("Response: " + value);
        if (datas.length >= 1) {
            for (String data : datas) {
                System.out.println("Valor buscado: " + data);
                results.add(value.contains(data));
            }
        }
        return !results.contains(false);
    }
}
