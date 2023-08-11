package api.app;

import api.CommonsUtils;
import api.RequisicaoService;
import api.app.home.componentesApi.ApiComponentsENUM;
import io.restassured.module.jsv.JsonSchemaValidator;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.ProxySpecification;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.rest.SerenityRest;
import org.junit.Assert;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

public class AppApiService extends RequisicaoService {

    private String token;
    URL urlBasePathGtwDigital;

    public AppApiService(){
        if(!CommonsUtils.getSecurityVariables("username").equals("")){
            SerenityRest.useRelaxedHTTPSValidation();
            SerenityRest.proxy(
                    ProxySpecification.host("proxy-corp.bvnet.bv").
                            withPort(8080).
                            withAuth(CommonsUtils.getSecurityVariables("username"), CommonsUtils.getSecurityVariables("password")));
        }
    }

    public String getTokenAPP(String tipoCliente) throws MalformedURLException {
        this.urlBasePathGtwDigital = new URL(CommonsUtils.getEnvironmentVariable("basePathToken"));
        this.requestToken(this.urlBasePathGtwDigital, tipoCliente);
        return this.token;
    }

    private void requestToken(URL basePathToken, String tipoCliente){
        RequestSpecification requisicao = SerenityRest.given();
        requisicao.contentType("application/x-www-form-urlencoded");
        requisicao.
                formParam("client_id", CommonsUtils.getEnvironmentVariable("client_id")).
                formParam("client_secret", CommonsUtils.getEnvironmentVariable("client_secret")).
                formParam("grant_type", "password").
                formParam("username", CommonsUtils.pegarValorJson("data/massa."+tipoCliente+".cpf")).
                formParam("password", CommonsUtils.pegarValorJson("data/massa."+tipoCliente+".senha")).
                formParam("device_dna", CommonsUtils.getEnvironmentVariable("deviceDNA"));
        requisicao.log().all();
        Response retornoToken = requisicao.post(basePathToken);
        Assert.assertEquals(200, retornoToken.getStatusCode());
        this.token = retornoToken.jsonPath().get("access_token").toString();
    }

    public ValidatableResponse validaContratoAPI(Response response, File arquivo){
        System.out.println(response.then().body(JsonSchemaValidator.matchesJsonSchema(arquivo)));
        return response.then().body(JsonSchemaValidator.matchesJsonSchema(arquivo));
    }

    public String retornaStatusCode(Response response) {
        return String.valueOf(response.statusCode());
    }

    public String buscaValorJsonPeloIndice(Response response, String indice){
        String value = response.path(indice).toString();
        return value;
    }
}
