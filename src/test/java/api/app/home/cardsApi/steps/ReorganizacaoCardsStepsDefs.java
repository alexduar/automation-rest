package api.app.home.cardsApi.steps;

import api.app.home.cardsApi.ReorganizacaoCardApi;
import api.app.home.componentesApi.ComponentsApi;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.E;
import io.cucumber.java.pt.Entao;
import io.cucumber.java.pt.Quando;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import org.json.simple.parser.ParseException;
import org.junit.Assert;

import java.net.MalformedURLException;
import java.net.URISyntaxException;

public class ReorganizacaoCardsStepsDefs {

    public String token;
    private ReorganizacaoCardApi reorganizacaoCardApi;
    private Headers headers;
    private ComponentsApi apiComponentes;
    public String payload;
    public Response response;

    @Before
    public void beforeEach(){
        this.reorganizacaoCardApi = new ReorganizacaoCardApi();
    }

    @After
    public void afterEach() throws InterruptedException { Thread.sleep(2000); }

    @Dado("que seja resgatado o token do cliente do app {string}")
    public void queSejaResgatadoOTokenDoClienteDoApp(String tipoCliente) throws MalformedURLException {
        if (this.token == null){
            this.token = reorganizacaoCardApi.getTokenAPP(tipoCliente);
        }
    }

    @E("seja definido os headers para api organizacao de cards com a versao {string}")
    public void sejaDefinidoOsHeadersParaApiOrganizacaoDeCards(String versao) {
        this.headers = reorganizacaoCardApi.defineHeaders(token, versao);
    }

    @Quando("realizar a postagem com o corpo da requisição os valores na seguinte ordem:")
    public void recebidoOCorpoDaRequisiçãoOsValoresNaSeguinteOrdem(String payload) throws URISyntaxException {
        this.payload = payload;
        System.out.println(payload);
        this.response = reorganizacaoCardApi.defineRequestReorganizcao(this.headers, this.payload);
    }

    @E("devera retornar os status {string} em organização")
    public void deveraRetornarOsStatusEmOrganização(String status) {
        Assert.assertEquals(status, reorganizacaoCardApi.retornaStatusCode(response));
    }

    @Entao("ao consultar a api componentes no home-list-card do cliente com as permissoes {string} e a versao {string}, devera vir na mesma ordem")
    public void aoConsultarAApiComponentesNoHomeListCardDoClienteDeveraVirNaMesmaOrdemENoMesmoValorDeVisibilidade(String permissoes, String versao) throws URISyntaxException, ParseException {
        apiComponentes = new ComponentsApi();
        Headers headersApiComponentes = apiComponentes.defineHeaders(token, permissoes, versao);
        apiComponentes.defineRequest(headersApiComponentes, "funcionalidade: CARROUSEL_CARDS_HOME_CONTA_PF");
        Assert.assertTrue(this.apiComponentes.validaValoresComponentes(this.payload, "NOME_COMPONENTE"));
    }

    @E("retornara a visibilidade do componentes de acordo com o que foi enviado")
    public void retornaraAVisibilidadeDoComponentesDeAcordoComOQueFoiEnviado() throws ParseException {
        Assert.assertTrue(this.apiComponentes.validaValoresComponentes(this.payload, "COMPONENTE_VISIBILIDADE"));
    }

    @E("ao consultar a api componentes no home-list-card do cliente, nao devera vir na mesma ordem enviada")
    public void aoConsultarAApiComponentesNoHomeListCardDoClienteNaoDeveraVirNaMesmaOrdemEnviada() {
        Assert.assertFalse(this.apiComponentes.validaVisibilidadeCorretaComponentes(this.payload));
    }

    @E("o componente {string} sera o ultimo")
    public void oComponenteSeraOUltimo(String card) {
    }

    @E("devera validar que o contrato da api reorganizar esta correto com {string}")
    public void deveraValidarQueOContratoDaApiEstaCorretoCom(String arquivo) {
        this.apiComponentes.validaEstruturaContrato(arquivo);
    }
}
