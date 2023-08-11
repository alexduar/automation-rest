package api.app.home.buscaParcialApi.steps;

import api.app.home.buscaParcialApi.BuscaParcialApi;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.E;
import io.cucumber.java.pt.Entao;
import io.cucumber.java.pt.Quando;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import org.junit.Assert;

import java.net.MalformedURLException;
import java.net.URISyntaxException;

public class BuscaParcialStepsDefs {

    BuscaParcialApi buscaParcialApi;
    private String token;
    private Headers headers;
    private Response response;

    @Before
    public void beforeEach(){
        this.buscaParcialApi = new BuscaParcialApi();
    }

    @After
    public void afterEach() throws InterruptedException { Thread.sleep(2000); }

    @Dado("que seja resgatado o token do cliente {string} do busca parcial")
    public void que_seja_resgatado_o_token_do_cliente_do_busca_parcial(String cliente) throws MalformedURLException {
        this.token = buscaParcialApi.getTokenAPP(cliente);
    }


    @E("a request da busca parcial informe os headers contendo o termo {string} a pagina {string} o tamanho {string} e o token")
    public void aRequestDaBuscaParcialInformeOsHeadersContendoOTermoAPaginaOTamanhoEOToken(String termo, String pagina, String tamanho) {
        this.headers = buscaParcialApi.defineHeaders(termo, pagina, tamanho, token);
    }

    @Quando("acessar a url de busca parcial")
    public void acessarAUrlDeBuscaParcial() throws URISyntaxException {
        this.response = buscaParcialApi.defineRequest(headers);
    }

    @Entao("devera retornar os status {string} em busca parcial")
    public void deveraRetornarOsStatusEmBuscaParcial(String status) {
        Assert.assertEquals(status, buscaParcialApi.retornaStatusCode(response));
    }

    @E("devera retornar uma lista os titulos: {string}")
    public void deveraRetornarUmaListaOsTitulos(String titulosPesquisa) {
        Assert.assertTrue(buscaParcialApi.encontravaloresJSON(response, titulosPesquisa, "NOME"));
    }

    @E("devera retornar uma lista com as rotas respectivamente: {string}")
    public void deveraRetornarUmaListaComAsRotasRespectivamente(String rotasPesquisa) {
        Assert.assertTrue(buscaParcialApi.encontravaloresJSON(response, rotasPesquisa, "ROTA"));
    }
}
