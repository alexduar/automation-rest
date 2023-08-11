package api.app.home.componentesApi.steps;

import api.app.home.componentesApi.ComponentsApi;
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

public class ComponentsStepdefs {

    private ComponentsApi apiComponents;
    private Headers headers;
    private String token;
    private Response response;

    @Before
    public void initialize(){
        apiComponents = new ComponentsApi();
    }

    @After
    public void afterEach() throws InterruptedException { Thread.sleep(2000); }

    @Dado("a request informe os headers contendo o token com as permissoes {string} e a versao {string}")
    public void a_request_informe_os_headers_contendo_o_e(String permissoes, String versao) {
        this.headers = apiComponents.defineHeaders(this.token, permissoes, versao);
    }

    @Quando("acessar a url componentes informando os parametros {string}")
    public void ao_acessar_a_de_componentes(String params) throws URISyntaxException {
        this.response = apiComponents.defineRequest(this.headers, params);
    }

    @Dado("que seja resgatado o token do cliente {string}")
    public void queOResgateDoTokenNoAmbiente(String tipoCliente) throws MalformedURLException {
        if (this.token == null){
            this.token = apiComponents.getTokenAPP(tipoCliente);
        }
    }

    @Entao("devera retornar os status {string}")
    public void deveraRetornarOsStatus(String status) {
        Assert.assertEquals(status, apiComponents.retornaStatusCode(response));
    }

    @E("devera retornar os componentes com os campos {string}")
    public void deveraRetornarOsComponentesComOsCampos(String campoValidar) {
        apiComponents.encontravaloresJSON(campoValidar, "");
    }

    @E("devera retornar os {string} os componentes {string}")
    public void deveraRetornarOsOsComponentes(String indice, String valores) {
        Assert.assertTrue(apiComponents.encontravaloresJSON(indice, valores));
    }

    @E("nao devera retornar os {string} os componentes {string}")
    public void naoDeveraRetornarOsOsComponentes(String indice, String valores) {
        Assert.assertFalse(apiComponents.encontravaloresJSON(indice, valores));
    }

    @E("devera validar que o contrato da api esta correto com {string}")
    public void deveraValidarQueOContratoDaApiEstaCorretoCom(String arquivo) {
        apiComponents.validaEstruturaContrato(arquivo);
    }
}
