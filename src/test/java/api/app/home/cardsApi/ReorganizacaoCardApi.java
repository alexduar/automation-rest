package api.app.home.cardsApi;

import api.CommonsUtils;
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

public class ReorganizacaoCardApi extends AppApiService {

    Response response;
    private Headers headers;
    private RequestSpecification request;

    public Headers defineHeaders(String token, String versao) {
        Header one = new Header("Authorization", "Bearer " + token + "");
        Header two = new Header("accept", "application/json");
        Header fuor = new Header("content-type", "application/json");
        Header five = new Header("AppVersion", versao);

        List<Header> header = new ArrayList<Header>();
        header.add(one);
        header.add(two);
        header.add(fuor);
        header.add(five);

        return this.headers = new Headers(header);
    }

    public Response defineRequestReorganizcao(Headers header, String payload) throws URISyntaxException {
        SerenityRest.useRelaxedHTTPSValidation();
        request = SerenityRest.given();
        request
                .headers(header)
                .body(payload);
        URI url = new URI(CommonsUtils.getEnvironmentVariable("reorganizacaoAPIURL"));
        response = request.put(url);
        return response;
    }
}
