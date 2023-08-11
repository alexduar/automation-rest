package api.app.home.componentesApi;

public enum ApiComponentsENUM {

    ID_CONFIGURACOES("funcionalidades.componentes.componentes.configuracoes.id"),
    NOME_COMPONENTE("funcionalidades.componentes.componentes.nome"),
    COMPONENTE_VISIBILIDADE("funcionalidades.componentes.componentes.visivel"),
    NOME_MODULO_COMPONENTE("funcionalidades.componentes.nome"),
    TITULO_COMPONENTE("funcionalidades.componentes.componentes.titulo");

    private String componente;

    ApiComponentsENUM(String componente) {
        this.componente = componente;
    }

    public String getComponente(){
        return componente;
    }
}